<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.abc.scan.form.OpForm;"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<html>
	<head>
		<html:base/>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		
		<title>资源下载</title>
	</head>
	<body>		
		<bean:define id="op" name="opForm"/>
		<%
			OpForm doOp = (OpForm)op;
			String url = "./to_down/"+doOp.getCount()+"_"+doOp.getUserKey()+"_"+doOp.getStr().replaceAll(",", "_")+".zip"; 
		%>
		<a href="<%=url%>"><br>&nbsp;&nbsp;&nbsp;&nbsp;点击此处下载压缩包</a>
	</body>
</html>

