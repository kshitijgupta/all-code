package icss.abc.newThread;
import icss.abc.base.db.DBConnection;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Calendar;
import java.util.TimerTask;

import javax.servlet.ServletContext;



/** *//**
 * 统计任务
 * @author westd
 *
 */
public class StatisticsTask extends TimerTask
{

    private static final int STATISTICS_SCHEDULE_HOUR = 23;
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
        { 	//System.out.println(cal.get(Calendar.HOUR_OF_DAY)+"");
            if (STATISTICS_SCHEDULE_HOUR == cal.get(Calendar.HOUR_OF_DAY)) //查看是否为凌晨
            { 
                isRunning = true; 
                context.log("开始执行指定任务");
                
                //TODO 添加自定义的详细任务
                executeTask();
                
                //指定任务执行结束
                isRunning = false;
                context.log("指定任务执行结束"); 
            } 
        } 
        else 
        {
            context.log("上一次任务执行还未结束");
        }
    
    }

    /** *//**
     * 执行任务
     */
    public void executeTask()
    {
        System.out.println("任务1");
        myTask();
        System.out.println("任务1完成");
    }
    
    public void myTask(){
    	
    	Connection conn = null;
    	PreparedStatement stmt = null;
    	ResultSet rs = null;
    	String sql = "insert into scan(id, time, scantimes) values(SEQ_COUNTER.NextVal,?,?)";
    	
    	int counter = -1;
    	if((Integer)context.getAttribute("counter") != null ){
    		System.out.println("asdfas");
    	}
    	else{
    		System.out.println(" null");
    	}
    	counter = (Integer)context.getAttribute("counter");
    	System.out.println(counter+"");
    	try {
    		
    		java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
    		
			conn = DBConnection.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setDate(1, date);
			stmt.setInt(2, counter);
			stmt.execute();
			context.setAttribute("counter", 0);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
				try {
					if(stmt!=null)
						stmt.close();
					if(conn!=null)
						conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		
    }
}
