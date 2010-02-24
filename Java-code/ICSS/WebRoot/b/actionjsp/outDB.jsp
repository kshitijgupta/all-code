<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="icss.abc.log.vo.*" %>
<%@ page import="icss.abc.log.base.dao.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="icss.abc.base.db.*" %>
<%@ page import="icss.abc.baseManage.DeleteFile.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>资源审核删除</title>
    
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
     String[] outDBFileIDs=request.getParameterValues("checkboxs");
     String s = "";
     int size=outDBFileIDs.length; 
     s=outDBFileIDs[0];   
     for(int i=1; i<size;i++)
     {
         s+=","+outDBFileIDs[i];
     }
%>    
  
<%
        ResultSet  rs = null;
        PreparedStatement stmt = null;
	    Connection conn = null;
    try{
    
        
        String url = "";

        conn=DBConnection.getConnection();
        //获得删除资源的物理路径
        stmt = conn.prepareStatement("select fileurl from abcfile where fileid in("+s+")");
        rs=stmt.executeQuery();
        while(rs.next())
        {
            url = rs.getString("fileurl");
            String indexDir = this.getServletContext().getRealPath(url);
            //String newindexDir=indexDir.replace("\\","\\\\");
            //System.out.println(newindexDir);
            DeleteFile deFile = new DeleteFile();
            deFile.deleteFile(indexDir);
        }
        
	//创建Statement
	    stmt = conn.prepareStatement("delete from abcfile where fileid in("+s+")");
	    stmt.execute();
    }catch(Exception e){
        
    }finally{try{
    if(stmt!=null)	stmt.close();
    if(conn!=null)	conn.close();
    }catch(Exception e){}
    }
    
%>
<script type="text/javascript">
  window.alert("删除成功");
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


vo.setDescribe("数据清除"+s);
dao.setLog(1, vo);
%>
  </body>
</html>
