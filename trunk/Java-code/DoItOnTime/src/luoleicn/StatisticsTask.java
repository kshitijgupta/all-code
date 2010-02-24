package luoleicn;
import java.util.Calendar;
import java.util.TimerTask;

import javax.servlet.ServletContext;


/** *//**
 * ͳ������
 * @author westd
 *
 */
public class StatisticsTask extends TimerTask
{

    private static final int STATISTICS_SCHEDULE_HOUR = 12;
    private static boolean isRunning = false;
    private ServletContext context = null;

    public StatisticsTask(ServletContext context)
    {
        this.context = context;
    }
    
    @Override
    public void run()
    {
        Calendar cal = Calendar.getInstance(); 
        //System.out.println(isRunning);
        if (!isRunning) 
        { 
            if (STATISTICS_SCHEDULE_HOUR == cal.get(Calendar.HOUR_OF_DAY)) //�鿴�Ƿ�Ϊ�賿
            { 
                isRunning = true; 
                context.log("��ʼִ��ָ������");
                
                //TODO ����Զ������ϸ����
                executeTask();
                
                //ָ������ִ�н���
                isRunning = false;
                context.log("ָ������ִ�н���"); 
            } 
        } 
        else 
        {
            context.log("��һ������ִ�л�δ����");
        }
    
    }

    /** *//**
     * ִ������
     */
    public void executeTask()
    {
        System.out.println("����1");
        System.out.println("����2");
    }
}
