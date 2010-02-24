<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>发布文章</title>
<link rel=stylesheet type=text/css href="../lib/enterprise.css">

</head>
<body bgcolor="#F2F2F2">
    <%
        String sPart = request.getParameter("Part");
    %>
<div align="center">
<br>
<form name="form1" action="add_file_save.jsp" method="post" enctype="multipart/form-data" target="_self">
<table width="82%" height="275" border="1" cellpadding="0" cellspacing="0">
<tr>
<td width="20%" height="32" align="right">文章标题：</td>
<td width="80%" height="32">&nbsp;
  <input type="text" name="Subject" size="40"></td>
</tr>
<tr>
<td width="20%" align="right">文章内容：</td>
<td width="80%">&nbsp;<textarea rows="12" cols="60" name="Content"></textarea></td>
</tr>
<tr>
<td width="20%" height="25" align="right">上传附件：</td>
<td width="80%" height="25">&nbsp;<input type="file" name="Attachment" size="40"></td>
</tr>
</table>
<p>
<input type="submit" name="sub" value="发布">&nbsp;&nbsp;
<input type="hidden" name="Part" value="<%=sPart%>">
<input type="reset" name="res" value="重填"></p>


</form>
</div>
</body>
</html>
