<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="icss.abc.base.db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��ϸ����ʱ�</title>
<script src="../resure.js"></script>
<%
    //���ǰҳ�洫���Ĳ���
    int wordgroup = Integer.parseInt(request.getParameter("wordgroup"));
    int wordid = Integer.parseInt(request.getParameter("wordid"));
    String word1 = "";
    if(wordid==-1){word1="û�д���";}
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
//��ӷ����������ҳ���ύ������û������ڱ�ҳ����л������ء������ݴ���ҳ�淵�ص���Ϣ����������
function add(){
	var fm = window.document.formadd;
	var word = fm.newword;

	if( word.value =="") {
		window.alert("\�������½����?");
		word.focus();
		return false;
	}
	else if(fm.select.value=="0"){
	        window.alert("\��ѡ���´ʵ�������ĸ");
	        fm.select.focus();
	        return false;
	}else{
	    document.formadd.action="../actionjsp/addSynonym.jsp?wordgroup="+<%=wordgroup%>;
	    document.formadd.submit();
	}
	
}	

//ɾ������������ҳ���ύ��Ϣ�����ݷ�����Ϣ��ȡ����
function del(){
    var fm = window.document.formdelet;
	var word = fm.delword;

	if( word.value =="") {
		window.alert("\������Ҫɾ���Ľ����?");
		word.focus();
		return false;
	}
	else{
	    document.formdelet.action="../actionjsp/delSynonym.jsp?wordgroup=<%=wordgroup%>&word='<%=word1%>'";
	    document.formdelet.submit();
	}
}
-->
</SCRIPT>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "������";
	font-size: 24px;
	font-weight: bold;
}
.STYLE2 {color: #0000FF}
.STYLE5 {font-size: 24px}
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
     font-family:"����";
	 font-size:12px;
}
-->
</style>
</head>

<body>
<%
    //�������ݿ⣬��ý���ʻ��б�
    ResultSet  rs = null;
    PreparedStatement stmt = null;
	Connection conn = null;

    try{
        conn=DBConnection.getConnection();
    }catch(Exception e){
        System.out.println(e.toString());
    }


    try{
    
        stmt = conn.prepareStatement("select word from words where wordgroup="+wordgroup+" and wordid="+wordid);
        rs=stmt.executeQuery();
        rs.next();
        word1=rs.getString("word");
        //����Statement
	    stmt = conn.prepareStatement("select word from words where wordgroup="+wordgroup+" and word<>'"+word1+"'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //ִ��ȡ�ý����(��ѯ)
	    rs = stmt.executeQuery();
    }catch(Exception e){
        System.out.println(e.toString());
    }finally{try{
    if(stmt!=null)	stmt.close();
    if(conn!=null)	conn.close();
    }catch(Exception e){}
    }
%>
<table width="99%" height="100%" border="0" cellspacing="0" id="test" style="table-layout: fixed;WORD-BREAK: keep-all; WORD-WRAP: break-word"

>
  <tr>
    <td height="43" colspan="2"><div align="center" class="STYLE1">����ʱ�</div></td>
  </tr>
  <tr>
    <td width="95%" height="26" bgcolor="#BED9EB" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#BED9EB, endColorStr=#FFFFFF, gradientType=0)"><span class="STYLE5"><%=word1%>
      
    </span></td>
    <td width="5%" align="right" bgcolor="#BED9EB" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#BED9EB, endColorStr=#FFFFFF, gradientType=0)"><a href="jinyicibiao.jsp">����</a></td>
  </tr>
  <tr>
<!--�ֵ�Ŀ¼2ҳ�е������ʿ��Խ���ز������ر�ҳ��ʾ��һ���б�,����ʵ��ȥ��-->
    <td height="24" colspan="2" id="test1"><div id="add"></div>
<%
    try{
        if(!rs.next()){//û�дʻ�ʱ�ÿ�λռ
%>
    <%=word1%>
<%
        }
        else{
%>
        <%=word1%>&nbsp;&nbsp;
<%
            rs.beforeFirst();
            while(rs.next()){
%>
        <%=rs.getString("word")%>&nbsp;&nbsp;
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
    <td height="1.5" colspan="2" bgcolor="#BED9EB"></td>
  </tr>
  <tr>
    <td height="36" colspan="2"> <form name="formadd" method="post" action="" >
	  <input name="newword" type="text" size="20" />
      <input type="button" onclick="add();" name="Submit" value="���" />
      <select name="select">
          <option value="0">--��ѡ��--</option>
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
	   ������������ĸ
	  </form>
	  <form name="formdelet" method="post" action=""> 
      <input name="delword" type="text" size="20" />
      <input type="button" name="Submit2" value="ɾ��" onclick="del();"/>
	  </form></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
</body>
</html>