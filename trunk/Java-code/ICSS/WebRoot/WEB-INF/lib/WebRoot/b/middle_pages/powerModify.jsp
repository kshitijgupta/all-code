<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%
  String path = request.getContextPath();
  String powertable[]={"管理员","处长","副处长","科长","副科长","组长","普通员工"};
%>
<%@ page import="icss.abc.base.db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户权限更改</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
	color: #333366;
}
-->
</style>
</head>
<style type="text/css">
<!--
body{
     font-family:"宋体";
	 font-size:12px;
}
-->
</style>
<script language="javascript">
<!--
function testNull(){
   var fm = window.document.form1;
   if(fm.power.value=="-1"){
      hiddenpower.innerHTML="请选择权限!";
	  fm.power.focus();
	  return false;
	}
	else
	{
	    document.form1.action="../actionjsp/modifyUser.jsp";
	    document.form1.submit();
	}
}
-->
</script>
<body>
<table width="100%" height="31" border="0">
  <tr>
    <td width="95%">  <span class="STYLE1">权限管理</span></td>
    <td width="5%" valign="top"><div align="right"><a href="javascript:history.back(-1);">返回</a></div></td>
  </tr>
</table>
<%
    //连接数据库变量
    ResultSet  rs = null;
    PreparedStatement stmt = null;
	Connection conn = null;
	
	//获得powerManage.jsp页面传来的用户信息
	int userid = Integer.parseInt(request.getParameter("userid"));
	String username = new String(request.getParameter("username").getBytes("iso-8859-1"),"UTF-8");
	String password = new String(request.getParameter("password").getBytes("iso-8859-1"),"UTF-8");
	int departmentid = Integer.parseInt(request.getParameter("departmentid"));
	String regtime = request.getParameter("regtime");
	String email = new String(request.getParameter("email").getBytes("iso-8859-1"),"UTF-8");
	int power = Integer.parseInt(request.getParameter("power"));
%>
<form name="form1" method="post" action="" >
<table width="100%" border="0" cellspacing="1" cellpadding="1">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td width="13%">&nbsp;</td>
    <td width="87%"><table width="100%" border="0" cellspacing="1" cellpadding="1">
      <tr>
        <td width="8%" rowspan="4"><img src="../image/touxiang.jpg" alt="头像" name="head" width="80" height="100" id="head" style="background-color: #333333" /></td>
        <td width="92%" height="24"> ID：1</td>
      </tr>
      <tr>
        <td height="24">用户名：<%=username %></td>
        <input type="hidden" name="userid" value="<%=userid %>"/>
      </tr>
      <tr>
        <td height="24">密码：<%=password %></td>
      </tr>
      
      <tr>
        <td>注册日期：<%=regtime %></td>
      </tr>
      <tr>
        <td>
          <label></label>
          　部　　门</td>
        <td>
        <select name="department">
<%    
    try{
        //DBConnection dbconnection = new DBConnection();
	    conn=DBConnection.getConnection();
	    //创建Statement
	    stmt = conn.prepareStatement("select departmentid,departmentname from department where departmentname<>'公开'");
        rs=stmt.executeQuery();
    
      
      while(rs.next()){
           if(rs.getString("departmentid").equals(departmentid)){
           
%>
             <option value="<%=rs.getInt("departmentid") %>" selected><%=rs.getString("departmentname") %></option>
<%
           }
           else
           {
           
%>
             <option value="<%=rs.getInt("departmentid") %>"><%=rs.getString("departmentname") %></option>
<%
           }
     }
     }catch(Exception e){
         System.out.println(e.toString());
    }
     finally{try{
    if(stmt!=null)	stmt.close();
    if(conn!=null)	conn.close();
    }catch(Exception e){}
    }
     
%>        
        </select>
        </td>
      </tr>
      <tr>
        <td>
          <label></label>          
           　邮 　 箱</td>
        <td><input type="text" name="mailAddress" value="<%=email %>"/></td>
      </tr>
      <tr>
        <td>
          <label></label>          
           　权　　限</td>
        <td><select name="power">
          <option value="-1">--请选择--</option>
          <%
      int i=1;
      for(i=0; i<7; i++){
         if(power==i){
%>
		     <option value="<%=i%>" selected><%=powertable[i]%></option>
<%
         }else{
             
%>
             <option value="<%=i%>"><%=powertable[i]%></option>
<%
         }
}

%>
        </select><span id="hiddenpower"></span></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="button" name="Submit" value="提交" onclick="testNull();"/>
	    <input type="reset" name="reset" value="重置" />
	</td>
  </tr>
</table></form>
</body>
</html>
