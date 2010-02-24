package icss.abc.mail.servlet;

import icss.abc.mail.base.JavaMail;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendMailServlet extends HttpServlet implements Serializable {

	private static final long serialVersionUID = -950824516449626887L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		perform(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		perform(request, response);
	}

	public void perform(HttpServletRequest req, HttpServletResponse res) {
		String deptids = req.getParameter("sendToGroup");
		// String sendFrom = req.getParameter("sendFrom");
		String sendTo = req.getParameter("sendTo");
		String subject = req.getParameter("mainTitle");
		String mailcontent = req.getParameter("textarea");
		if (mailcontent == null)
			mailcontent = "";
		if (sendTo == null)
			sendTo = "";
		/*
		 * System.out.println(deptids); System.out.println(sendFrom);
		 * System.out.println(sendTo); System.out.println(subject);
		 * System.out.println(mailcontent);
		 */
		try {
			// 设置发信
			// 设置服务器
			JavaMail themail = new JavaMail("127.0.0.1");
			themail.setNeedAuth(true);
			if (themail.setSubject(subject) == false) {
				req.getRequestDispatcher("../error.jsp").forward(req, res);
			}
			// 邮件内容 支持html 如 <font color=red>欢迎光临</font> <a
			// href=\"http://www.laabc.com\">啦ABC</a>
			if (themail.setBody(mailcontent) == false) {
				req.getRequestDispatcher("../error.jsp").forward(req, res);
			}
			// 发件人邮箱
			if (themail.setFrom("luolei@luoleiscomputer") == false) {
				req.getRequestDispatcher("../error.jsp").forward(req, res);
			}
			// 得到收信人list
			List<String> receivers = themail.getReceiverList(sendTo, deptids);
			for (int i = 0; i < receivers.size(); i++) {
				// 设置收件人邮箱
				if (themail.setTo(receivers.get(i)) == false) {
					return;
				}
				themail.setNamePass("luolei", "luolei"); // 用户名与密码
				if (themail.sendout() == false) {
					req.getRequestDispatcher("../error.jsp").forward(req, res);
				}

			}
			req.getRequestDispatcher("../success.jsp").forward(req, res);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
