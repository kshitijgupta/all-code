<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ page import="icss.abc.search.MyMap"%>
<%@ page import="java.util.*"%>
<%@ page import="icss.abc.file.vo.*"%>
<%@ page import="icss.abc.file.dao.*"%>
<%@ page import="icss.abc.base.pagination.*"%>

<HTML>
	<HEAD>
		<TITLE>搜索结构</TITLE>


		

		<META http-equiv=content-type content=text/html;charset=gb2312>
		<STYLE>
BODY {
	FONT-FAMILY: arial
}

TD {
	FONT-FAMILY: arial
}

.p1 {
	FONT-FAMILY: arial
}

.p2 {
	FONT-FAMILY: arial
}

.i {
	FONT-FAMILY: arial
}

BODY {
	MARGIN: 6px 0px 0px;
	COLOR: #000;
	BACKGROUND-COLOR: #fff
}

TABLE {
	BORDER-RIGHT: 0px;
	BORDER-TOP: 0px;
	BORDER-LEFT: 0px;
	BORDER-BOTTOM: 0px
}

TD {
	FONT-SIZE: 9pt;
	LINE-HEIGHT: 18px
}

.f14 {
	FONT-SIZE: 14px
}

.f10 {
	FONT-SIZE: 10.5pt
}

.f16 {
	FONT-SIZE: 16px;
	FONT-FAMILY: Arial
}

.c {
	COLOR: #7777cc
}

.p1 {
	MARGIN-LEFT: -12pt;
	LINE-HEIGHT: 120%
}

.p2 {
	MARGIN-LEFT: -12pt;
	WIDTH: 100%;
	LINE-HEIGHT: 120%
}

.i {
	FONT-SIZE: 16px
}

.t {
	COLOR: #0000cc;
	TEXT-DECORATION: none
}

A.t:hover {
	TEXT-DECORATION: underline
}

.p {
	PADDING-LEFT: 18px;
	FONT-SIZE: 14px;
	WORD-SPACING: 4px
}

.f {
	PADDING-LEFT: 15px;
	FONT-SIZE: 100%;
	WIDTH: 32em;
	WORD-BREAK: break-all;
	LINE-HEIGHT: 120%;
	WORD-WRAP: break-word
}

.h {
	MARGIN-LEFT: 8px;
	WIDTH: 100%
}

.s {
	PADDING-LEFT: 10px;
	WIDTH: 8%;
	HEIGHT: 25px
}

.m {
	FONT-SIZE: 100%;
	COLOR: #666666
}

A.m:link {
	FONT-SIZE: 100%;
	COLOR: #666666
}

A.m:visited {
	COLOR: #660066
}

.g {
	FONT-SIZE: 12px;
	COLOR: #008000
}

.r {
	WIDTH: 225px;
	CURSOR: hand;
	WORD-BREAK: break-all
}

.bi {
	MARGIN-BOTTOM: 12px;
	HEIGHT: 20px;
	BACKGROUND-COLOR: #d9e1f7
}

.pl {
	PADDING-RIGHT: 2px;
	PADDING-LEFT: 3px;
	FONT-SIZE: 14px;
	HEIGHT: 8px
}

.Tit {
	FONT-SIZE: 14px;
	HEIGHT: 21px
}

.fB {
	FONT-WEIGHT: bold
}

.mo {
	FONT-SIZE: 100%;
	COLOR: #666666;
	LINE-HEIGHT: 10px
}

A.mo:link {
	FONT-SIZE: 100%;
	COLOR: #666666;
	LINE-HEIGHT: 10px
}

A.mo:visited {
	FONT-SIZE: 100%;
	COLOR: #666666;
	LINE-HEIGHT: 10px
}

.htb {
	MARGIN-BOTTOM: 5px
}

#ft {
	CLEAR: both;
	BACKGROUND: #e6e6e6;
	LINE-HEIGHT: 20px;
	TEXT-ALIGN: center
}

#ft {
	FONT-SIZE: 12px;
	COLOR: #77c;
	FONT-FAMILY: Arial
}

#ft {
	FONT-SIZE: 12px;
	COLOR: #77c;
	FONT-FAMILY: Arial
}

#ft SPAN {
	COLOR: #666
}

.STYLE1 {
	font-family: "宋体";
	font-size: large;
	color: #CC0000;
}

.STYLE3 {
	color: #000000;
	font-family: "宋体";
}

.STYLE4 {
	font-family: "宋体"
}

.STYLE5 {
	color: #006600
}
</STYLE>







		<META content="MSHTML 6.00.2900.3354" name=GENERATOR>
	</HEAD>
	<BODY link=#261cdc>









		<%
			String contextPath     = request.getContextPath();
			//out.println(contextPath);
			
			MyMap[] mms = (MyMap[]) request.getAttribute("mms");

			/*if(mms!=null)
			  System.out.println("mms不为空");
			*/
			MyPagination mp = new MyPagination();

			int currentpage = 1;
			
			if(request.getParameter("currentpage")!=null)
					currentpage = Integer.parseInt(request.getParameter("currentpage"));
			
			/*System.out.println("currentpage= " +currentpage);
			  if(mms[0]==null)
			  System.out.println("null");
			  System.out.println(mms[0].getMyfileid()+"");
			*/
			int rowcount = mms.length;
			//System.out.println(rowcount+"");
			int pagesize = 10;
			if ( request.getAttribute("pagesize") != null) {
				pagesize = (Integer) request.getAttribute("pagesize");
			}

			int pagecount = 1;
			if (rowcount % pagesize == 0)
				pagecount = rowcount / pagesize;
			else
				pagecount = rowcount / pagesize + 1;

			
			
		
			mp.setCurrentPage(currentpage);
			mp.setPageSize(pagesize);
			mp.setRowCount(rowcount);
			mp.setPageCount(pagecount);
			mp.setPageBar("");
			
			//System.out.println("setpagebar is ok" );
			
			//if(currentpage==1)
			//	System.out.println("currentpage   is " +currentpage);
			//System.out.println("pagecount is " + pagecount);
			MyMap[] showarray;
			if (pagecount <= 1)
				showarray = mms;
			else if (currentpage != pagecount) {
				showarray = new MyMap[pagesize];
				System.arraycopy(mms, (currentpage - 1) * pagesize, showarray,
						0, pagesize);
				//System.out.println("wrong" );
			} else {
				showarray = new MyMap[rowcount - (currentpage - 1) * pagesize];
				System.arraycopy(mms, (currentpage - 1) * pagesize, showarray,
						0, rowcount - (currentpage - 1) * pagesize);
						
				int a = rowcount - (currentpage - 1) * pagesize;
				//System.out.println(""+  a);
			}
			
			
			//System.out.println("showarray is ok" );
			
		%>
	<script language="JavaScript" type="text/javascript">
		function changepage(currentpage){
		
			document.hiddenform.currentpage.value = currentpage;
			document.hiddenform.pagesize.value = <%=pagesize%>;
			document.hiddenform.action="<%=contextPath %>/myfolder/page_action.action"
			
			document.hiddenform.submit();
		}
        function searchresult1() {
        	f1.action="<%=contextPath%>/myfolder/searchresult_action.action";
          	
        }
        function searchresult2() {
        	f2.action="<%=contextPath%>/myfolder/searchresult_action.action";
        }
        function search1() {
        	f1.action="<%=contextPath%>/myfolder/search_action.action";
        }
        function search2() {
        	f2.action="<%=contextPath%>/myfolder/search_action.action";
        }
</script>











		<s:form name="f1" method="post" theme="simple">
			<TABLE height=54 cellSpacing=0 cellPadding=0 width="100%"
				align=center>

				<TBODY>
					<TR vAlign=center>
						<TD style="PADDING-LEFT: 8px; WIDTH: 137px" vAlign=top noWrap
							width="100%">
							<IMG height=96 src="/ICSS/myfolder/sousuojiegou.files/logo-yy1.jpg"
								width=96 border=0>
						</TD>
						<TD>
							&nbsp;&nbsp;&nbsp;
						</TD>
						<TD vAlign=top width="100%">
							<DIV class=Tit>
								&nbsp;&nbsp;
							</DIV>
							<TABLE cellSpacing=0 cellPadding=0>
								<TBODY>
									<TR>
										<TD vAlign=top noWrap>
											<s:textfield maxLength="100" size="35" name="searchtext"
												theme="simple" />
											<s:submit onclick='search1()' value="偷窥一下" theme="simple" />
											<s:submit onclick='searchresult1()' value="结果中找" />
											&nbsp;&nbsp;&nbsp;
										</TD>
										<TD vAlign=center noWrap>
											&nbsp;|&nbsp;
											<A href="gaojisousuo.jsp">高级搜索</A>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
						<TD></TD>
				</TBODY>
			</TABLE>
		</s:form>
		<TABLE class=bi cellSpacing=0 cellPadding=0 width="100%" align=center
			border=0>
			<TBODY>
				<TR>
					<TD noWrap>
						&nbsp;&nbsp;&nbsp;
						<A style="COLOR: #000000" onclick="h(this,'http://www.baidu.com')"
							href="http://www.baidu.com/s?wd=as#"></A>
					</TD>
					<TD noWrap align=right>
						偷窥一下，找到相关文件约<%
						if (mms[0] != null) {
					%><%=mms.length%>
						<%
							}
						
						else {
						%>0<%
							}
						%>个，用时<%=(double) ((Long) request.getAttribute("usetime"))/1000%>秒&nbsp;&nbsp;&nbsp;&nbsp;
					</TD>
				</TR>
			</TBODY>
		</TABLE>



		<%//System.out.println("here?" );
			if (mms[0] != null) {
				//System.out.println("come into for " );
				for (int i = 0; i < showarray.length; i++) {
					int fileid = mms[i].getMyfileid();
					FileDAO dao = new FileDAOImpl();
					FileVO vo = (FileVO) dao.findByPrimary(fileid);
		%>
		<table width="100%" border="0">
			<tr>
				<td>
					<span class="STYLE1"><%=vo.getFilename()%></span>
				</td>
			</tr>
			<tr>
				<td height="25">
					<span class="STYLE3">编著者:<%=vo.getFileauthor()%> &nbsp;上传时间:<%=vo.getSqldate()%> &nbsp;文件类型:<%=vo.getFiletype()%></span>
				</td>
			</tr>
			<tr>
				<td height="25">
					<span class="STYLE3"><%=vo.getFiledescribe()%></span>
				</td>
			</tr>
			<tr>
				<td height="25">
					<span class="STYLE5"><span class="STYLE4">下载次数：<%=vo.getDownloadtimes()%>&nbsp;匹配次数</span>:<%=mms[i].getMycounter()%></span>
				</td>
			</tr>
			<tr>
				<td height="25">
					&nbsp;
				</td>
			</tr>
		</table>

		<%
			}
			}
			else{
			out.print("<font color=red>为找到搜索内容-_#&nbsp;请与管理员联系</font>");
			}
		%>










		<BR>
		<DIV
			style="CLEAR: both; WIDTH: 100%; HEIGHT: 60px; BACKGROUND-COLOR: #eff2fa">
			<TABLE height="100%" cellSpacing=0 cellPadding=0 width="96%"
				align=center border=0>
				<TBODY>
					<TR>
						<TD
							style="FONT-WEIGHT: bold; FONT-SIZE: 14px; WIDTH: 70px; HEIGHT: 40px">
							&nbsp;
						</TD>
						<TD vAlign=center rowSpan=2>
							<%
								if (pagecount > 1) {
							%>
						
							
								
									&nbsp;<%=mp.getPageBar()%>
							
							<%
								}
							%>
						</TD>
					</TR>
					<TR>
						<TD>
							&nbsp;
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
		<BR>
		<s:form name="f2" method="post" theme="simple">
			<TABLE style="MARGIN-LEFT: 18px; HEIGHT: 60px" cellSpacing=0
				cellPadding=0>

				<TBODY>
					<TR vAlign=center>
						<TD noWrap>
							<s:textfield maxLength="100" size="35" name="searchtext"
								theme="simple" />
							<s:submit onclick='search2()' value="偷窥一下" theme="simple" />
							<s:submit onclick='searchresult2()' value="结果中找" />
							&nbsp;&nbsp;&nbsp;
						</TD>
						<TD noWrap>
							感谢使用
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</s:form>
		<DIV id=ft>
			&copy;2008TeamABC
		</DIV>
		<IMG style="DISPLAY: none" src="">
		<%
			session.setAttribute("hiddenmms", mms);
	
		%>
		<s:form name = "hiddenform"  method="post"theme="simple">
			<input type="hidden" name="currentpage">
			<input type="hidden" name="pagesize" >
			<input type="hidden" name="usetime" value=<%=request.getAttribute("usetime") %>>
		</s:form>
		<!--30cba10db7575c18-->
	</BODY>
</HTML>
