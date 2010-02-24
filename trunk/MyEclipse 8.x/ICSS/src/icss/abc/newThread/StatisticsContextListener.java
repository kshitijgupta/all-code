package icss.abc.newThread;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


/** *//**                      so~~~~~~~~~~~~~~~cool !!!!!!!!!!!~~~~~~~~~~~~~~~~~~~~~``
 * ͳ��ContextListener
 *
 */
public class StatisticsContextListener implements ServletContextListener
{

    private java.util.Timer timer = null;
    
    
    /** *//**
     * ���������WebӦ�÷������ý��������ʱ�򱻵��á�
     * 
     * @see javax.servlet.ServletContextListener#contextInitialized(javax.servlet.ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event) 
    {
        timer = new java.util.Timer(true);
        event.getServletContext().log("��ʱ��������");
        
        ServletContext application = event.getServletContext();		
		int counter = 0;
		application.setAttribute("counter",counter);
        
		timer.schedule(new StatisticsTask(application), 0, 60*60*1000);//ÿ��1Сʱ
        event.getServletContext().log("�Ѿ����������ȱ�");
    }
    
    
    /** *//**
     * ���������WebӦ�÷����Ƴ���û�������ٽ��������ʱ�򱻵��á�
     * 
     * @see javax.servlet.ServletContextListener#contextDestroyed(javax.servlet.ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent event)
    {
        timer.cancel();
        event.getServletContext().log("��ʱ������");
    }

}
