<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		
		<title>Insert title here</title>

	</head>
	<body style="BACKGROUND-COLOR: transparent;">
		<%String contextPath     = request.getContextPath(); %>
	

		<s:form name="f" method="post" action="search_action" target="_blank" theme = "simple" >
			<s:textfield label="搜索" name="searchtext" theme = "simple"/>
			
			<s:submit value="搜索"  theme = "simple" />
			
			
		</s:form>
		
	
	
	
	</body>
</html>