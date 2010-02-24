<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="icss.abc.base.db.*" %>
<%@ page import="icss.abc.log.vo.*" %>
<%@ page import="icss.abc.log.base.dao.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>提交更改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<script type="text/javascript">
</script>  
  <body>
<%
    int fileid = Integer.parseInt(request.getParameter("fileid"));
    String filetype = new String(request.getParameter("filetype").getBytes("iso-8859-1"),"UTF-8");
    String filename =new String(request.getParameter("filename").getBytes("iso-8859-1"),"UTF-8");
    int filepower = Integer.parseInt(new String(request.getParameter("filepower").getBytes("iso-8859-1"),"UTF-8"));
    int departmentname = Integer.parseInt(new String(request.getParameter("departmentname").getBytes("iso-8859-1"),"UTF-8"));
    String fileauthor =new String(request.getParameter("fileauthor").getBytes("iso-8859-1"),"UTF-8");
    String filelabel =new String(request.getParameter("filelabel").getBytes("iso-8859-1"),"UTF-8");
    //String foldname =new String(request.getParameter("foldname").getBytes("iso-8859-1"),"UTF-8");
    int folderid = Integer.parseInt( new String(request.getParameter("folderid").getBytes("iso-8859-1"),"UTF-8"));
    String filedescribe = new String(request.getParameter("filedescribe").getBytes("iso-8859-1"),"UTF-8");
    //连接数据库
    ResultSet  rs = null;
    PreparedStatement stmt = null;
	Connection conn = null;
	PreparedStatement stmt2 = null;
	PreparedStatement stmt3 = null;
    try{
	    conn=DBConnection.getConnection();
	    //创建Statement
	    stmt = conn.prepareStatement("select * from filefolder where fileid="+fileid);
	    rs=stmt.executeQuery();
	if(rs.next()){
	    stmt = conn.prepareStatement("update filefolder set folderid="+folderid+" where fileid="+fileid);
	    stmt.execute();
	}
	else
	{
	
	    stmt = conn.prepareStatement("insert into filefolder(fileid,folderid) values("+fileid+","+folderid+")");
	    stmt.execute();
	}
	stmt2 = conn.prepareStatement("update abcfile set filename='"+filename+"',filelabel='"+filelabel+"',fileauthor='"+fileauthor+"',filetype='"+filetype+"',filedescribe='"+filedescribe+"' where fileid="+fileid);
    stmt2.execute();
    stmt3 = conn.prepareStatement("update filedept set departmentid='"+departmentname+"',filepower="+filepower+" where fileid="+fileid);
    stmt3.execute();
    }catch(Exception e){
         
         System.out.println(e.toString()+"sfsfsf");
    }finally{try{
    if(stmt!=null)	stmt.close();
    if(conn!=null)	conn.close();
    if(stmt2!=null)	stmt.close();
    
    if(stmt3!=null)	stmt.close();
    
    }catch(Exception e){}
    }
    
    //out.println("update abcfile set filename='"+filename+"',filelabel='"+filelabel+"',fileauthor='"+fileauthor+"',filetype='"+filetype+"',filedescribe='"+filedescribe+"' where fileid='"+fileid+"'");
%>
<script type="text/javascript">
window.alert("更改成功");
window.location.href("<%=path%>/b/middle_pages/checkSource.jsp");
</script>
<%
    //审核发布
LogVO vo = new LogVO();
LogBaseDAO dao = new LogBaseDAO();
vo.setLogid(1);//1表示记录的是审核日志
int dbuserid = (Integer)session.getAttribute("userid");
vo.setUserid(dbuserid);//dbuserid从session里取
vo.setUserip(request.getRemoteAddr());


vo.setDescribe("数据更改"+fileid);
dao.setLog(1, vo);
%>
  </body>
</html>
