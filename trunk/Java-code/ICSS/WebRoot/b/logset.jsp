<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="icss.abc.base.db.DBConnection" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'logset.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%	
     String[] outDBFileIDs=request.getParameterValues("checkbox");
     String s = "";
     int size=outDBFileIDs.length; 
     s=outDBFileIDs[0];   
     for(int i=1; i<size;i++)
     {
         s+=","+outDBFileIDs[i];
     }
%>    
  <%
  Connection conn = null;
  Statement stmt = null;
  
  conn = DBConnection.getConnection();
  String sql = "update abclog set record = 1 where logid in( "+ s+" )";
  stmt = conn.createStatement();
  stmt.execute(sql);
  
  
  
   %>
   设置成功    <a href="javascript:history.back(-1);">返回</a>
  </body>
</html>
