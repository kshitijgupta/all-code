package icss.abc.log;

import icss.abc.log.base.dao.LogBaseDAO;
import icss.abc.log.vo.LogVO;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class LogInOut implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("watchout, someone has came in");
		
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("oh, someone left!");
		LogVO vo = new LogVO();
		LogBaseDAO dao = new LogBaseDAO();
		vo.setLogid(3);//3��ʾ��¼���ǵǳ���־
		vo.setUserid((Integer)(arg0.getSession().getAttribute("userid")));
		vo.setUserip("");
		vo.setDescribe("�ǳ���¼");
		dao.setLog(3, vo);
	}

}
