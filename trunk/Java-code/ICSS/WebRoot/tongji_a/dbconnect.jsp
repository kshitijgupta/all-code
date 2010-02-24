<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="icss.abc.base.db.DBConnection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

    <h1>JSP Page</h1>
    
   <%String name =""; System.out.println("adsfasdfasd3123"+name);
       try{
         Connection   conn = DBConnection.getConnection();
      
       Statement stmt = conn.createStatement();
       String sql="select filename from testuser.abcfile where fileid = 1";
       
       ResultSet rs = stmt.executeQuery(sql);
        System.out.println("123123123"+name);
    while(rs.next()){
           name = rs.getString("filename"); 
           System.out.println("dggfgf"+name);
    }
       }catch(Exception e){
           System.out.println(""+e.toString());
       }
    
    %>
    this is filename :<%=name%>
     
    </body>
</html>
