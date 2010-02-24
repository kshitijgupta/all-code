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
    <title>用户权限修改</title>
    
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
    //获得更新的用户信息
    int departmentid = Integer.parseInt(request.getParameter("department"));
    int userid = Integer.parseInt(request.getParameter("userid"));
    String email = request.getParameter("mailAddress");
    int power = Integer.parseInt(request.getParameter("power"));
    
    //连接数据库变量
    ResultSet  rs = null;
    PreparedStatement stmt = null;
	Connection conn = null;
	
	//连接数据库
	try{
        //DBConnection dbconnection = new DBConnection();
	    conn=DBConnection.getConnection();
	    //创建Statement
	    stmt = conn.prepareStatement("update usertable set email='"+email+"' where userid="+userid);
        if(stmt.execute()){System.out.println("sfsff");}
        
        //判断用户权限是否已经设置过，设置过就更新，没有就插入
        stmt = conn.prepareStatement("select * from userpower where userid="+userid);
        rs=stmt.executeQuery();
        if(rs.next())
        {
            stmt = conn.prepareStatement("update userpower set power="+power+" where userid="+userid);
            stmt.execute();
        }else{
            stmt = conn.prepareStatement("insert into userpower(userid,power) values("+userid+","+power+")");
            stmt.execute();
        }
        
        stmt = conn.prepareStatement("update userdept set departmentid="+departmentid+" where userid="+userid);
        stmt.execute();
    }catch(Exception e){
         System.out.println(e.toString());
    }finally{try{
    if(stmt!=null)	stmt.close();
    if(conn!=null)	conn.close();
    }catch(Exception e){}
    }
%>
<script type="text/javascript">
window.alert("更改成功");
window.location.href("<%=path%>/b/middle_pages/powerManage.jsp");
</script>
<%
//人事修改
LogVO vo = new LogVO();
LogBaseDAO dao = new LogBaseDAO();
vo.setLogid(6);//6表示记录的是人事修改操作
int dbuserid = (Integer)session.getAttribute("userid");
vo.setUserid(dbuserid);//dbuserid从session里取
vo.setUserip(request.getRemoteAddr());
vo.setDescribe("人事修改记录"+userid);
dao.setLog(6, vo);
%>
  </body>
</html>
