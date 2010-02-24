<%@ page language="java"  pageEncoding="utf-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>欢迎光临论坛</title>
<link rel=stylesheet type=text/css href="./lib/bbs.css">
</head>
<body bgcolor="#F5F5F5">
<div align="center">
<br>
<H1>Welcome to EasyForum</H1>

<form name="form1" method="post" action="./LogInServlet" target="_self">
<table width="90%">
<tr>
<td width="50%" height="30" align="right">用户名：</td>
<td width="50%" height="30" align="left">&nbsp;<input type="text" name="UserName"></td>
</tr>
<tr>
<td width="50%" height="30" align="right">密码：</td>
<td width="50%" height="30" align="left">&nbsp;<input type="password" name="UserPassword"></td>
</tr>
<tr>
<td width="100%" height="40" align="center" colspan="2">
<input type="submit" name="sub" value="登录">&nbsp;&nbsp;
<input type="reset" name="res" value="重填">&nbsp;&nbsp;
<input type="button" name="btn" value="注册" onClick="javascript:window.location='user_reg_form.html'">
</td>
</tr>
</table>
</form>
</div>
</body>
</html>
