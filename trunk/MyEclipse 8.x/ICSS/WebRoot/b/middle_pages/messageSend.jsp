<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%
  
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="icss.abc.base.db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE4 {color: #0000FF}
#Layer1 {
	position:absolute;
	left:77px;
	top:49px;
	width:533px;
	height:258px;
	z-index:1;
	background-color: #BED9EB;
	visibility: hidden;
}
-->
</style>
<script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>
</head>
<style type="text/css">
<!--
body{
     font-family:"宋体";
	 font-size:12px;
}
.STYLE3 {
	font-size: 14px;
	font-weight: bold;
}
.STYLE6 {
	font-size: 16px;
	font-weight: bold;
}
-->
</style>


<body>
<% 
    //定义临时变量
    String departmentids="";
    String departmentname = "";

    //定义连接变量
    ResultSet  rs = null;
    ResultSet  rs2 = null;
    PreparedStatement stmt = null;
	Connection conn = null;
    try{//公共连接类
        conn=DBConnection.getConnection();
    }catch(Exception e){
    }
%>
<div id="Layer1">
  
<script type="text/javascript">
var jishu = 0;
 function selectAll() 
{ 
    if(jishu%2==0){
        var checkboxs = document.getElementsByName("checkbox"); 
        for(var i=0;i<checkboxs.length;i++){checkboxs[i].checked =true;}
        jishu++; 
    }
    else
    {
        var checkboxs = document.getElementsByName("checkbox"); 
        for(var i=0;i<checkboxs.length;i++){checkboxs[i].checked =false;}
        jishu++;
    }
} 

 function getDept()
 {
    var s = document.getElementsByName("checkbox");
	       var j = s.length;
	       var k = 0;
	       var sth = "";
	       var deptnames="";
	       for( i=0; i<j; i++)
	       {
	           if(s[i].checked==true)
	           {
	               if(k!=0)
	               {   
	                   sth+= ","+s[i].value;
	                   k++;
	               }
	               else
	               {
	                   //deptnames+= departmentnames[i];
	                   sth+= s[i].value;
	                   k++;
	               }
	           }
	       }
	       if(k==0){
	           window.alert("您还没有选择收件人组");
	       }
	       else
	       {
	           departmentids=sth;
               inid.innerHTML="<input type='text' name='sendToGroup' value='"+sth+"' readonly/>";
	       }
 }

</script>
  <table width="100%" border="2" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2"><span class="STYLE6"> 　请勾选收信部门</span></td>
      <td align="right" valign="top" onclick="MM_showHideLayers('Layer1','','hide')" style="cursor:hand">关闭</td>
    </tr>
<%
    //动态获得部门名称
    stmt=conn.prepareStatement("select departmentid,departmentname from department where departmentname<>'公开'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    rs=stmt.executeQuery();
    rs.last();
    int i=rs.getRow();
    rs.beforeFirst();
    int j=0;
    while(rs.next()){
        if(j<i/3)
        {
            j++;
%>
    <tr>
      <td width="33%">
        <input type="checkbox" name="checkbox" value="<%=rs.getInt("departmentid") %>" />
      <%=rs.getString("departmentname") %>
            </td>
    <%rs.next(); %>            
      <td width="33%">
        <input type="checkbox" name="checkbox" value="<%=rs.getInt("departmentid") %>" />
      <%=rs.getString("departmentname") %>
            </td>
    <%rs.next(); %>
      <td width="33%">
        <input type="checkbox" name="checkbox" value="<%=rs.getInt("departmentid") %>" />
      <%=rs.getString("departmentname") %>
            </td>
    </tr>
<%
         }
         else
         {
%>
    <tr>
<%
             do{
%>
       <td width="33%">
        <input type="checkbox" name="checkbox" value="<%=rs.getInt("departmentid") %>" />
      <%=rs.getString("departmentname") %>
       </td>
<%
              }while(rs.next());
              for(int k=0;k<3-i%3;k++)
              {
%>
       <td width="33%">&nbsp;</td>
<%
              }
%>   
    </tr>
<%
         }//else
    }//while
%>
	<tr>
	   <td colspan="3" align="right"><input type="button" name="Submit" value="全选" onclick="selectAll();"/>	   	   
	                                 <input type="button" name="Submit3" value="确定" onclick="getDept();MM_showHideLayers('Layer1','','hide')"/></td>
    </tr>
  </table>
</div>
<form id="messageForm" name="messageForm1" method="post"  action="<%=path %>/servlet/sendMailServlet">
<table width="100%" height="100%" border="0" cellspacing="4" cellpadding="0" id="table2">
  <tr>
    <td>&nbsp;</td>
    <td width="50" style="cursor:hand" onclick="testNull();"><img src="../image/ico.gif" width="20" height="15" /><span class="STYLE4">发送</span></td>
    <td width="52" style="cursor:hand" onclick="deletAll();"><img src="../image/ico2.gif" width="15" height="18" /><span class="STYLE4">删除</span></td>
    <td width="641">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="12" rowspan="7">&nbsp;</td>
    <td height="1" colspan="3" bgcolor="#BED9EB"></td>
    <td width="12" rowspan="7">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3">
      发信人　
          <input type="text" name="sendFrom" value="luolei@luoleiscomputer" READONLY/>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      收信人　
          <input type="text" name="sendTo" />
          <input name="button" type="button" onclick="MM_showHideLayers('Layer1','','show')" value="批量添加" />
          <span id="inid"></span>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <label>主  题
        　
      <input type="text" name="mainTitle" />
        </label>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
          </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="3"><span class="STYLE3">邮件正文</span></td>
  </tr>
  <tr>
    <td colspan="3"><textarea name="textarea" cols="100" rows="10"></textarea></td>
  </tr>
</table>
<input type="hidden" name="departmentids" value="<%=departmentids%>"/>
</form>

<SCRIPT LANGUAGE="JavaScript">
<!--

function testNull(){
	var fm = window.document.messageForm;
	var user = fm.sendFrom;
	user.value = fTrim( user.value); //Trim the input value.

	if( user.value =="") {
		window.alert("\请输入发信人?");
		user.focus();
		return false;
	}	

	if( fm.sendTo.value.length =="") {
	    if(fm.sendToGroup){
	        if(fm.sendToGroup.value.length==""){
	            window.alert("\请输入收信人 ?");
		        fm.sendTo.focus();
		        return false;
	        }
	    }else{
	            window.alert("\请输入收信人 ?");
		        fm.sendTo.focus();
		        return false;
		}     
	}
	
	if( fm.mainTitle.value.length =="") {
	    window.alert("\请输入主题 ?");
		fm.mainTitle.focus();
		return false;
	}
	else{
	    fm.submit();
	}
}

function deletAll(){
	var fm = window.document.messageForm;
	fm.reset();
	/*fm.sendFrom.value="";
	fm.sendTo.value="";
	fm.mainTitle.value="";
	fm.file1.value="";
	fm.textarea.value="";
	fm.sendFrom.focus();*/
}

function fTrim(str)  //且用户名，替换规则如下
{
	return str.replace(/(^\s*)|(\s*$)/g, ""); 
}

-->
</SCRIPT>

</body>
</html>

