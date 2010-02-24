<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>欢迎光临论坛</title>
		<link rel=stylesheet type=text/css href="./lib/bbs.css">
		<jsp:useBean scope="page" id="MyFile" class="com.chapter12.MyFile" />
		<jsp:useBean scope="page" id="Page" class="com.chapter12.SplitPage" />

		<%
			//获取主页模块名称
			String sPart = request.getParameter("Part");
			//初始化讨论区信息
			MyFile.setPart(sPart);
			//获取当前板块中的所有主题文章信息
			ResultSet rs = MyFile.show();
                        
                              
                       //初始化分页显示类，每页显示10条记录
			Page.initialize(rs,10);
			//获取当前所要显示的页数
			String strPage=null;
			int showPage = 1;
			//获取跳转到的目的页面
			strPage=request.getParameter("showPage");	
			if (strPage==null)
				showPage=1;
			else
			{
				try
				{
					showPage=Integer.parseInt(strPage);
				}
				catch(NumberFormatException e)
				{
					showPage = 1;
				}
				if(showPage<1) 
					showPage=1;
		
				if(showPage>Page.getPageCount()) 
					showPage=Page.getPageCount();
			}
			
			//获取要显示的数据集合
			Vector vData=Page.getPage(showPage);	
			
		%>
	</head>
	<body>
	<div align="center"><br>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="2">
		<tr bgcolor="#F5F5F5">
		<th width="20%" height="30" align="center">发布时间</th>
		<th width="45%" height="30" align="center">文章标题</th>
		<th width="10%" height="30" align="center">附件URL</th>
		</tr>
	<%
		for(int i=0;i<vData.size();i++)
		{ 
		
			//循环显示文章信息
			String[] sData=(String[])vData.get(i);
			
	%>
			<tr>
				
				<td height="25" align="center"><%=sData[0]%></td>
				<td height="25" align="left"><a href="file_detail.jsp?FileID=<%=sData[3]%>&Part=<%=sPart%>" target="_self"><font color="#0000FF"><%="&nbsp;"+sData[1]%></font></a></td> 	
				<td height="25" align="center"><font color="#FF0000"><%=sData[2]%></font></td> 
				
			</tr> 		
	<%
		
		}
	%>
	</table>
	
	<form action="indexPart_list.jsp" method="post" target="_self">	
		[<a href="./add_file_form.jsp?Part=<%=sPart%>" target="_self"><font color="#0000FF">发表文章</font></a>]&nbsp;
		第<font color="#FF0000"><%=showPage%></font>页/共<font color=red><%=Page.getPageCount()%></font>页&nbsp;
		<a href="indexPart_list.jsp?showPage=1" target="_self"><font color="#0000FF">[首页]</font></a>&nbsp;			
		<%
			//判断"上一页"链接是否要显示
			if(showPage > 1)
			{				
		%>
				<a href="indexPart_list.jsp?showPage=<%=showPage-1%>&Part=<%=sPart%>" target="_self"><font color="#0000FF">[上一页]</font> </a>&nbsp;
		<%
			}
			else
				out.println("[上一页]&nbsp;");

			//判断"下一页"链接是否要显示
			if(showPage < Page.getPageCount())
			{				
		%>
				<a href="indexPart_list.jsp?showPage=<%=showPage+1%>&Part=<%=sPart%>" target="_self"><font color="#0000FF">[下一页]</font> </a>&nbsp;
		<%
			}
			else
				out.println("[下一页]&nbsp;");

		%> 
		<a href="indexPart_list.jsp?showPage=<%=Page.getPageCount()%>&Part=<%=sPart%>" target="_self"><font color="#0000FF">[尾页]</font> </a>&nbsp;
		转到
		<select name="showPage">
		<%
			for(int x=1;x<=Page.getPageCount();x++)
			{
		%>
				<option value="<%=x%>" <%if(showPage==x) out.println("selected");%> ><%=x%></option>
		<%
			}
		%>
		</select>
		<input type="hidden" name="Part" value="<%=sPart%>">页&nbsp;
		<input type="submit" name="go" value="提交"/>
	</form>
	<%rs.close();%>
	</div>
	</body>
</html>

