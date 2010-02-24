<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="icss.abc.base.db.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加新的词汇</title>
    
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
  <body>&nbsp; 
<%
    //获得新建的词汇，及所属索引字母 
    String newword = new String(request.getParameter("newword").getBytes("iso-8859-1"),"gb2312"); 
    String letter = request.getParameter("characters"); 
    int isSuccess = 0;
    //连接数据库 
    ResultSet  rs = null; 
    PreparedStatement stmt = null; 
	Connection conn = null; 
	ResultSet  rs2 = null; 
	
	try{
        conn=DBConnection.getConnection();
        stmt=conn.prepareStatement("select * from words where word='"+newword+"'");
        rs=stmt.executeQuery();
        if(!rs.next())//词汇不存在
        {
            stmt=conn.prepareStatement("insert into words(wordid,word,letter) values(seq_words.NextVal,'"+newword+"','"+letter+"')");
            stmt.execute();
            stmt=conn.prepareStatement("select wordid from words where word='"+newword+"'");
            rs2=stmt.executeQuery();
            if(!rs2.next()){System.out.println("dsjfsjfl");}
            stmt=conn.prepareStatement("update words set wordgroup="+rs2.getInt("wordid")+" where wordid="+rs2.getInt("wordid"));
            stmt.execute();
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
    if(isSuccess=1)
    {
        window.alert("添加新词成功，现在你可以给它添加近义词了！");
        window.location="../middle_pages/jinyicibiao.jsp";
    }else{
        window.alert("该词已经存在~！");
        window.location="../middle_pages/jinyicibiao.jsp";
    }
</script>
  </body>
</html>
