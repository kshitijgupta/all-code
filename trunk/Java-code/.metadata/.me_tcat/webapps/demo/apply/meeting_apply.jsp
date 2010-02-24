<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>会议申请</title>
<link href="../css/table.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT language=javascript src="<%=path %>/include/js/calendar.js"></SCRIPT>
<SCRIPT language=JavaScript>
	var RowCount = 1
function delAttach(){
	RowCount = RowCount - 1;
	document.all.detail.deleteRow(RowCount);
}

function addAttach(){
	newRow = document.all.detail.insertRow();
	newRow.insertCell();
	newRow.insertCell();
	newRow.cells[0].innerHTML  ="<div align='left'><span class='style2'>上传相关文档</span></div>";
	newRow.cells[1].innerHTML  ="<div align='left'><input type='file' name='mDoc" + RowCount + "'> &nbsp;&nbsp;</div>";
		RowCount = RowCount + 1;
}

function show(){
<!--window.open("searchfreeroom.htm","","width =1024,height =560 toolbar=0 location=0  menubar = 0 top=100 left=200 resizable=0 border=0");-->
var showInfo=window.showModelessDialog("searchfreeroom.htm",window,"status:no;help:0;close:0;dialogWidth:1024px;dialogHeight:560px");
}

function _CheckForm(){
	return true;
}

function _ok(){
	if(_CheckForm()){
		document.form1.submit();
	}
}

function _reset(){
	document.form1.reset();
}

function is_numeric(field)
{
	var Ret = true;
	var NumStr="0123456789";
	var decUsed=false;
	var chr;
	for (i=0;i<field.value.length;++i)
	{
		chr=field.value.charAt(i);
		if (NumStr.indexOf(chr,0)==-1)
		{
			if ( (!decUsed) && chr==".")
			{
				decUsed=true;
			}
			else
			{
				Ret=false;
			}
		}
	}
	return(Ret);
} 

	

</script>


<body leftmargin="0" topmargin="15">
<form name="form1" action="<%=path %>/servlet/MeetingApplyServlet" method=post enctype="multipart/form-data">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr> <th>会议申请</th>
      </tr>
	 <tr>
	 <td><div align="left">
          会议申请:</div></td>
	  </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr> 
        <td>
		
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="B1BCEC">
            <tr> 
              <td bgcolor="#993300"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#993300">
                  <tr> 
                    <td height="2" bgcolor="#993300"></td>
                  </tr>
                </table>
     
                <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#993300">
                  <tr bgcolor="#FFFFFF"> 
				    <td width="14%" height="25">会议主题</td>
                    <td width="16%"><input name="miTitle" type="text" size="15"></td>
		          </tr>
	          <tr bgcolor="#FFFFFF"> 
                    <td width="14%" height="25">会议人数</td>
                    <td width="16%"><input name="miCount" type="text" size="15"></td>
	          </tr>
				   <tr bgcolor="#FFFFFF">
				     <td height="25">会议级别</td>
				     <td><select name="miDegree">
 						<option>--请选择会议的优先级--</option>
                       <option value=0>特别重要</option>
                       <option value=1>重要</option>
                       <option value=2>普通</option>

                     </select></td>
			      </tr>
				   <tr bgcolor="#FFFFFF">
                    <td width="14%" height="25">开始日期</td>
                    <td width="16%"><input name="miStartTime" class="textborder" type="text" readonly="true" size="12">
                                  <a title=选择日期 href="javascript:fPopCalendar(document.all.img1,document.form1.txtDate1,700);"  style="text-decoration:none">
                    <img id=img1 src="../images/img_date.gif" width="22" align=absMiddle border=0></img></a></td>
			      </tr>
				  <tr bgcolor="#FFFFFF">
				      <td width="14%" height="25">结束日期</td>
                    <td width="16%"><input name="miEndTime" class="textborder" type="text" readonly="true" size="12">
                                  <a title=选择日期 href="javascript:fPopCalendar(document.all.img1,document.form1.txtDate2,700);"  style="text-decoration:none">
                    <img id=img2 src="../images/img_date.gif" width="22" align=absMiddle border=0></img></a></td>
			      </tr>
				   <tr bgcolor="#FFFFFF">
				     <td height="25">会议室</td>
				     <td><label>
				       <select name="miMeetroomId">
			         </select>
				     </label>
				     </td>
			      </tr>
				   <tr bgcolor="#FFFFFF">
				     <td height="25">会议所需其他设备</td>
				     <td><label>
				       <input name="miFacility" type="text" size="15">
				    <a href="yddevice_list.htm">选择</a> </label>
				     </td>
			      </tr>
				   <tr bgcolor="#FFFFFF">
				     <td height="25">会议主要参加人员</td>
				     <td><label>
				       <input name="miActor" type="text" size="15">			         
			         <a href="jmuser_list.htm">选择</a></label>
				     </td>
			      </tr>
				   <tr bgcolor="#FFFFFF">
				     <td height="25">会议内容</td>
				     <td><label>
                     <textarea wrap="hard" cols="45" rows="8" name="miContent"></textarea>
</label></td>
			      </tr>
                  <tr bgcolor="#FFFFFF"> 
				  <td colspan="2">
					<table id="detail" width="100%" align="center">
						<TBODY>
						<TR align=middle  height=20>
						  <TD height="22" align="left" class="style3" width="14%" >
						    <div align="left"><span class="style2">上传相关文档</span></div>
						  </TD>
						  <TD height="22" width="64%">	
						  	<div align="left"><input type="file" name="mDoc0"></div>
						  </TD>
						</TR>
						</TBODY>
					  </TABLE>  
					  </td>
                  </tr>
                  <tr align="left" bgcolor="#FFFFFF"> 
                    <td height="22" colspan="2"><div align="left"><a href="javascript:addAttach()">增加附件</a>&nbsp;&nbsp; <a href='javascript:delAttach()'>移去附件</a>&nbsp;&nbsp;提示：您能发送的附件总容量最大为10M！</div></td>
                  </tr>
				  
                </table> </td>
            </tr>
          </table>		</td>
      </tr> 
    </table>

	<table width="100%" border="0" cellpadding="0" cellspacing="1"  class="sub">
	<tr>
	  <td style="text-align:center"><img src="../images/tj.jpg" width="53" height="20" border="0" onClick="_ok();">&nbsp;&nbsp;
      <input name="imageField2" type="image" src="../images/cz.jpg" width="53" height="20" border="0" onClick="_reset();"></td>
	  </tr>
	</table>
	<input type=hidden name="way" value="add">
</form>
</body>
</html>
