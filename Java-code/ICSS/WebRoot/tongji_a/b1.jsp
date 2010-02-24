<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="icss.abc.base.db.DBConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.jfree.chart.JFreeChart,org.jfree.chart.ChartUtilities,
      org.jfree.chart.ChartFactory,
     org.jfree.chart.plot.PlotOrientation,
    org.jfree.data.category.DefaultCategoryDataset,
    java.io.*,com.lowagie.text.pdf.*,com.lowagie.text.*,
    java.awt.Graphics2D,java.awt.geom.Rectangle2D,java.util.*"%>
<html>
<body>
        <%String name ="";
       ArrayList times = new ArrayList(); 
       Connection conn=null;
       Statement stmt=null;
       Statement stmt2=null;
       ResultSet rs=null;
       ResultSet rs2=null;
       try{
           conn = DBConnection.getConnection();
        stmt = conn.createStatement();
        stmt2 = conn.createStatement();
       String sql="select time from scan";
       String sql2="select scantimes from scan";
        rs = stmt.executeQuery(sql);
        rs2 = stmt2.executeQuery(sql2);
while(rs2.next()){
                times.add(rs2.getInt("scantimes"));
    }
       
//------数据线------
String dataLine1="访问人数";
//------数据列------
int maxSize = times.size();
String[] dataCol =new String[maxSize];
int i;
  for(i = 0; i < maxSize; i++){
    rs.next();
  dataCol[i]=String.valueOf(rs.getDate("time"));
  }
  
  
//------创建数据集,并设置值------

DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();
for(i = 0;i < maxSize;i++){
    categoryDataset.addValue((Integer)times.get(i),dataLine1,dataCol[i]);
    }

//------创建线图------
String titleString="访问人数直方图";//图的标题
JFreeChart chart = ChartFactory.createBarChart3D(titleString,"用户年龄阶段","数量",
categoryDataset,PlotOrientation.VERTICAL,true,true,false);
ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,1000,600);

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
%>
</body>
</html>