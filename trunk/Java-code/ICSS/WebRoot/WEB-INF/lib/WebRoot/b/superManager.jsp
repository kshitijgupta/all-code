<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%
  String path = request.getContextPath();
  String powertable[]={"管理员","处长","副处长","科长","副科长","组长","普通员工"}; 
%>
<%@ page import="java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ABC-多媒体</title>
<script src="resure.js"></script>
<style type="text/css">
<!--
.STYLE1 {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-weight: bold;
}
.STYLE2 {color: #0000FF}
.STYLE3 {color: #999999}
#Layer1 {
	position:absolute;
	left:6px;
	top:21px;
	width:70px;
	height:74px;
	z-index:101;
	visibility: hidden;
}
#Layer2 {
	position:absolute;
	left:194px;
	top:21px;
	width:72px;
	height:76px;
	z-index:102;
	visibility: hidden;
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
#Layer3 {
	position:absolute;
	left:8px;
	top:91px;
	width:740px;
	height:119px;
	z-index:103;
	background-color: #CCCCCC;
	visibility: hidden;
}
.STYLE2 {
	font-size: 18px;
	color: #333366;
	font-weight: bold;
}
.STYLE3 {color: #000000}
#Layer4 {
	position:absolute;
	left:6px;
	top:90px;
	width:740px;
	height:118px;
	z-index:104;
	background-color: #CCCCCC;
	visibility: hidden;
}
#Layer5 {
	position:absolute;
	left:5px;
	top:90px;
	width:780px;
	height:732px;
	z-index:105;
	background-color: #CCCCCC;
	font-size:12px;
	visibility: hidden;
}
.STYLE7 {font-size: 12px}
.STYLE8 {font-weight: bold; color: #0000FF;}
-->
</style>
<script type="text/JavaScript">
<!--

var XMLHttpReq;
 	//创建XMLHttpRequest对象       
    function createXMLHttpRequest() {
		if(window.XMLHttpRequest) { //Mozilla 浏览器
			XMLHttpReq = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) { // IE浏览器
			try {
				XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
	}
	//发送请求函数
	function sendRequest(url) {
		createXMLHttpRequest();
		XMLHttpReq.open("GET", url, true);
		XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
		XMLHttpReq.send(null);  // 发送请求
	}
	// 处理返回信息函数
    function processResponse() {
    	if (XMLHttpReq.readyState == 4) { // 判断对象状态
        	if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
            	var res=XMLHttpReq.responseText;
            	//判断返回消息，ok表示成功。
            	if(res=="ok")
            	{
            	    window.alert("操作成功！");
            	}
            	else if(res=="empty")
            	{
            	    window.alert("没有备份文件可供还原！");
            	}
            	else
            	{
            	    window.alert("系统错误，请重试，或检查软件问题！");
            	}           
            } else { //页面不正常
                window.alert("您所请求的页面有异常。");
            }
        }
    }

    function testNull(){
	    var fm = window.document.form1;

	    if(form1.textfield.value ==""){
		    window.alert("\请输入新目录名称?");
		    fm.textfield.focus();
		    //return false;
	    }
	    else
	    {
	        //sendRequest("<%=path%>"+"/servlet/addListsServlet?textfield="+form1.textfield.value);
	    }
    }
    
    function fullBackup(){
        var dv = window.document.Layer3;
        sendRequest("<%=path%>"+"/servlet/fullBackupServlet?");
    }
    
    function modifyBackup(){
        sendRequest("<%=path%>"+"/servlet/modifyBackupServlet?");
    }
    
    function restore(){
        sendRequest("<%=path%>"+"/servlet/RestoreServlet?RestoreToData="+document.getElementById("select4").value);
    }

    function MM_findObj(n, d){ //v4.01
        var p,i,x;
        if(!d)
          d=document;
        if((p=n.indexOf("?"))>0&&parent.frames.length)
        {
            d=parent.frames[n.substring(p+1)].document;
            n=n.substring(0,p);
        }
        if(!(x=d[n])&&d.all)
            x=d.all[n];
        for(i=0;!x&&i<d.forms.length;i++)
            x=d.forms[i][n];
        for(i=0;!x&&d.layers&&i<d.layers.length;i++)
            x=MM_findObj(n,d.layers[i].document);
        if(!x && d.getElementById)
            x=d.getElementById(n);
        return x;
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
<body>
<div id="Layer2" onmouseover="MM_showHideLayers('Layer2','','show')" onmouseout="MM_showHideLayers('Layer2','','hide')">
 <table width="70" borde="0">
  <tr>
   <td>&nbsp;
   </td>
  </tr>
  <tr>
   <td>
  <table width="70" border="0" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0);">
    <tr>
      <td onclick="MM_showHideLayers('Layer3','','show')"><a href="#" class="STYLE3">数据备份</a></td>
    </tr>
    <tr>
      <td><a href="#" class="STYLE3" onclick="MM_showHideLayers('Layer4','','show')">数据恢复</a></td>
    </tr>
    <tr>
      <td><a href="middle_pages/DBdelete.jsp" target="middle_page" class="STYLE3">数据清除</a></td>
    </tr>
  </table>
  </td></tr></table>
</div>
<div id="Layer3">
  <table width="100%" height="117" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td height="1" colspan="4" bgcolor="#0000FF"></td>
    </tr>
    <tr>
      <td width="1" rowspan="4" bgcolor="#0000FF"></td>
      <td width="705" height="41"><span class="STYLE2">　数据库备份</span></td>
      <td width="33" align="right" valign="top" onclick="MM_showHideLayers('Layer3','','hide')"><a href="#">关闭</a></td>
      <td width="1" rowspan="4" bgcolor="#0000FF"></td>
    </tr>
    <tr>
      <td height="22" colspan="2"> 　　　请选择如何备份文件？（建议：周末进行全备份，工作日进行增量备份。全备份会覆盖掉原有所有备份文件！）<br /> 　　　　
        请尽量在服务其访问量最低时进行备份，如下班后。 
        备份文件存放在服务器指定目录上。</td>
    </tr>
    <tr>
      <td height="34" colspan="2">　　　
      <input type="button" name="Submit" value="完全备份" onClick="fullBackup();"/>
      <input type="button" name="Submit6" value="增量备份" onClick="modifyBackup();"/>
      </td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td height="2" colspan="4" bgcolor="#0000FF"></td>
    </tr>
  </table>
</div>
<div id="Layer4">
  <table name="table4" width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="1" colspan="4" bgcolor="#0000FF"></td>
    </tr>
    <tr>
      <td width="1" rowspan="4" bgcolor="#0000FF"></td>
      <td width="703" height="41">  <span class="STYLE2">数据恢复</span></td>
      <td width="34" align="right" valign="top" onclick="MM_showHideLayers('Layer4','','hide')"><a href="#">关闭</a></td>
      <td width="2" rowspan="4" bgcolor="#0000FF"></td>
    </tr>
    <tr>
      <td height="22" colspan="2">　　选择要恢复的备份文件日期，点击恢复即可。</td>
    </tr>
    <tr>
      <td height="34" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
      <select id = "select4" name="select4">
<%!
     int k = 0;
     String[] fileNames;
 %>
<%
     String indexDir = this.getServletContext().getRealPath("/backup");
     System.out.println(indexDir);
     try{
     File a = new File(indexDir);
     fileNames = a.list();
     k = fileNames.length;
     }catch(Exception e){
     }
     for(int ii=0; ii<k; ii++){
%>
         <option value =<%=fileNames[ii]%>><%=fileNames[ii]%></option>
<%
     }
%>
        </select>
      <input type="button" name="Submit2" value="恢复" onClick="restore();"/></td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td height="1" colspan="4" bgcolor="#0000FF"></td>
    </tr>
  </table>
</div>
<SCRIPT language="javascript">
<!--
	var isDrag = false;
-->	
</SCRIPT>

<div style="position:absolute; left:0px; top:0px; z-index:1; visibility: visible;">

<table width="100%" border="1" cellpadding="0" cellspacing="0" style="border-bottom:1px solid #BED9EB;border-right:1px solid #BED9EB;border-top:1px solid #BED9EB;border-left:1px solid #BED9EB;">
  <tr id="frame_tr">
    <td height="800px" width="100%">
		<table width="100%" height="800px" border="0" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0);"><tr>
          <td width="80%" height="31"style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)"><table width="768" border="0">
         <tr>
          <td><a href="../myfolder/makeIndex.jsp"  target="middle_page" style="color:#003366;font-size:12px;"><strong>生成索引</strong></a></td>
          <td><a href="middle_pages/checkSource.jsp" target="middle_page" style="color:#003366;"><strong>资源审核</strong></a></td>
		  <td onmouseover="MM_showHideLayers('Layer2','','show')" onmouseout="MM_showHideLayers('Layer2','','hide')" ><a href="#" style="color:#003366;"><strong>数据管理</strong></a></td>
          <td><a href="middle_pages/messageSend.jsp" target="middle_page" style="color:#003366;"><strong>信息发布</strong></a></td>
          <td><a href="middle_pages/powerManage.jsp" target="middle_page" style="color:#003366;"><strong>权限管理</strong></a></td>
          <td><a href="middle_pages/jinyicibiao.jsp" target="middle_page" style="color:#003366;"><strong>近义词表</strong></a></td>
		  <td>
		       <a href="../upload.jsp" target="middle_page" style="color:#003366;"><strong>资源采集</strong></a>
		   </td>
		   <td>
		       <a href="log.html" target="middle_page" style="color:#003366;"><strong>日志管理</strong></a>
		   </td>
         </tr>
        </table></td>
		</tr>
          <tr>
            <td height="769" align="center" valign="middle">
			<iframe name="middle_page" height="100%" width="100%" src="middle_pages/checkSource.jsp"></iframe>
			</td>
          </tr>
        </table>	</td>
  </tr>
</table>
</div>

</body>
</html>
