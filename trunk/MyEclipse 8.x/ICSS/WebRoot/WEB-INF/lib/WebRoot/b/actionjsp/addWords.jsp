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
    
    <title>����µĴʻ�</title>
    
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
    //����½��Ĵʻ㣬������������ĸ 
    String newword = new String(request.getParameter("newword").getBytes("iso-8859-1"),"gb2312"); 
    String letter = request.getParameter("characters"); 
    int isSuccess = 0;
    //�������ݿ� 
    ResultSet  rs = null; 
    PreparedStatement stmt = null; 
	Connection conn = null; 
	ResultSet  rs2 = null; 
	
	try{
        conn=DBConnection.getConnection();
        stmt=conn.prepareStatement("select * from words where word='"+newword+"'");
        rs=stmt.executeQuery();
        if(!rs.next())//�ʻ㲻����
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
        window.alert("����´ʳɹ�����������Ը�����ӽ�����ˣ�");
        window.location="../middle_pages/jinyicibiao.jsp";
    }else{
        window.alert("�ô��Ѿ�����~��");
        window.location="../middle_pages/jinyicibiao.jsp";
    }
</script>
  </body>
</html>
