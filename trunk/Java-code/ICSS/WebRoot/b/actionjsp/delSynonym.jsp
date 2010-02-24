<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int isSuccess = 0;
%>
<%@ page import="icss.abc.base.db.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>删除近义词</title>
    
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
    //获得新建的词汇，及所属索引字母,和要添加进的分组 
    String newword = new String(request.getParameter("delword").getBytes("iso-8859-1"),"gb2312"); 
    int wordgroup = Integer.parseInt(request.getParameter("wordgroup")); 
    String word = new String(request.getParameter("word").getBytes("iso-8859-1"),"gb2312");
    int wordid=-1;
    //连接数据库 
    ResultSet  rs = null; 
    PreparedStatement stmt = null; 
	Connection conn = null; 
	conn=DBConnection.getConnection();
	try{
	    stmt = conn.prepareStatement("select * from words where word='"+newword+"' and wordgroup="+wordgroup);
	    rs=stmt.executeQuery();
	    
	    if(rs.next()){            
            stmt=conn.prepareStatement("delete from words where word='"+newword+"' and wordgroup="+wordgroup);
            stmt.execute();
            stmt=conn.prepareStatement("select * from words where wordgroup="+wordgroup);
            rs=stmt.executeQuery();
            if(rs.next()){
                wordid=rs.getInt("wordid");
            }else
            {
            }
        }else{//不存在
            isSuccess = 1;
        }
    
    }catch(Exception e){
        System.out.println(e.toString());
    }finally{try{
    if(stmt!=null)	stmt.close();
    if(conn!=null)	conn.close();
    }catch(Exception e){}
    }
%>
<script type="text/javascript">
   if(<%=isSuccess%>=="1"){window.alert("\该词不存在于该组！");window.location="../middle_pages/jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&word="+<%=word%>;}
   else{
    window.alert("删除成功！");
    window.location="../middle_pages/jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid="+<%=wordid%>;
    
   }
</script>
  </body>
</html>

