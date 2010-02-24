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
       ArrayList numOfShipinD = new ArrayList();
       ArrayList numOfYinpinD = new ArrayList();
       ArrayList numOfQitaD = new ArrayList();
       Connection conn=null;
       Statement stmt=null;
       Statement stmt2=null;
       ResultSet rs=null;
       ResultSet rs2=null;
       try{
            conn = DBConnection.getConnection();
      
        stmt = conn.createStatement();
        stmt2 = conn.createStatement();
       String sql="select filetype from abcfile";
       String sql2="select downloadtimes from abcfile";
       
        rs = stmt.executeQuery(sql);
        rs2 = stmt2.executeQuery(sql2);
        rs2.next();
    while(rs.next()){
           if(rs.getString("filetype").equalsIgnoreCase("movie"))
                numOfShipinD.add(rs2.getInt("downloadtimes"));
           if(rs.getString("filetype").equalsIgnoreCase("music"))
               numOfYinpinD.add(rs2.getInt("downloadtimes"));
           if(rs.getString("filetype").equalsIgnoreCase("other"))
               numOfQitaD.add(rs2.getInt("downloadtimes"));
               rs2.next();
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

        int maxSize = numOfShipinD.size();
        if(numOfYinpinD.size() > maxSize)
            maxSize = numOfYinpinD.size();
        if(numOfQitaD.size() > maxSize)
            maxSize = numOfQitaD.size();
        
        int i;
//------数据线------
String dataLine1="视频";
String dataLine2="音频";
String dataLine3="其他";
//------数据列------
String[] dataCol =new String[maxSize];
  for(i = 0; i < maxSize; i++)
  dataCol[i]=String.valueOf(i);
//------创建数据集,并设置值------
DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();
for(i = 0;i < numOfShipinD.size();i++){
    categoryDataset.addValue((Integer)numOfShipinD.get(i),dataLine1,dataCol[i]);}
for(i = 0;i < numOfYinpinD.size();i++){
    categoryDataset.addValue((Integer)numOfYinpinD.get(i),dataLine2,dataCol[i]);}
for(i = 0;i < numOfQitaD.size();i++){
    categoryDataset.addValue((Integer)numOfQitaD.get(i),dataLine3,dataCol[i]);}

//------创建线图------
String titleString="下载次数统计折线图";//图的标题
JFreeChart chart =ChartFactory.createLineChart(titleString,"","下载次数",categoryDataset,PlotOrientation.VERTICAL,true,true,false);
ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,500,300);
%>
</body>
</html>