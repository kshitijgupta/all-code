<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>JSP</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body> 
    This is my JSP page. <br>
    <logic:present name="treeForm" property="treeList">
    <p>--------#present treeForm treeList#-------</p>
	<logic:iterate id="item" name="treeForm" property="treeList">
	<p>--------#iterate treeForm treeList#-------</p>
		<logic:present name="item">
			<bean:write name="item" property="folderId"/><br>
			<bean:write name="item" property="foldName"/><br>
			<bean:write name="item" property="fatherFolder"/><br>
			<bean:write name="item" property="folderLayer"/><br>
		</logic:present>
	</logic:iterate>	
	</logic:present>
	<logic:notPresent name="treeForm" property="treeList">
		<p>--------#notPresent treeForm treeList#-------</p>
	</logic:notPresent>
  </body>
</html>
