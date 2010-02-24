<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="icss.abc.base.db.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>资源审核入库</title>
    
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
        ResultSet  rs = null;
        PreparedStatement stmt = null;
	    Connection conn = null;

     try{
        
        conn=DBConnection.getConnection();
     }catch(Exception e){
     }
     String[] outDBFileIDs=request.getParameterValues("checkboxs");
     String s = "";
     int k = 0;
     int size=outDBFileIDs.length; 
     for(int i=0; i<size;i++)
     {
         stmt=conn.prepareStatement("select * from filefolder where fileid="+outDBFileIDs[i]);
         rs=stmt.executeQuery();
         if(rs.next()){
             if(k!=0){
                 s+=","+outDBFileIDs[i];
             }else{
                 s+=outDBFileIDs[i];k++;
             }
         }
         
     }
%>    
  
<%
    try{
    
        if(k!=0){
            stmt = conn.prepareStatement("update abcfile set flag=1 where fileid in("+s+")");
	        stmt.execute();
        }
	//创建Statement
	    
    }catch(Exception e){
        
    }stmt.close();
    conn.close();
    
%>
<script type="text/javascript">

  window.alert("入库成功!必著项为空的自动过滤。");
  window.location.href("<%=path%>/b/middle_pages/checkSource.jsp");
</script>
  </body>
</html>