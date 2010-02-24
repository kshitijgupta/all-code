<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String sql="select logname,username,userip,time,describe from usertable,logcontent,abclog where usertable.userid=logcontent.userid and logcontent.logid=abclog.logid";
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="icss.abc.base.db.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>日志浏览界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>日志浏览</title>
<style type="text/css">
<!--
.STYLE1 {color: #333333}

body{
     font-family:"宋体";
	 font-size:12px;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
-->
</style>
</head>

<body>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><div align="right">
      <form id="form1" name="form1" method="post" action="logscan.jsp">
        <label>日志类型：
        <select name="select">
          <option value="0" selected="selected">全部</option>
          <option value="1">发布操作</option>
          <option value="2">删除操作</option>
          <option value="3">登陆/登出</option>
          <option value="4">上传操作</option>
          <option value="5">资源修改</option>
          <option value="6">人事修改</option>
          <option value="7">备份还原</option>
        </select>
        用户名：
          <input name="username" type="text" size="16" />
          <input type="submit" name="Submit" value="查看" /></label>
      </form>
<%
    String logtype = request.getParameter("select");
    String username = request.getParameter("username");
    if(logtype==null||logtype.equals("0")||logtype.equals("null")){
        //全搜索
    }else{
    System.out.println(logtype);
    System.out.println(username);
        sql+=" and abclog.logid="+logtype;
    }
    if(username==null||username.equals("null")||username.equals("")){
        //全搜
    }else{
        sql+=" and username='"+username+"'";
    }
    System.out.println(sql);
%>


<%
    ResultSet rs = null;
    PreparedStatement stmt = null;
	Connection conn = null;
    //PreparedStatement stmt2 = null;
	//Connection conn2 = null;
    try{
    //DBConnection dbconnection = new DBConnection();
	conn=DBConnection.getConnection();
	//创建Statement
	stmt = conn.prepareStatement(sql+" order by logcontent.time desc",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	//执行取得结果集(查询)
	rs = stmt.executeQuery();
	
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
      <label></label>
    </div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <th colspan="6" scope="col">&nbsp;</th>
        </tr>
      <tr>
        <td width="13%" bgcolor="#BED9EB">日志类型</td>
        <td width="20%" bgcolor="#BED9EB">操作者</td>
        <td width="19%" bgcolor="#BED9EB">IP</td>
        <td width="19%" bgcolor="#BED9EB">操作时间</td>
        <td width="29%" bgcolor="#BED9EB">操作描述</td>
        </tr>
<%

try{
//分页
            int intRowCount=0;//记录总数
			int intPageCount;//总页数
			int intPageSize = 10;
			int intPage;//待显示页码
			java.lang.String strPage;
			int j;
			strPage=request.getParameter("page");//取得待显示页码
			if(strPage==null){
				//表明在QUERYSTRING中没有PAGE这一个参数,此时显示第一页留言
				intPage=1;
			}else{
				//将字符串转换成整型
				intPage = java.lang.Integer.parseInt(strPage);
				if(intPage<1) intPage=1;
			}
			 rs.last();
			 
			 intRowCount = rs.getRow();	 
 
			
			intPageCount=(intRowCount+intPageSize-1)/intPageSize;//计算总页数
			if(intPage>intPageCount)intPage=intPageCount;//调整待显示页码
		 
			if(intPageCount>0)
			{
                
				try
				{
				    rs.absolute((intPage-1)*intPageSize+1);//将记录指针定位到待显示页的第一条记录上
				}catch(Exception e)
				{
				   out.println("error1");
				}
				//显示数据
				j=0;
				while(j<intPageSize&&!rs.isAfterLast()) {
%>
      <tr>
        <td><%=rs.getString("logname") %></td>
        <td><%=rs.getString("username") %></td>
        <td><%=rs.getString("userip") %></td>
        <td><%=rs.getString("time") %></td>
        <td><%=rs.getString("describe") %></td>
      </tr>
<%

     rs.next();
	j++;
   }
   conn.close();
   stmt.close();
   rs.close();
  
%>
        <td colspan="6">&nbsp;</td>
    </table></td>
  </tr>
</table>
<hr>
			<div align="center">
				第<%=intPage%>页 共<%=intPageCount%>页
				<%if(intPage!=1){%>
					<a href="logscan.jsp?page=1&select=<%=logtype%>&username=<%=username %>">第一页</a>
				<%}else{%>
					第一页
				<%}%>
				<%if(intPage>1){%>
					<a href="logscan.jsp?page=<%=intPage-1%>&select=<%=logtype%>&username=<%=username %>">上一页</a>
				<%}else{%>
					上一页
				<%}%>
				<%if(intPage<intPageCount){%>
					<a href="logscan.jsp?page=<%=intPage+1%>&select=<%=logtype%>&username=<%=username %>">下一页</a>
				<%}else{%>
					下一页
				<%}%>
				<%if(intPage!=intPageCount){%>
					<a href="logscan.jsp?page=<%=intPageCount%>&select=<%=logtype%>&username=<%=username %>">最后一页</a>
				<%}else{%>
					最后一页
				<%}%>
			</div>
  
<br/>
<%
}
  }catch(Exception e){
      System.out.println(e.toString());
  }
%> 
</body>
</html>
