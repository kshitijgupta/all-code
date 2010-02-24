package icss.abc.search.ctrl;

import icss.abc.base.db.DBConnection;
import icss.abc.quicksearch.Q_sorter;
import icss.abc.search.MyMap;
import icss.abc.search.Segment;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class SearchAction {

	private String searchtext;
	private ArrayList<MyMap> maplist = new ArrayList<MyMap>();
	private MyMap[] mms;

	public MyMap[] getMms() {
		return mms;
	}

	public void setMms(MyMap[] mms) {
		this.mms = mms;
	}

	public String getSearchtext() {
		return searchtext;
	}

	public void setSearchtext(String searchtext) {
		this.searchtext = searchtext;
	}

	public List getMaplist() {
		return maplist;
	}

	public void setMaplist(ArrayList maplist) {
		this.maplist = maplist;
	}

	public String execute() {

		java.util.Date usetime1 = new java.util.Date();
		long time1 = usetime1.getTime();
		//System.out.println(searchtext);

		List ls = Segment.cutter(searchtext);

		// File f = new File("keywords.txt");

		for (int i = 0; i < ls.size(); i++) {
			String strmatcher = (String) ls.get(i);// �г���һ����

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
				System.out.println("�����ǣ�" + e.toString());
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

		/*if (mms[0] != null) {
			for (int k = 0; k < mms.length; k++)
				System.out.println(mms[k].getMyfileid() + ":"
						+ mms[k].getMycounter());
		}*/
		java.util.Date usetime2 = new java.util.Date();
		long time2 = usetime2.getTime();

		// ��mms�ŵ�request��
		ActionContext ctx = ActionContext.getContext();

		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);

		request.setAttribute("mms", mms);
		request.setAttribute("usetime", new Long(time2 - time1));

		//System.out.println(time2);
		//System.out.println(time1);
		return "success";
	}

	private boolean hasPower(int filepower) {
		
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();

		int userid = (Integer) session.getAttribute("userid");
		int userpower = 101;
		
		String sql = "select power from userpower where userid = "+ userid;
		
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

			if (userpower <= filepower)//����Ա���Բ鿴һ���ļ�
				return true;

			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{   
            try {
    			if(rs!=null)			rs.close();
    			if(stmt!=null) 			stmt.close();
    			if(con!=null) 			DBConnection.releaseConnection(con);
            } catch (Exception e) {
            	
            }              
        }
		return false;
	}

	private boolean isRightDept(int filedept) {

		if (filedept == 1)//����ļ��ǹ����ģ���ô�Ͳ��ý����ж���
			return true;

		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();

		int userid = (Integer) session.getAttribute("userid");
		int userdept = -1;

		String sql = "select departmentid from userdept where userid = " + userid;
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

			if (userdept == 0)//����Ա���Բ鿴һ���ļ�
				return true;

			else if (userdept == filedept)//�û����ź��ļ����Ŷ�Ӧ��ȷ
				return true;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{   
            try {
    			if(rs!=null)			rs.close();
    			if(stmt!=null) 			stmt.close();
    			if(con!=null) 			DBConnection.releaseConnection(con);
            } catch (Exception e) {
            	
            }              
        }
		

		return false;
	}

}
