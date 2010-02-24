<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="ef.luolei.subject.vo.ShortSubject;"%>
<%
String path = request.getContextPath();

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML><HEAD><TITLE>论坛</TITLE>
<META http-equiv=content-type content="text/html; charset=UTF-8"><LINK 
href="<%=path%>/image1/style.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2900.3429" name=GENERATOR></HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD width="1%">&quot;</TD>
    <TD width="98%"><IMG height=38 alt="" 
      src="<%=path%>/image1/header-stretch.gif" width="100%" border=0></TD>
    <TD width="1%"><IMG height=38 alt="" 
      src="<%=path%>/image1/header-right.gif" width=5 
border=0></TD></TR></TBODY></TABLE><BR>
    <BR>
<DIV class=clearfix id=jive-accountbox>
<DL>
  <TABLE cellSpacing=0 cellPadding=3 width=200 border=0>
    <THEAD>
      <TR>
        <TH colSpan=2>搜索论坛 </TH>
      </TR>
    </THEAD>
    <TBODY>
      <TR>
        <TD class=jive-search-form width="99%"><INPUT type=hidden value=f20 
            name=objID>
            <INPUT id=q01 title="搜索论坛 (ALT+S)" style="WIDTH: 100%" 
            accessKey=s maxLength=100 name=q>
        </TD>
        <TD class=jive-search-form width="1%"><INPUT name="submit" type=submit value=Go>
        </TD>
      </TR>
    </TBODY>
  </TABLE>
  <DT>&nbsp;</DT>
  <DD><A class=jive-acc-login 
  href="http://bbs.chinajavaworld.com/login!withRedirect.jspa">登录 / 注册</A> </DD>
  <DD><A class=jive-acc-cp 
  href="http://bbs.chinajavaworld.com/guestsettings!default.jspa">游客设置</A></DD></DL>
</DIV>
<P class=jive-page-title>欢迎进入论坛:  </P>
<P class=jive-description>探讨各种事。大家一起交流，共同提高。 </P><LINK title=RSS 
href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?forumID=20" 
type=application/rss+xml rel=alternate>
<SCRIPT language=JavaScript src="<%=path%>/image1/common.js" 
type=text/javascript></SCRIPT>

<DIV id=jive-forumpage>
<DIV class=jive-buttons>
<TABLE cellSpacing=0 cellPadding=0 summary=Buttons border=0>
  <TBODY>
  <TR>
    <TD class=jive-icon><A 
      href="http://bbs.chinajavaworld.com/post!default.jspa?forumID=20"><IMG 
      height=16 alt=发表新主题 src="<%=path%>/image1/post-16x16.gif" width=16 
      border=0></A> </TD>
    <TD class=jive-icon-label><A id=jive-post-thread 
      href="<%=path %>/createsubject.jsp">发表新主题</A> 
    </TD>
    <TD class=jive-icon><A 
      href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;isBest=1"><IMG 
      height=16 src="<%=path%>/image1/ico_best.gif" width=16 align=absMiddle 
      border=0></A></TD>
    <TD class=jive-icon-label><A 
      href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;isBest=1">精华区</A> 
    </TD>
    <TD class=jive-icon><A 
      href="http://bbs.chinajavaworld.com/index.jspa"><IMG height=16 alt=返回到分类 
      src="<%=path%>/image1/arrow-left-16x16.gif" width=16 border=0></A> </TD>
    <TD class=jive-icon-label><A 
      href="http://bbs.chinajavaworld.com/index.jspa?categoryID=1">论坛列表</A> 
  </TD></TR></TBODY></TABLE></DIV><BR><INPUT type=hidden value=last90days 
name=dateRange> 
<TABLE cellSpacing=0 cellPadding=3 width="100%" border=0>
  <TBODY>
  <TR vAlign=top>
    <TD><NOBR>帖子: 145,521</NOBR> - <NOBR>主题: 34,983</NOBR> - <NOBR>过滤: <SELECT 
      class=jive-selbox onchange=location.href=options[selectedIndex].value; 
      size=1> <OPTION 
        value=forumfilter.jspa?forumID=20&amp;start=0&amp;filter=all 
        selected>所有主题</OPTION> <OPTION 
        value=forumfilter.jspa?forumID=20&amp;start=0&amp;filter=open>未解决的问题</OPTION> 
        <OPTION 
        value=forumfilter.jspa?forumID=20&amp;start=0&amp;filter=answered>已解决的问题</OPTION> 
        <OPTION 
      value=forum.jspa?forumID=20&amp;start=0&amp;isBest=1>精华区</OPTION></SELECT></NOBR> 
      - <SPAN class=nobreak>页数: 1,400 - <SPAN class=jive-paginator>[ <A 
      class=jive-current 
      href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=0&amp;isBest=0">1</A> 
      <A class="" 
      href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=25&amp;isBest=0">2</A> 
      <A class="" 
      href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=50&amp;isBest=0">3</A> 
      <A class="" 
      href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=75&amp;isBest=0">4</A> 
      <A class="" 
      href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=100&amp;isBest=0">5</A> 
      | <A 
      href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=25&amp;isBest=0">下一页</A> 
      ] </SPAN></SPAN></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR vAlign=top>
    <TD width="99%">
      <DIV class=jive-thread-list>
      <DIV class=jive-table>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" 
        summary="List of threads"><THEAD>
        <TR>
          <TH class=jive-first colSpan=3>主题 </TH>
          <TH class=jive-author><NOBR>作者 &nbsp; </NOBR></TH>
          <TH class=jive-view-count><NOBR>查看 &nbsp; </NOBR></TH>
          <TH class=jive-msg-count noWrap>回复 </TH>
          <TH class=jive-last noWrap>最后发表 </TH></TR></THEAD>
        <TBODY>
		<%
			int moduleid = Integer.parseInt(request.getParameter("module"));	
			
			List objectList = (ArrayList) request.getAttribute("objectList");
			ShortSubject vo ;
			
			for(int i=0; i<objectList.size(); i++){
				vo = (ShortSubject)objectList.get(i);
		
		%>
        <TR class=jive-even>
		
          <TD class=jive-first noWrap width="1%">
            <DIV class=jive-bullet><IMG height=16 alt=读 
            src="<%=path%>/image1/read-16x16.gif" width=16 border=0> </DIV></TD>
          <TD noWrap width="1%">&nbsp; &nbsp; </TD>
          <TD class=jive-thread-name width="95%"><A 
            id=jive-thread-1 
            href="<%=path %>/subjectshowservlet?subject=<%=vo.getId() %>"><%=vo.getTitle()%></A>          </TD>
          <TD class=jive-author noWrap width="1%"><SPAN class=""><%=vo.getAuthor() %>
            </SPAN></TD>
          <TD class=jive-view-count width="1%"><%=vo.getClickamount() %> </TD>
          <TD class=jive-msg-count width="1%"><%=vo.getReplyamount() %> </TD>
          <TD class=jive-last noWrap width="1%">
            <DIV class=jive-last-post><%=vo.getTime() %><BR>最后发表: <%=vo.getLastauthor() %> </DIV></TD></TR>
			<%
			}
			%>
			</TBODY></TABLE>
      </DIV></DIV>
      <TABLE cellSpacing=0 cellPadding=3 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="99%">&nbsp;</TD>
          <TD width="1%">&quot; </TD>
        </TR></TBODY></TABLE>
      <DIV class=jive-legend></DIV></TD>
    <TD width="1%">&nbsp;
      <FORM id=jive-searchform action=search.jspa>
      <DIV class=jive-portlet-box>
        <!-- BEGIN sidebar box 'POPULAR TAGS' -->
        <!-- END sidebar box 'POPULAR TAGS' -->
      </DIV>
      </FORM>
      </TD>
  </TR></TBODY></TABLE></DIV><BR><BR>
<TABLE id=jive-footer cellSpacing=0 cellPadding=6 width="100%" border=0>
  <TBODY>
  <TR>
    <TD>&nbsp;</TD>
  </TR></TBODY></TABLE></BODY></HTML>


