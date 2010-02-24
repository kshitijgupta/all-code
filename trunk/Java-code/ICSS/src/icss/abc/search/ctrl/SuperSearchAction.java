package icss.abc.search.ctrl;

import icss.abc.base.db.DBConnection;
import icss.abc.quicksearch.Q_sorter;
import icss.abc.search.MyMap;
import icss.abc.search.Segment;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class SuperSearchAction {

	private String searchtext;

	private String items;

	private String times;

	private String fileauthor;

	private String filetype;

	private String filescope;

	private String similarwords;

	private ArrayList<MyMap> maplist = new ArrayList<MyMap>();
	private MyMap[] mms;

	public ArrayList<MyMap> getMaplist() {
		return maplist;
	}

	public void setMaplist(ArrayList<MyMap> maplist) {
		this.maplist = maplist;
	}

	public MyMap[] getMms() {
		return mms;
	}

	public void setMms(MyMap[] mms) {
		this.mms = mms;
	}

	public String getItems() {
		return items;
	}

	public void setItems(String items) {
		this.items = items;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public String getFileauthor() {
		return fileauthor;
	}

	public void setFileauthor(String fileauthor) {
		this.fileauthor = fileauthor;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

	public String getFilescope() {
		return filescope;
	}

	public void setFilescope(String filescope) {
		this.filescope = filescope;
	}

	public String getSimilarwords() {
		return similarwords;
	}

	public void setSimilarwords(String similarwords) {
		this.similarwords = similarwords;
	}

	public String getSearchtext() {
		return searchtext;
	}

	public void setSearchtext(String searchtext) {
		this.searchtext = searchtext;
	}

	public String execute() {

		//System.out.println(searchtext);
		System.out.println("items= "+items);
		//System.out.println(times);
		//System.out.println(fileauthor);
		//System.out.println(filetype);
		//System.out.println(filescope);
		//System.out.println(similarwords);

		
		SuperFileter.setPageSize(items);
		
		
		java.util.Date usetime1 = new java.util.Date();
		long time1 = usetime1.getTime();
		// System.out.println(searchtext);

		List<String> ls = Segment.cutter(searchtext);
		
		
		//近义词搜索
		if(similarwords.equals("1")){
			List<String> addls = new ArrayList<String>();
			List<String> addls2 = new ArrayList<String>();
			for (int i = 0; i < ls.size(); i++) {
				addls = SuperFileter.addWords(ls.get(i));
				for(int j=0; j<addls.size(); j++){
					if(!addls.get(j).equals(ls.get(i)))
						addls2.add(addls.get(j));
				}
			}
			
			for(int k=0; k<addls2.size(); k++){
				ls.add(addls2.get(k));
			}
		}
		
		

		// File f = new File("keywords.txt");

		for (int i = 0; i < ls.size(); i++) {
			String strmatcher = (String) ls.get(i);// 切出的一个词

			try {
				FileReader fr = new FileReader("d:/keywords.txt");
				BufferedReader br = new BufferedReader(fr);
				String lineContent = null;
				while ((lineContent = br.readLine()) != null) {
					StringTokenizer st = new StringTokenizer(lineContent, " ");

					if (strmatcher.equals(st.nextToken())) {
						String strfile = st.nextToken();

						StringTokenizer stfileid = new StringTokenizer(strfile,
								",");
						while (stfileid.hasMoreTokens()) {
							String fn = stfileid.nextToken();

							StringTokenizer idcounter = new StringTokenizer(fn,
									"-");

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

										// 加入过滤条件
										if (SuperFileter.myFilter(fileid,
												times, fileauthor, filetype,
												filescope)) {
											existmp.setMycounter(existmp
													.getMycounter()
													+ counter);
											break;
										}
									}
								}
								if (j == maplist.size()) {
									if (SuperFileter.myFilter(fileid, times,
											fileauthor, filetype, filescope)) {
										maplist.add(hm);
									}

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

		/*
		 * for(int k=0;k<maplist.size();k++){ MyMap mm = (MyMap)maplist.get(k);
		 * System.out.println(mm.getMyfileid()+":"+mm.getMycounter()); }
		 */
		MyMap[] a = new MyMap[] { new MyMap(0, 0) };
		mms = (MyMap[]) maplist.toArray(a);
		Q_sorter<MyMap> qs = new Q_sorter<MyMap>();
		qs.sort(mms, 0, maplist.size());

		/*
		 * if (mms[0] != null) { for (int k = 0; k < mms.length; k++)
		 * System.out.println(mms[k].getMyfileid() + ":" +
		 * mms[k].getMycounter()); }
		 */
		java.util.Date usetime2 = new java.util.Date();
		long time2 = usetime2.getTime();

		// 把mms放到request里
		ActionContext ctx = ActionContext.getContext();

		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);

		request.setAttribute("mms", mms);
		request.setAttribute("usetime", new Long(time2 - time1));

		// System.out.println(time2);
		// System.out.println(time1);
		return "success";
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
