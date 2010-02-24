<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%@page pageEncoding="UTF-8"%>
<jsp:useBean scope="page" id="Board" class="com.chapter12.Board" />
<jsp:useBean scope="page" id="Article" class="com.chapter12.Article" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>欢迎光临论坛</title>
		<link rel=stylesheet type=text/css href="../lib/bbs.css">
	</head>
	<body>
	<div align="center">
	<br><br>
	
	<table width="70%" border="0">
	<tr bgcolor="#F5F5F5">
	<th width="18%" align="center" height="30">主页区域管理</th>
	</tr><!--模块的分类
              中心简介 jianjie
              中心大事纪 shiji
              野外拓展（大活动简介）　tuozhan
              网上预约培训 peixun
              中心发展 fazhan-->
	
			<tr>
			<td width="18%" align="center" height="25">
			<a href='./indexPart_list.jsp?Part=jianjie' target="_self"><font color="#0000FF">	中心简介</font></a></td>
			</tr>
			<tr>
			<td width="14%" align="center" height="25">
			<a href='./indexPart_list.jsp?Part=shiji' target="_self"><font color="#0000FF">	     中心事迹    </font></a></td>
			</tr>
			<tr>
			<td width="16%" align="center" height="25">
			  <p><a href='./indexPart_list.jsp?Part=tuozhan' target="_self"><font color="#0000FF">野外拓展    </font></a></p>
			  </td>
			   </tr>
			<tr>
			<td width="16%" align="center" height="25">
			<a href='./indexPart_list.jsp?Part=peixun' target="_self"><font color="#0000FF">	网上预约培训</font></a></td>
			</tr>
			<tr>
			<td width="16%" align="center" height="25">
			<a href='./indexPart_list.jsp?Part=fazhan' target="_self"><font color="#0000FF">	中心发展c/font></a></td>
			</tr>
	
	</table>
	<p>
	
	</p>
	
	</div>
	</body>
</html>
