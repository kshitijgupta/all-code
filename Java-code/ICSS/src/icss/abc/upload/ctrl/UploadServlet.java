package icss.abc.upload.ctrl;

import icss.abc.base.db.DBConnection;
import icss.abc.base.db.KeyValue;
import icss.abc.file.dao.FileDAO;
import icss.abc.file.dao.FileDAOImpl;
import icss.abc.file.vo.FileVO;
import icss.abc.log.base.dao.LogBaseDAO;
import icss.abc.log.vo.LogVO;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.*;

public class UploadServlet extends HttpServlet implements Serializable {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		perform(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		perform(request, response);
	}

	public void perform(HttpServletRequest req, HttpServletResponse res) {
		String redirect = "/success.jsp";
		

		try {
		
			// �½�һ��SmartUpload����
			SmartUpload su = new SmartUpload();
			// �ϴ���ʼ��
			su.initialize(config, req, res);
			// �趨�ϴ�����
			// �������ϴ����ݵĳ��ȡ�1G?
			su.setTotalMaxFileSize(1024*1024 * 1024 * 1024);
			// �趨��ֹ�ϴ����ļ���ͨ����չ�����ƣ�,��ֹ�ϴ�����exe,bat,jsp,htm,html��չ�����ļ���û����չ�����ļ���
			su.setDeniedFilesList("exe,bat,jsp,htm,html");
			
			com.jspsmart.upload.Request   myrequest=su.getRequest();   
			// �ϴ��ļ�
			su.upload();

			// �ϴ����ļ��ĸ���
			int count = su.getFiles().getCount();
			
			String s = "";

			for (int i = 0; i < count; ++i) {
				File file = su.getFiles().getFile(i);

				if (file.isMissing()) {
					continue;
				}

				String fileExt = file.getFileExt();
				String fileName = file.getFileName();
				
				s+= fileName;
				// ���ݿ����
				FileDAO dao = new FileDAOImpl();
				FileVO vo = new FileVO();

				vo.setFilename(fileName);
				if (myrequest.getParameter("fileauthor") != null)
					vo.setFileauthor(myrequest.getParameter("fileauthor"));
				else
					vo.setFileauthor("");
				if (myrequest.getParameter("filelabel") != null)
					vo.setFilelabel(myrequest.getParameter("filelabel"));
				else
					vo.setFilelabel("");
				if (myrequest.getParameter("describe") != null)
					vo.setFiledescribe(myrequest.getParameter("describe"));
				else
					vo.setFiledescribe("");

				vo.setFlag(0);
				vo.setSqldate(new java.sql.Date(new java.util.Date()
								.getTime()));
				vo.setFilepower(Integer.parseInt(myrequest
								.getParameter("filepower")));

				whichdept = Integer.parseInt(myrequest.getParameter("filedept"));

				if (whichdept == 0) {
					vo.setDeptid(1);
				} else if (whichdept == 1) {
					HttpSession session = req.getSession();
					int userid = (Integer) session.getAttribute("userid");

					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;
					int userdeptid = -1;

					String sql = "select departmentid from userdept where userid = "
							+ userid;

					try {
						conn = DBConnection.getConnection();
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);

						while (rs.next()) {
							userdeptid = rs.getInt("department");
						}

						vo.setDeptid(userdeptid);

					} catch (Exception e) {

					} finally {
						if (rs != null)
							rs.close();
						if (stmt != null)
							stmt.close();
						if (conn != null)
							conn.close();
					}

				}

				filetype = Integer.parseInt(myrequest.getParameter("filetype"));
				if (filetype == -1)
					vo.setFiletype("");
				else if (filetype == 0)
					vo.setFiletype("music");
				else if (filetype == 1)
					vo.setFiletype("movie");
				else if (filetype == 2)
					vo.setFiletype("picture");
				else if (filetype == 3)
					vo.setFiletype("other");
				//fileURL��FileDAOImpl��protected void initPreparedParamer(PreparedStatement stmt, KeyValue paramter, int id)����ʵ��
				//String sURL = "source/"+vo.getFilename();
				//vo.setFileURL(sURL);
				try{
					dao.insert(vo);
					file.saveAs("/source/" + vo.getFilename() ,SmartUpload.SAVE_VIRTUAL);
				}catch(Exception e){
					System.out.println("hoho���Ǵ���"+e.toString());
				}
				
				
			}
			
			//��¼��־
			HttpSession session = req.getSession();
			int dbuserid = (Integer)session.getAttribute("userid");
			LogVO vo = new LogVO();
			LogBaseDAO dao = new LogBaseDAO();
			vo.setLogid(4);//4��ʾ��¼�����ϴ�����
			vo.setUserid(dbuserid);//dbuserid��session��ȡ
			vo.setUserip(req.getRemoteAddr());
			vo.setDescribe("�ϴ���¼"+s);
			dao.setLog(4, vo);
			

			req.getRequestDispatcher(redirect).forward(req, res);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		this.config = config;
	}

	private int whichdept;
	// private int filepower;
	private int filetype;
	// private String fileauthor;
	// private String filelabel;
	// private String describe;
	private boolean reasult = false;
	private static final long serialVersionUID = -950824516449626887L;

}
