<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import = "ef.luolei.subject.vo.*" %>
<%@ page import = "ef.luolei.reply.vo.*" %>
<%@ page import =  "ef.luolei.user.vo.UserVO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

NewSubject nsVO = (NewSubject)request.getAttribute("subject");
List replyList = (ArrayList)request.getAttribute("replyList");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0066)http://bbs.chinajavaworld.com/thread.jspa?threadID=756354&tstart=0 -->
<HTML><HEAD><TITLE>论坛: <%=nsVO.getTitle() %></TITLE>
<META http-equiv=content-type content="text/html; charset=UTF-8"><LINK 
href="<%=path%>/image2/style.css" type=text/css rel=stylesheet><LINK 
title=RSS 
href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?threadID=756354" 
type=application/rss+xml rel=alternate>
<SCRIPT language=JavaScript src="<%=path%>/image2/prototype.js" 
type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/image2/effects.js" 
type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/image2/engine.js" 
type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/image2/util.js" 
type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/image2/TagValidator.js" 
type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/image2/tag-validator.js" 
type=text/javascript></SCRIPT>

<SCRIPT type=text/javascript>
            // i18n error message
            tagHandlerMessage = "至少有一个标签出错，请确认标签非数字而且少于 10 个字符";
        </SCRIPT>

<META content="MSHTML 6.00.2900.3429" name=GENERATOR></HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD width="1%">u</TD>
    <TD width="98%"><IMG height=38 alt="" 
      src="<%=path%>/image2/header-stretch.gif" width="100%" 
    border=0></TD>
    <TD width="1%"><IMG height=38 alt="" 
      src="<%=path%>/image2/header-right.gif" width=5 
  border=0></TD></TR></TBODY></TABLE><BR>
    <BR>
    <P class=jive-page-title>主题: <%=nsVO.getTitle() %> </P>
<P class=jive-description></P>
<DIV id=jive-flatpage>
<DIV class=jive-infobox id=jive-question-box></DIV>
<BR>
<DIV class=jive-buttons>
<TABLE cellSpacing=0 cellPadding=0 summary=Buttons border=0>
  <TBODY>
  <TR>
    <TD class=jive-icon><A 
      href="http://bbs.chinajavaworld.com/post!reply.jspa?threadID=756354"><IMG 
      height=16 alt=回复主题 src="<%=path%>/image2/reply-16x16.gif" 
      width=16 border=0></A></TD>
    <TD class=jive-icon-label><A id=jive-reply-thread 
      href="http://bbs.chinajavaworld.com/post!reply.jspa?threadID=756354">回复主题</A> 
    </TD>
    <TD class=jive-icon><IMG height=16 alt=搜索论坛 
      src="<%=path%>/image2/search-16x16.gif" width=16 
border=0></TD>
    <TD class=jive-icon-label><A 
      href="http://bbs.chinajavaworld.com/search!default.jspa?objID=f20">搜索论坛</A> 
    </TD>
    <TD class=jive-icon><A 
      href="asdf"><IMG height=16 
      alt=返回主题列表 src="<%=path%>/image2/arrow-left-16x16.gif" width=16 
      border=0></A> </TD>
    <TD class=jive-icon-label><A 
      href="asdf">返回主题列表</A> 
  </TD></TR></TBODY></TABLE></DIV><BR>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR vAlign=top>
    <TD width="100%">
      <DIV class=jive-message-list>
      <DIV class=jive-table>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <THEAD>
        <TR>
          <TH class=jive-first-last>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <THEAD>
              <TR>
                <TH width="1%"><A title=链接 
                  href="http://bbs.chinajavaworld.com/thread.jspa?threadID=756354"><IMG 
                  height=16 alt=链接 
                  src="<%=path%>/image2/permlink-16x16.gif" width=16 
                  border=0></A> </TH>
                <TH width="97%"><NOBR>回复: <%=nsVO.getReplyamount() %> </NOBR>- <NOBR>页数: 1 </NOBR>- 
                  <NOBR>最后发表: <%if(replyList.size()>0){ %>
                  <%=((ReplyVO)replyList.get(replyList.size()-1)).getTime() %> 
                   最后发表: 
                  <%=((ReplyVO)replyList.get(replyList.size()-1)).getAuthor() %> 
                  <%}else{ %>
                  <%=nsVO.getTime() %>
                  
                  最后发表:     
                  <%=nsVO.getAuthor() %> 
                  <%} %>
                  </NOBR></TH>
                <TH noWrap width="1%">主题: [ <A 
                  href="">上一个</A> 
                  | <A 
                  href="">下一个</A> 
                  ] </TH></TR></THEAD>
              <TBODY></TBODY></TABLE></TH></TR></THEAD>
        <TBODY></TBODY></TABLE></DIV></DIV>
      <DIV id=jive-message-holder>
      <DIV class=jive-message-list>
      <DIV class=jive-table>
      <DIV class=jive-messagebox>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" summary=Message 
        border=0><TBODY>
        <TR class=jive-even id=jive-message-807491 vAlign=top>
          <TD class=jive-first width="1%">
            <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
              <TBODY>
              <TR>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR vAlign=top>
                      <TD 
                      style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px" 
                      width="100%"><NOBR><A title=zhengjiong 
                        href=""><%=nsVO.getAuthor() %></A> 
                        </NOBR></TD></TR>
                    <TR>
                      <TD 
                      style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px"><IMG 
                        class=jive-status-level-image title=世界小虫 alt="" 
                        src="<%=path%>/image2/green-sequare-1.gif" 
                        border=0><BR></TD></TR></TBODY></TABLE><IMG 
                  src="<%=path%>/image2/bbs-offline.gif" border=0> 
                  <BR><SPAN class=jive-description>发帖: <%=nsVO.getUserVO().getSubjectnum() %> <BR>
                 <SPAN class=jive-description>回帖: <%=nsVO.getUserVO().getRenum() %> <BR>积分: <%=nsVO.getUserVO().getScore() %> <BR> 
                  </SPAN></TD>
              </TR></TBODY></TABLE></TD>
          <TD class=jive-last width="99%">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR vAlign=top>
                <TD width="1%">&quot;</TD>
                <TD width="97%"><SPAN class=jive-subject><A 
                  name=807491></A><%=nsVO.getTitle() %> </SPAN><BR><SPAN 
                  class=jive-description>发表于: <%=nsVO.getTime() %> </SPAN></TD>
                <TD class=jive-rating-buttons noWrap width="1%">&nbsp; </TD>
                <TD width="1%">
                  <DIV class=jive-buttons>
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD>&nbsp;</TD>
                      <TD class=jive-icon><A title=回复本主题 
                        href="asdf"><IMG 
                        height=16 alt=回复本主题 
                        src="<%=path%>/image2/reply-16x16.gif" 
                        width=16 border=0></A> </TD>
                      <TD class=jive-icon-label><A title=回复本主题 
                        href="asdf">回复</A> 
                      </TD></TR></TBODY></TABLE></DIV></TD></TR>
              <TR>
                <TD colSpan=4>
                  <DIV class=jive-message-body><%=nsVO.getContent() %></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></DIV></DIV>
      <%
      ReplyVO replyVO = null;
      for(int i=0; i<replyList.size(); i++){
      		replyVO = (ReplyVO)replyList.get(i);
       %>
      
      <DIV class=jive-message-list>
      <DIV class=jive-table>
      <DIV class=jive-messagebox>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" summary=Message 
        border=0><TBODY>
        <TR class=jive-odd id=jive-message-807524 vAlign=top>
          <TD class=jive-first width="1%">
            <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
              <TBODY>
              <TR>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR vAlign=top>
                      <TD 
                      style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px" 
                      width="100%"><NOBR><A title=263qiang 
                        href="adsf"><%=replyVO.getAuthor() %></A> 
                        </NOBR></TD></TR>
                    
                    <TR>
                      <TD 
                      style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px"><IMG 
                        class=jive-status-level-image title=世界小虫 alt="" 
                        src="<%=path%>/image2/green-sequare-1.gif" 
                        border=0><BR></TD></TR></TBODY></TABLE><IMG 
                  src="<%=path%>/image2/bbs-offline.gif" border=0> 
                  <BR><SPAN class=jive-description>发帖: <%=replyVO.getUserVO().getSubjectnum() %> 
                  <BR><SPAN class=jive-description>回帖: <%=replyVO.getUserVO().getRenum() %><BR>积分: <%=replyVO.getUserVO().getScore() %> <BR>
                   </SPAN></TD>
              </TR></TBODY></TABLE></TD>
          <TD class=jive-last width="99%">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR vAlign=top>
                <TD width="1%">i</TD>
                <TD width="97%"><SPAN class=jive-subject><A 
                  name=807524></A>Re: <%=nsVO.getTitle() %> </SPAN><BR><SPAN 
                  class=jive-description>发表于: <%=replyVO.getTime() %> &nbsp; <NOBR><A 
                  title="原文: zhengjiong" 
                  href="http://bbs.chinajavaworld.com/message.jspa?messageID=807491#807491"><IMG 
                  title="原文: zhengjiong" height=10 alt="原文: zhengjiong" 
                  src="<%=path%>/image2/up-10x10.gif" width=10 
                  border=0></A> 原文: <A title=到帖子 
                  href="asdf"><%=nsVO.getAuthor() %></A> 
                  </NOBR></SPAN></TD>
                <TD class=jive-rating-buttons noWrap width="1%">&nbsp; </TD>
                <TD width="1%">
                  <DIV class=jive-buttons>
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD>&nbsp;</TD>
                      <TD class=jive-icon><A title=回复本主题 
                        href="asdf"><IMG 
                        height=16 alt=回复本主题 
                        src="<%=path%>/image2/reply-16x16.gif" 
                        width=16 border=0></A> </TD>
                      <TD class=jive-icon-label><A title=回复本主题 
                        href="asdf">回复</A> 
                      </TD></TR></TBODY></TABLE></DIV></TD></TR>
              <TR>
                <TD colSpan=4>
                  <DIV class=jive-message-body><%=replyVO.getContent() %></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></DIV></DIV>
                  
                  
      <%
      
      }
      
       %>
      <DIV class=jive-message-list>
      <DIV class=jive-table>
      <DIV class=jive-messagebox>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" summary=Message 
        border=0><TBODY>
        <TR class=jive-odd id=jive-message-807756 vAlign=top>
          <TD class=jive-first width="1%">&nbsp;</TD>
          </TR></TBODY></TABLE>
      </DIV></DIV></DIV>
      <DIV class=jive-message-list-footer>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD noWrap width="1%"><SPAN class=jive-paginator-bottom><NOBR>页数: 1 
            </NOBR></SPAN></TD>
          <TD align=middle width="98%">
            <TABLE cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD><A 
                  href="asdf"><IMG 
                  height=16 alt=返回主题列表 hspace=6 
                  src="<%=path%>/image2/arrow-left-16x16.gif" width=16 
                  border=0></A> </TD>
                <TD><A 
                  href="asdf">返回主题列表</A> 
                </TD></TR></TBODY></TABLE></TD>
          <TD noWrap width="1%">主题: [ <A 
            href="asdf">上一个</A> 
            | <A 
            href="adsf">下一个</A> 
            ] </TD></TR></TBODY></TABLE></DIV></DIV></TD></TR></TBODY></TABLE><BR>
<BR>
<BR></DIV><BR><BR>
</BODY></HTML>
