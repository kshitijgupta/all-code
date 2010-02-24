package icss.abc.search.ctrl;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import icss.abc.base.db.DBConnection;
import icss.abc.quicksearch.Q_sorter;
import icss.abc.search.MyMap;
import icss.abc.search.Segment;

public class SearchresultAction {

	private List<MyMap> maplist = new ArrayList<MyMap>();
	private List<MyMap> resultlist = new ArrayList<MyMap>();
	private MyMap[] resultmms;
	private MyMap[] lastmms;
	private String searchtext;

	public String execute() {
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();

		lastmms = (MyMap[]) session.getAttribute("hiddenmms");
		// lastmms = (MyMap[])req.getAttribute("hiddenmms");

		java.util.Date usetime1 = new java.util.Date();
		long time1 = usetime1.getTime();
		//System.out.println(searchtext);

		if (lastmms == null) {
			//System.out.println("lastmms是null");
			resultmms = new MyMap[1];
			resultmms[0] = null;
		} else if (lastmms[0] != null) {

			List cutterls = Segment.cutter(searchtext);

			for (int i = 0; i < cutterls.size(); i++) {
				String strmatcher = (String) cutterls.get(i);// 切出的一个词

				try {
					FileReader fr = new FileReader("d:/keywords.txt");
					BufferedReader br = new BufferedReader(fr);
					String lineContent = null;
					while ((lineContent = br.readLine()) != null) {
						StringTokenizer st = new StringTokenizer(lineContent,
								" ");

						if (strmatcher.equals(st.nextToken())) {
							String strfile = st.nextToken();

							StringTokenizer stfileid = new StringTokenizer(
									strfile, ",");
							while (stfileid.hasMoreTokens()) {
								String fn = stfileid.nextToken();

								StringTokenizer idcounter = new StringTokenizer(
										fn, "-");

								boolean rightdept = isRightDept(Integer
										.parseInt(idcounter.nextToken()));
								boolean hasPower = hasPower(Integer
										.parseInt(idcounter.nextToken()));

								if (rightdept && hasPower) {
									int fileid = Integer.parseInt(idcounter
											.nextToken());
									int counter = Integer.parseInt(idcounter
											.nextToken());

									MyMap hm = new MyMap(fileid, counter);
									int j = 0;
									for (j = 0; j < maplist.size(); j++) {
										MyMap existmp = (MyMap) maplist.get(j);
										if (existmp.getMyfileid() == fileid) {
											// existhm.remove(fileid);

											existmp.setMycounter(existmp
													.getMycounter()
													+ counter);
											break;
										}
									}
									if (j == maplist.size()) {
										maplist.add(hm);

									}
								}
							}
						}
					}
				} catch (Exception e) {
					System.out.println("错误是：" + e.toString());
					e.printStackTrace();
				}

			}

			for (int i = 0; i < maplist.size(); i++) {

				for (int j = 0; j < lastmms.length; j++) {
					MyMap map = (MyMap) maplist.get(i);
					MyMap one = (MyMap) lastmms[j];
					if (map.getMyfileid() == one.getMyfileid()) {
						resultlist.add(new MyMap(one.getMyfileid(), one
								.getMycounter()
								+ map.getMycounter()));

						break;
					}
				}

			}

			MyMap[] a = new MyMap[] { new MyMap(0, 0) };
			resultmms = (MyMap[]) resultlist.toArray(a);
			Q_sorter<MyMap> qs = new Q_sorter<MyMap>();
			qs.sort(resultmms, 0, resultlist.size());

		} else {
			resultmms = new MyMap[1];
			resultmms[0] = null;
		}

		/*if (resultmms[0] != null) {
			for (int k = 0; k < resultmms.length; k++)
				System.out.println(resultmms[k].getMyfileid() + ":"
						+ resultmms[k].getMycounter());
		}*/
		java.util.Date usetime2 = new java.util.Date();
		long time2 = usetime2.getTime();

		// 把mms放到request里
		ActionContext ctx = ActionContext.getContext();

		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);

		request.setAttribute("mms", resultmms);
		request.setAttribute("usetime", new Long(time2 - time1));

		//System.out.println(time2);
		//System.out.println(time1);

		return "success";
	}

	public MyMap[] getResultmms() {
		return resultmms;
	}

	public void setResultmms(MyMap[] resultmms) {
		this.resultmms = resultmms;
	}

	public MyMap[] getLastmms() {
		return lastmms;
	}

	public void setLastmms(MyMap[] lastmms) {
		this.lastmms = lastmms;
	}

	public String getSearchtext() {
		return searchtext;
	}

	public void setSearchtext(String searchtext) {
		this.searchtext = searchtext;
	}

	private boolean hasPower(int filepower) {

		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();

		int userid = (Integer) session.getAttribute("userid");
		int userpower = 101;

		String sql = "select power from userpower where userid = " + userid;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				userpower = rs.getInt("power");
			}

			if (userpower <= filepower)// 管理员可以查看一切文件
				return true;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					DBConnection.releaseConnection(con);
			} catch (Exception e) {

			}
		}
		return false;
	}

	private boolean isRightDept(int filedept) {

		if (filedept == 1)// 如果文件是公开的，那么就不用进行判断了
			return true;

		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();

		int userid = (Integer) session.getAttribute("userid");
		int userdept = -1;

		String sql = "select departmentid from userdept where userid = "
				+ userid;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				userdept = rs.getInt("departmentid");
			}

			if (userdept == 0)// 管理员可以查看一切文件
				return true;

			else if (userdept == filedept)// 用户部门和文件部门对应正确
				return true;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					DBConnection.releaseConnection(con);
			} catch (Exception e) {

			}
		}

		return false;
	}

}
