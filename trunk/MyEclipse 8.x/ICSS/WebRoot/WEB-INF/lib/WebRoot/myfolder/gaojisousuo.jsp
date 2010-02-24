<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML><HEAD><TITLE>高级搜索</TITLE>
<STYLE>
.f9 {
	FONT-SIZE: 9pt; LINE-HEIGHT: 18px
}
.f14 {
	FONT-SIZE: 14px
}
.w {
	COLOR: #ffffff
}
.p2 {
	WIDTH: 75%; LINE-HEIGHT: 120%; align: left
}
P {
	LINE-HEIGHT: 120%
}
.f12 {
	FONT-SIZE: 12px
}
TD {
	FONT-SIZE: 9pt; LINE-HEIGHT: 18px
}
.c {
	COLOR: #7777cc
}
.fr {
	COLOR: #e10900
}
.htb {
	MARGIN-BOTTOM: 5px
}
#ft {
	CLEAR: both; BACKGROUND: #e6e6e6; LINE-HEIGHT: 20px; TEXT-ALIGN: center
}
#ft {
	FONT-SIZE: 12px; COLOR: #77c; FONT-FAMILY: Arial; WHITE-SPACE: nowrap
}
#ft  {
	FONT-SIZE: 12px; COLOR: #77c; FONT-FAMILY: Arial; WHITE-SPACE: nowrap
}
BODY {
	MARGIN-BOTTOM: 4px
}
</STYLE>



<META content="MSHTML 6.00.2900.3354" name=GENERATOR></HEAD>
<BODY text=#000000 bottomMargin=0 link=#261cdc bgColor=#ffffff leftMargin=0 
topMargin=6  rightMargin=0>
<TABLE class=htb cellSpacing=0 cellPadding=0 width="100%" align=center 
  border=0><TBODY>
  <TR vAlign=center>
    <TD style="PADDING-LEFT: 8px; WIDTH: 37px"><span style="FONT-FAMILY: Arial"><img height=96 src="sousuojiegou.files/logo-yy1.jpg" 
      width=96 border=0></span></TD>
    <TD style="FONT-FAMILY: Arial">&nbsp;&nbsp;&nbsp;
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      </TD>
    <TD vAlign=center width="100%">
      <TABLE style="MARGIN-TOP: 15px" height=37 cellSpacing=0 cellPadding=0 
      width="100%" border=0>
        <TBODY>
        <TR bgColor=#d9e1f7>
          <TD height="37"><B>&nbsp;高级搜索</B></TD>
          <TD align=right>&nbsp;</TD>
        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<s:form  name="f1" action="supersearch_action" method="post"
target="_blank" theme="simple">
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
    <TD>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR bgColor=#eeeeee>
          <TD>
            <TABLE cellSpacing=0 cellPadding=2 width="98%" align=center>
              <TBODY>
              <TR>
                <TD width="15%" height="31" vAlign=middle><p><B>搜索结果</B></p>
                  <br></TD>
                <TD width="85%">
                  <TABLE cellSpacing=0 cellPadding=2 width="100%">
                    <TBODY>
                    <TR>
                      <TD width="34%" height="25">包含以下<strong>关键词</strong><br></TD>
                      <TD width="31%"><s:textfield label="搜索" name="searchtext" theme = "simple"/></TD>
                      <TD vAlign=top width="35%" rowSpan="4"><s:submit value="偷窥一下" theme="simple"/></TD></TR>
                    <TR>                    </TR>
                    <TR>                    </TR>
                    <TR>
                      </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
        <TR bgColor=#ffffff></TR>
        <TR bgColor=#ffffff>
          <TD>
            <TABLE style="MARGIN-TOP: 5px" cellSpacing=0 cellPadding=2 
            width="98%" align=center>
              <TBODY>
              <TR bgColor=#ffffff>
                <TD width="15%"><B>搜索结果显示条数</B></TD>
                <TD width="29%">选择搜索结果显示的条数　</TD>
                <TD width="56%"><s:select name="items" list="%{#{'10':'每页显示10条','20':'每页显示20条','50':'每页显示50条','100':'每页显示100条'}}"value="10"theme="simple"/></TD></TR>
              <TR>
                <TD width="15%"><B>时间</B></TD>
                <TD width="29%">限定要文件上传的时间是</TD>
                <TD width="56%"><FONT size=-1><s:select name="times" list="%{#{'0':'全部时间','1':'最近一天','2':'最近一周','3':'最近一月','4':'最近一年'}}" value="0" theme="simple"/>
                  </FONT></TD></TR></TBODY>
              <TBODY></TBODY></TABLE></TD></TR>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=2 width="98%" align=center 
border=0>
              <TBODY>
              <TR bgColor=#ffffff>
                <TD width="15%"><strong>上传人</strong></TD>
                <TD width="29%">搜索文件通过上传人</TD>
                <TD width="56%"><s:textfield maxLength="100" size="35" 
                  name="fileauthor" theme="simple"/></TD></TR>
              <TR bgColor=#ffffff>
                <TD><B>文档格式</B></TD>
                <TD>搜索网页格式是</TD>
                <TD><s:select size="1" name="filetype" list="%{#{'0':'全部文件','1':'视频文件','2':'音频文件','3':'其他文件'}}" value ="0" theme="simple"/>
                                 </TD>
              </TR>
              <TR bgColor=#ffffff>
                <TD width="15%"><B>搜索范围</B></TD>
                <TD width="29%">限定要搜索范围</TD>
                <TD width="56%"><FONT size=-1> <s:radio name="filescope" list="%{#{'0':'公共文件和部门文件','1':'仅在公共文件','2':'仅在部门文件'}}"value="0" theme="simple"/>
                  
                    </FONT></TD></TR></TBODY>
              <TBODY></TBODY></TABLE></TD></TR></TABLE></TD></TR></TBODY></TABLE>
<TABLE style="MARGIN-TOP: 15px" height=20 cellSpacing=0 cellPadding=0 
width="100%" border=0>
  <TBODY>
  <TR bgColor=#d9e1f7>
    <TD><B>&nbsp;个性化搜索</B></TD>
    <TD align=right>&nbsp;</TD></TR></TBODY></TABLE><BR>

<TABLE cellSpacing=0 cellPadding=0 width="98%" align=center border=0>
  <TBODY>
  <TR>
    <TD>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR bgColor=#ffffff>
                <TD width="15%"><strong>搜索近义词</strong></TD>
                <TD width="29%">设定您是否使用近义词搜索</TD>
                <TD noWrap width="56%"><s:radio name="similarwords" list="%{#{'0':'否','1':'是'}}" value="0" theme="simple"/>
               </TD></TR>
              <TBODY></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><BR>
<DIV align=center>
<TABLE width="98%" border=0>
  <TBODY>
  <TR>
    <TD>TeamABC找你想要的</TD>
  </TR></TBODY></TABLE><BR>
</DIV>
</s:form><BR><BR>
<DIV id=ft>&copy;2008 TeamABC</DIV>
</BODY></HTML>
