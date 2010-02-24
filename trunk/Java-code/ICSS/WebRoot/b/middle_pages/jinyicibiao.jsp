<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="icss.abc.base.db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "新宋体";
	font-size: 24px;
	font-weight: bold;
}
.STYLE2 {color: #0000FF}
.STYLE5 {font-size: 24px}
.STYLE7 {font-size: 24px; font-weight: bold; }
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
body{
     font-family:"宋体";
	 font-size:12px;
}
-->
</style>
<SCRIPT LANGUAGE="JScript">

function testNull(){
	var fm = window.document.form1;

	if( form1.newword.value =="") {
		window.alert("\请输入新添加的一个词汇。");
		fm.textfield2.focus();
		return false;
	}	
	else
	{
	    document.form1.action="../actionjsp/addWords.jsp";
		document.form1.submit();
	}
}

</SCRIPT>
</head>

<body><form id="form1" name="form1" method="post" action="">　
<table width="98%" height="100%" border="0" cellspacing="0">
  <tr>
    <td height="43" colspan="2"><div align="center" class="STYLE1"><a name="top" id="top"></a>近义词表</div></td>
  </tr>
  <tr>
    <td height="21" colspan="2">
	  <table width="100%" border="0" cellpadding="0" cellspacing="0" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)">
        <tr>
          <td width="15%" valign="top">
            <label>选择字母：
              <select name="characters">
			    <option value="a">A</option>
				<option value="b">B</option>
				<option value="c">C</option>
				<option value="d">D</option>
				<option value="e">E</option>
				<option value="f">F</option>
				<option value="g">G</option>
				<option value="h">H</option>
				<option value="i">I</option>
				<option value="j">J</option>
				<option value="k">K</option>
				<option value="l">L</option>
				<option value="m">M</option>
				<option value="n">N</option>
				<option value="o">O</option>
				<option value="p">P</option>
				<option value="q">Q</option>
				<option value="r">R</option>
				<option value="s">S</option>
				<option value="t">T</option>
				<option value="u">U</option>
				<option value="v">V</option>
				<option value="w">W</option>
				<option value="x">X</option>
				<option value="y">Y</option>
				<option value="z">Z</option>
              </select>
              </label>
          <!--</form>-->          <!--<form id="form3" name="form3" method="post" action="">-->
            <label></label>          </td>
          <td width="83%">
		    <!--<form name="form2" method="post" action=""> -->添加词
            <input name="newword" type="text" size="20" />
            <input type="button" name="Submit3" value="添加" onclick="testNull();"/>
	        <!--</form>--></td>
        </tr>
      </table>	 </td>
  </tr>
  <tr>
    <td height="21" colspan="2">字母检索 　<span class="STYLE2"><a href="#A">Ａ</a>　<a href="#B">Ｂ</a>　<a href="#C">Ｃ</a>　<a href="#D">Ｄ</a>　<a href="#E">Ｅ</a>　<a href="#F">Ｆ</a>　<a href="#G">Ｇ</a>　<a href="#H">Ｈ</a>　<a href="#I">Ｉ</a>　<a href="#J">Ｊ</a>　<a href="#K">Ｋ</a>　<a href="#L">Ｌ</a>　<a href="#M">Ｍ</a>　<a href="#N">Ｎ</a>　<a href="#O">Ｏ</a>　<a href="#P">Ｐ</a>　<a href="#Q">Ｑ</a>　<a href="#R">Ｒ</a>　<a href="#S">Ｓ</a>　<a href="#T">Ｔ</a>　<a href="#U">Ｕ</a>　<a href="#V">Ｖ</a>　<a href="#W">Ｗ</a>　<a href="#X">Ｘ</a>　<a href="#Y">Ｙ</a>　<a href="#Z">Ｚ</a></span> </td>
  </tr>
<%
    //连接数据库，获得近义词汇列表
    ResultSet  rs = null;
    PreparedStatement stmt = null;
	Connection conn = null;

    //页面中临时变量
    int wordid = 0;
    String word = "";
    int wordgroup = 0;

    try{
        conn=DBConnection.getConnection();
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
  <tr>
    <td width="92%" height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><a name="A" id="A"></a>A</span></td>
    <td width="6%" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
    <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='a'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="B" id="B"></a>B</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='b'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="C" id="C"></a>C</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='c'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="D" id="D"></a>D</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='d'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="E" id="E"></a>E</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='e'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="F" id="F"></a>F</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='f'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="G" id="G"></a>G</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='g'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="H" id="H"></a>H</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='h'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="I" id="I"></a>I</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='i'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="J" id="J"></a>J</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='j'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="K" id="K"></a>K</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='k'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="L" id="L"></a>L</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='l'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="M" id="M"></a>M</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='m'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="N" id="N"></a>N</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='n'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="O" id="O"></a>O</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='o'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="P" id="P"></a>P</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='p'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="Q" id="Q"></a>Q</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='q'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="R" id="R"></a>R</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='r'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="S" id="S"></a>S</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='s'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="T" id="T"></a>T</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='t'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="U" id="U"></a>U</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='u'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="V" id="V"></a>V</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='v'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="W" id="W"></a>W</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='w'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="X" id="X"></a>X</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='x'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="Y" id="Y"></a>Y</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='y'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
    </td>
  </tr>
  <tr>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><span class="STYLE5"><strong><a name="Z" id="Z"></a>Z</strong></span></td>
    <td height="26" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><a href="#top">Top</a></td>
  </tr>
  <tr>
        <td colspan="2">
<%
    try{
        //创建Statement
	    stmt = conn.prepareStatement("select wordid,word,wordgroup from words where letter='z'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
        
        if(!rs.next()){//没有词汇时用空位占
%>
    &nbsp;
<%
        }
        else{
            rs.beforeFirst();
            while(rs.next()){
                wordid = rs.getInt("wordid");
                word = rs.getString("word");
                wordgroup = rs.getInt("wordgroup");
%>
    <a href="jinyicibiao2.jsp?wordgroup=<%=wordgroup%>&wordid=<%=wordid%>"><%=word%>&nbsp;&nbsp;</a>
<%
            }
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }finally{try{
    if(stmt!=null)	stmt.close();
    if(conn!=null)	conn.close();
    }catch(Exception e){}
    }
%>
    </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table></form>
</body>
</html>
