<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="icss.abc.log.vo.*" %>
<%@ page import="icss.abc.log.base.dao.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="icss.abc.base.db.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户删除</title>
    
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
    //得到要删除的用户的id
    int s = Integer.parseInt(request.getParameter("userid"));
    PreparedStatement stmt = null;
	Connection conn = null;
	try{
	    conn=DBConnection.getConnection();
	    //创建Statement
	    stmt = conn.prepareStatement("delete from usertable where userid="+s);
	    stmt.execute();
	    conn.close();
	}catch(Exception e){
	    System.out.println(e.toString());
	    conn.close();
	}finally{try{
    if(stmt!=null)	stmt.close();
    if(conn!=null)	conn.close();
    }catch(Exception e){}
    }
%>
<script type="text/javascript">
window.alert("操作成功");
window.location="../middle_pages/powerManage.jsp";
</script>
<%
//人事修改
LogVO vo = new LogVO();
LogBaseDAO dao = new LogBaseDAO();
vo.setLogid(6);//6表示记录的是人事修改操作
int dbuserid = (Integer)session.getAttribute("userid");
vo.setUserid(dbuserid);//dbuserid从session里取
vo.setUserip(request.getRemoteAddr());
vo.setDescribe("人事删除记录"+s);
dao.setLog(6, vo);
%>
  </body>
</html>
