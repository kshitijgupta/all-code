<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>��ӭ������̳</title>
		<link rel=stylesheet type=text/css href="./lib/bbs.css">
		<jsp:useBean scope="page" id="MyFile" class="com.chapter12.MyFile" />
		<jsp:useBean scope="page" id="Page" class="com.chapter12.SplitPage" />

		<%
			//��ȡ��ҳģ������
			String sPart = request.getParameter("Part");
			//��ʼ����������Ϣ
			MyFile.setPart(sPart);
			//��ȡ��ǰ����е���������������Ϣ
			ResultSet rs = MyFile.show();
                        
                              
                       //��ʼ����ҳ��ʾ�࣬ÿҳ��ʾ10����¼
			Page.initialize(rs,10);
			//��ȡ��ǰ��Ҫ��ʾ��ҳ��
			String strPage=null;
			int showPage = 1;
			//��ȡ��ת����Ŀ��ҳ��
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
			
			//��ȡҪ��ʾ�����ݼ���
			Vector vData=Page.getPage(showPage);	
			
		%>
	</head>
	<body>
	<div align="center"><br>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="2">
		<tr bgcolor="#F5F5F5">
		<th width="20%" height="30" align="center">����ʱ��</th>
		<th width="45%" height="30" align="center">���±���</th>
		<th width="10%" height="30" align="center">����URL</th>
		</tr>
	<%
		for(int i=0;i<vData.size();i++)
		{ 
		
			//ѭ����ʾ������Ϣ
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
		[<a href="./add_file_form.jsp?Part=<%=sPart%>" target="_self"><font color="#0000FF">��������</font></a>]&nbsp;
		��<font color="#FF0000"><%=showPage%></font>ҳ/��<font color=red><%=Page.getPageCount()%></font>ҳ&nbsp;
		<a href="indexPart_list.jsp?showPage=1" target="_self"><font color="#0000FF">[��ҳ]</font></a>&nbsp;			
		<%
			//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
			if(showPage > 1)
			{				
		%>
				<a href="indexPart_list.jsp?showPage=<%=showPage-1%>&Part=<%=sPart%>" target="_self"><font color="#0000FF">[��һҳ]</font> </a>&nbsp;
		<%
			}
			else
				out.println("[��һҳ]&nbsp;");

			//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
			if(showPage < Page.getPageCount())
			{				
		%>
				<a href="indexPart_list.jsp?showPage=<%=showPage+1%>&Part=<%=sPart%>" target="_self"><font color="#0000FF">[��һҳ]</font> </a>&nbsp;
		<%
			}
			else
				out.println("[��һҳ]&nbsp;");

		%> 
		<a href="indexPart_list.jsp?showPage=<%=Page.getPageCount()%>&Part=<%=sPart%>" target="_self"><font color="#0000FF">[βҳ]</font> </a>&nbsp;
		ת��
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
		<input type="hidden" name="Part" value="<%=sPart%>">ҳ&nbsp;
		<input type="submit" name="go" value="�ύ"/>
	</form>
	<%rs.close();%>
	</div>
	</body>
</html>

