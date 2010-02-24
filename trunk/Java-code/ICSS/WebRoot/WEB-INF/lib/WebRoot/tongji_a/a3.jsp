<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="icss.abc.base.db.DBConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.jfree.chart.JFreeChart,
org.jfree.chart.ChartUtilities,
org.jfree.chart.ChartFactory,
org.jfree.data.general.DefaultPieDataset"%>
    <html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head>
<body>
       <%String name ="";
       int numOfShipin = 0;
       int numOfYinpin = 0;
       int numOfQita = 0;
       Connection conn=null;
       Statement stmt=null;
       ResultSet rs=null;
       try{
            conn = DBConnection.getConnection();
      
        stmt = conn.createStatement();
       String sql="select describe from abcfile";
       
        rs = stmt.executeQuery(sql);
    while(rs.next()){
           if(rs.getString("describe").equalsIgnoreCase("视频"))
               numOfShipin++; 
           if(rs.getString("describe").equalsIgnoreCase("音频"))
               numOfYinpin++;
           if(rs.getString("describe").equalsIgnoreCase("其他"))
               numOfQita++;               
    }
       }catch(Exception e){
           String a = e.toString();
           System.out.println(""+e.toString());
       }finally{
           try{
           if(rs!=null) rs.close();
           if(stmt!=null)stmt.close();
           if(conn!=null)conn.close();}
           catch(Exception e2){
               
           }
       }
    

    
    
    

String dataName[]=new String[]{"视频","音频","其他"};//显示数据系列
int dataValueCount[]={numOfShipin,numOfYinpin,numOfQita};//数据系列对应的值
//------创建数据集,并设置值------
DefaultPieDataset pieDataset = new DefaultPieDataset();
for(int i=0;i<dataName.length;i++)
   pieDataset.setValue(dataName[i],dataValueCount[i]);
String titleString="文件类型分布统计图";//图的标题
JFreeChart chart = ChartFactory.createPieChart(titleString,pieDataset,true,true, false);
ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,500,300);
%>

</body>
</html>