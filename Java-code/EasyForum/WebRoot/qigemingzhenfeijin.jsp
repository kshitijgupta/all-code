<%@ page language="java"  pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML><HEAD><TITLE>论坛: 论坛主页</TITLE>
<% String path = request.getContextPath();
System.out.println(path);%>
<LINK href="<%=path%>/image/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=path%>/image/common.js" 
type=text/javascript></SCRIPT>


<META content="MSHTML 6.00.2900.3429" name=GENERATOR></HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD width="1%"></TD>
    <TD width="98%"><IMG height=38 alt="" 
      src="<%=path%>/image/header-stretch.gif" width="100%" border=0></TD>
    <TD width="1%"><IMG height=38 alt="" src="<%=path%>/image/header-right.gif" 
      width=5 border=0></TD></TR></TBODY></TABLE><BR>
    <BR>
    <P class=jive-page-title>论坛主页 </P>
<P class=jive-description>欢迎来到EasyForum。</P>
<DIV id=jive-frontpage>
<FORM id=jive-searchform action=search.jspa><BR>
<DIV class=jive-search-form>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD class=jive-description noWrap width="1%"><LABEL for=q01><A 
      title=更多搜索选项 
      href="">搜索</A> 全部论坛: 
      </LABEL><INPUT id=q01 accessKey=s maxLength=100 size=30 name=q> <INPUT type=submit value=Go> </TD>
    <TD class=jive-description noWrap width="1%"><A 
      href="">用户搜索</A> </TD>
    <TD class=jive-description align=right width="98%">&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR vAlign=top>
    <TD width="99%">
      <DIV class=jive-forum-list>
      <DIV class=jive-table>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" summary=分类和论坛列表>
        <THEAD>
        <TR>
          <TH class=jive-first colSpan=2>论坛 / 分类 </TH>
          <TH noWrap width="6%">查看 </TH>
          <TH noWrap width="10%">主题 / 帖子 </TH>
          <TH class=jive-last noWrap width="15%">最后发表 </TH></TR></THEAD>
        <TBODY>
        <TR>
          <TD class=jive-category-name colSpan=5>盗版天涯讨论区
            <SPAN 
            class=jive-description><BR>
            讨论各种在天涯，m6等知名论坛上的事</SPAN></TD>
        </TR>
        <TR>
          <TD class=jive-category-name colSpan=5>&nbsp;</TD></TR>
        <TR class=jive-even>
          <TD class=jive-first vAlign=top width="3%">
            <DIV class=jive-icon><IMG height=16 alt=读 
            src="<%=path%>/image/read-16x16.gif" width=16 border=0> </DIV></TD>
          <TD class=jive-forum-name vAlign=top 
            width="66%"><!-- Forum Name --><A class=jive-forum-name 
            id=jive-forum-1 
            href="<%=path %>/moduleshowservlet?module=1">社会</A> 
<!-- Forum Description (if it exists) --><SPAN 
            class=jive-description><BR>
</SPAN></TD>
          <TD class=jive-view-count noWrap width="6%"><%=(Integer)request.getAttribute("view1") %></TD>
          <TD class=jive-msg-count noWrap width="10%"><!-- Thread and Message Counts --><%=request.getAttribute("sub1") %> / <%=request.getAttribute("total1") %> </TD>
          <TD class=jive-last noWrap width="15%">
            <DIV 
            class=jive-last-post><!-- Modification Date and Last Post --><%=request.getAttribute("time1") %>
            <!-- Show the last post link if that feature is enabled --><BR>最后发表: 
            <%=request.getAttribute("author1")%></DIV></TD></TR>
        <TR class=jive-odd>
          <TD class=jive-first vAlign=top width="3%">
            <DIV class=jive-icon><IMG height=16 alt=读 
            src="<%=path%>/image/read-16x16.gif" width=16 border=0> </DIV></TD>
          <TD class=jive-forum-name vAlign=top 
            width="66%"><!-- Forum Name --><A class=jive-forum-name 
            id=jive-forum-2 
            href="<%=path %>/moduleshowservlet?module=2">人文</A> 
<!-- Forum Description (if it exists) --><SPAN 
            class=jive-description><BR>
</SPAN></TD>
          <TD class=jive-view-count noWrap width="6%"><%=(Integer)request.getAttribute("view2") %> </TD>
          <TD class=jive-msg-count noWrap width="10%"><!-- Thread and Message Counts --><%=request.getAttribute("sub2") %> / <%=request.getAttribute("total2") %> </TD>
          <TD class=jive-last noWrap width="15%">
            <DIV 
            class=jive-last-post><!-- Modification Date and Last Post --><%=request.getAttribute("time2") %>
            <!-- Show the last post link if that feature is enabled --><BR>最后发表: 
            <%=request.getAttribute("author2")%></DIV></TD></TR>
        <TR class=jive-even>
          <TD class=jive-first vAlign=top width="3%">
            <DIV class=jive-icon><IMG height=16 alt=读 
            src="<%=path%>/image/read-16x16.gif" width=16 border=0> </DIV></TD>
          <TD class=jive-forum-name vAlign=top 
            width="66%"><!-- Forum Name --><A class=jive-forum-name 
            id=jive-forum-3 
            href="<%=path %>/moduleshowservlet?module=3">经济</A> 
<!-- Forum Description (if it exists) --><SPAN 
            class=jive-description><BR>
</SPAN></TD>
          <TD class=jive-view-count noWrap width="6%"><%=(Integer)request.getAttribute("view3") %> </TD>
          <TD class=jive-msg-count noWrap width="10%"><!-- Thread and Message Counts --><%=request.getAttribute("sub3") %> / <%=request.getAttribute("total3") %></TD>
          <TD class=jive-last noWrap width="15%">
            <DIV 
            class=jive-last-post><!-- Modification Date and Last Post --><%=request.getAttribute("time3") %>
            <!-- Show the last post link if that feature is enabled --><BR>最后发表: 
            <%=request.getAttribute("author3")%> </DIV></TD></TR>
        <TR class=jive-odd>
          <TD class=jive-first vAlign=top width="3%">
            <DIV class=jive-icon><IMG height=16 alt=读 
            src="<%=path%>/image/read-16x16.gif" width=16 border=0> </DIV></TD>
          <TD class=jive-forum-name vAlign=top 
            width="66%"><!-- Forum Name --><A class=jive-forum-name 
            id=jive-forum-4 
            href="<%=path %>/moduleshowservlet?module=4">时尚</A> 
<!-- Forum Description (if it exists) --><SPAN 
            class=jive-description><BR>
</SPAN></TD>
          <TD class=jive-view-count noWrap width="6%"><%=(Integer)request.getAttribute("view4") %> </TD>
          <TD class=jive-msg-count noWrap width="10%"><!-- Thread and Message Counts --><%=request.getAttribute("sub4") %> / <%=request.getAttribute("total4") %> </TD>
          <TD class=jive-last noWrap width="15%">
            <DIV 
            class=jive-last-post><!-- Modification Date and Last Post --><%=request.getAttribute("time4") %>
            <!-- Show the last post link if that feature is enabled --><BR>最后发表: 
            <%=request.getAttribute("author4")%> </DIV></TD></TR>
        <TR class=jive-even>
          <TD class=jive-first vAlign=top width="3%">
            <DIV class=jive-icon><IMG height=16 alt=读 
            src="<%=path%>/image/read-16x16.gif" width=16 border=0> </DIV></TD>
          <TD class=jive-forum-name vAlign=top 
            width="66%"><!-- Forum Name --><A class=jive-forum-name 
            id=jive-forum-5 
            href="<%=path %>/moduleshowservlet?module=5">娱乐</A> 
<!-- Forum Description (if it exists) --><SPAN 
            class=jive-description><BR>
</SPAN></TD>
          <TD class=jive-view-count noWrap width="6%"><%=(Integer)request.getAttribute("view5") %> </TD>
          <TD class=jive-msg-count noWrap width="10%"><!-- Thread and Message Counts --><%=request.getAttribute("sub5") %> / <%=request.getAttribute("total5") %> </TD>
          <TD class=jive-last noWrap width="15%">
            <DIV 
            class=jive-last-post><!-- Modification Date and Last Post --><%=request.getAttribute("time5") %>
            <!-- Show the last post link if that feature is enabled --><BR>最后发表: 
            <%=request.getAttribute("author5")%> </DIV></TD></TR>
        <TR class=jive-odd>
          <TD class=jive-first vAlign=top width="3%">
            <DIV class=jive-icon><IMG height=16 alt=读 
            src="<%=path%>/image/read-16x16.gif" width=16 border=0> </DIV></TD>
          <TD class=jive-forum-name vAlign=top 
            width="66%"><!-- Forum Name --><A class=jive-forum-name 
            id=jive-forum-6 
            href="<%=path %>/moduleshowservlet?module=6">体育</A> 
<!-- Forum Description (if it exists) --><SPAN 
            class=jive-description><BR>
</SPAN></TD>
          <TD class=jive-view-count noWrap width="6%"><%=(Integer)request.getAttribute("view6") %> </TD>
          <TD class=jive-msg-count noWrap width="10%"><!-- Thread and Message Counts --><%=request.getAttribute("sub6") %> / <%=request.getAttribute("total6") %> </TD>
          <TD class=jive-last noWrap width="15%">
            <DIV 
            class=jive-last-post><!-- Modification Date and Last Post --><%=request.getAttribute("time6") %>
            <!-- Show the last post link if that feature is enabled --><BR>最后发表: 
            <%=request.getAttribute("author6")%> </DIV></TD></TR>
        <TR class=jive-even>
          <TD class=jive-first vAlign=top width="3%">
            <DIV class=jive-icon><IMG height=16 alt=读 
            src="<%=path%>/image/read-16x16.gif" width=16 border=0> </DIV></TD>
          <TD class=jive-forum-name vAlign=top 
            width="66%"><!-- Forum Name --><A class=jive-forum-name 
            id=jive-forum-7 
            href="<%=path %>/moduleshowservlet?module=7">校园</A> 
<!-- Forum Description (if it exists) --><SPAN 
            class=jive-description><BR>
</SPAN></TD>
          <TD class=jive-view-count noWrap width="6%"><%=(Integer)request.getAttribute("view7") %></TD>
          <TD class=jive-msg-count noWrap width="10%"><!-- Thread and Message Counts --><%=request.getAttribute("sub7") %> / <%=request.getAttribute("total7") %> </TD>
          <TD class=jive-last noWrap width="15%">
            <DIV 
            class=jive-last-post><!-- Modification Date and Last Post --><%=request.getAttribute("time7") %>
            <!-- Show the last post link if that feature is enabled --><BR>最后发表: 
            <%=request.getAttribute("author7")%> </DIV></TD></TR>
        <TR class=jive-odd>
          <TD class=jive-first vAlign=top width="3%">
            <DIV class=jive-icon><IMG height=16 alt=读 
            src="<%=path%>/image/read-16x16.gif" width=16 border=0> </DIV></TD>
          <TD class=jive-forum-name vAlign=top 
            width="66%"><!-- Forum Name --><A class=jive-forum-name 
            id=jive-forum-8 
            href="<%=path %>/moduleshowservlet?module=8">城市</A> 
<!-- Forum Description (if it exists) --><SPAN 
            class=jive-description><BR>
</SPAN></TD>
          <TD class=jive-view-count noWrap width="6%"><%=(Integer)request.getAttribute("view8") %> </TD>
          <TD class=jive-msg-count noWrap width="10%"><!-- Thread and Message Counts --><%=request.getAttribute("sub8") %> / <%=request.getAttribute("total8") %> </TD>
          <TD class=jive-last noWrap width="15%">
            <DIV 
            class=jive-last-post><!-- Modification Date and Last Post --><%=request.getAttribute("time8") %>
            <!-- Show the last post link if that feature is enabled --><BR>最后发表: 
            <%=request.getAttribute("author8")%></DIV></TD></TR>
        <TR>
          <TD class=jive-category-name colSpan=5> 
            站务建设区
            <SPAN class=jive-description><BR></SPAN></TD></TR>
        <TR class=jive-even>
          <TD class=jive-first vAlign=top width="3%">
            <DIV class=jive-icon><IMG height=16 alt=读 
            src="<%=path%>/image/read-16x16.gif" width=16 border=0> </DIV></TD>
          <TD class=jive-forum-name vAlign=top 
            width="66%"><!-- Forum Name --><A class=jive-forum-name 
            id=jive-forum-1 
            href="<%=path %>/moduleshowservlet?module=9">站务建设</A> <!-- Forum Description (if it exists) --><SPAN 
            class=jive-description><BR>
            站务讨论、版主申请、您的建议... </SPAN></TD>
          <TD class=jive-view-count noWrap width="6%"><%=(Integer)request.getAttribute("view9") %> </TD>
          <TD class=jive-msg-count noWrap width="10%"><!-- Thread and Message Counts --><%=request.getAttribute("sub9") %> / <%=request.getAttribute("total9") %> </TD>
          <TD class=jive-last noWrap width="15%">
            <DIV 
            class=jive-last-post><!-- Modification Date and Last Post --><%=request.getAttribute("time9") %>
            <!-- Show the last post link if that feature is enabled --><BR>最后发表: 
            <%=request.getAttribute("author9")%></DIV></TD></TR>
        <TR class=jive-odd>
          <TD class=jive-first vAlign=top width="3%">
            <DIV class=jive-icon><IMG height=16 alt=读 
            src="<%=path%>/image/read-16x16.gif" width=16 border=0> </DIV></TD>
          <TD class=jive-forum-name vAlign=top 
            width="66%"><!-- Forum Name --><A class=jive-forum-name 
            id=jive-forum-2 
            href="<%=path %>/moduleshowservlet?module=10">论坛公告区</A> 
<!-- Forum Description (if it exists) --><SPAN 
            class=jive-description><BR>
本站动态公告,新论坛开放公告，版主任免等 </SPAN></TD>
          <TD class=jive-view-count noWrap width="6%"><%=(Integer)request.getAttribute("view10") %> </TD>
          <TD class=jive-msg-count noWrap width="10%"><!-- Thread and Message Counts --><%=request.getAttribute("sub10") %> / <%=request.getAttribute("total10") %> </TD>
          <TD class=jive-last noWrap width="15%">
            <DIV 
            class=jive-last-post><!-- Modification Date and Last Post --><%=request.getAttribute("time10") %>
            <!-- Show the last post link if that feature is enabled --><BR>最后发表: 
            <%=request.getAttribute("author10")%></DIV></TD></TR>
        <TR class=jive-even>
          <TD class=jive-first vAlign=top width="3%">
            <DIV class=jive-icon><IMG height=16 alt=读 
            src="<%=path%>/image/read-16x16.gif" width=16 border=0> </DIV></TD>
          <TD class=jive-forum-name vAlign=top 
            width="66%"><!-- Forum Name --><A class=jive-forum-name 
            id=jive-forum-3 
            href="<%=path %>/moduleshowservlet?module=11">论坛测试/BUG报告/建议</A> 
<!-- Forum Description (if it exists) --><SPAN 
            class=jive-description><BR>
论坛测试,bug报告，建议等。。。 </SPAN></TD>
          <TD class=jive-view-count noWrap width="6%"><%=(Integer)request.getAttribute("view11") %> </TD>
          <TD class=jive-msg-count noWrap width="10%"><!-- Thread and Message Counts --><%=request.getAttribute("sub11") %> / <%=request.getAttribute("total11") %> </TD>
          <TD class=jive-last noWrap width="15%">
            <DIV 
            class=jive-last-post><!-- Modification Date and Last Post --><%=request.getAttribute("time11") %>
            <!-- Show the last post link if that feature is enabled --><BR>最后发表: 
            <%=request.getAttribute("author11")%> </DIV></TD></TR>
        <TR class=jive-odd>
          <TD class=jive-first vAlign=top width="3%">
            <DIV class=jive-icon><IMG height=16 alt=读 
            src="<%=path%>/image/read-16x16.gif" width=16 border=0> </DIV></TD>
          <TD class=jive-forum-name vAlign=top 
            width="66%"><!-- Forum Name --><A class=jive-forum-name 
            id=jive-forum-4 
            href="<%=path %>/moduleshowservlet?module=12">回收站</A> <!-- Forum Description (if it exists) --><SPAN 
            class=jive-description><BR>
            这里是没用或重复发表的帖子，将定期删除。 </SPAN></TD>
          <TD class=jive-view-count noWrap width="6%"><%=(Integer)request.getAttribute("view12") %> </TD>
          <TD class=jive-msg-count noWrap width="10%"><!-- Thread and Message Counts --><%=request.getAttribute("sub12") %> / <%=request.getAttribute("total12") %> </TD>
          <TD class=jive-last noWrap width="15%">
            <DIV 
            class=jive-last-post><!-- Modification Date and Last Post --><%=request.getAttribute("time12") %>
            <!-- Show the last post link if that feature is enabled --><BR>最后发表: 
            <%=request.getAttribute("author12")%> </DIV></TD></TR></TBODY></TABLE>
      </DIV></DIV>
      <BR>
      <DIV class=jive-legend>
      <TABLE cellSpacing=0 cellPadding=0 summary="" border=0>
        <TBODY></TBODY></TABLE></DIV></TD>
    <TD width="1%">
      <DIV class=jive-portlet-box>
        <!-- END sidebar box 'POPULAR TAGS' -->
      </DIV>
      </TD></TR></TBODY></TABLE></FORM></DIV><BR><BR>
<TABLE id=jive-footer cellSpacing=0 cellPadding=6 width="100%" border=0>
  <TBODY>
  <TR>
    <TD> </TD>
  </TR></TBODY></TABLE></BODY></HTML>
