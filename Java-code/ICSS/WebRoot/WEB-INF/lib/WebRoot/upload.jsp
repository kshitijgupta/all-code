<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ļ��ϴ�</title>
<link href="../css/table.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE1 {color: #990000}
-->
</style>
</head>

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
	newRow.cells[0].innerHTML  ="<div align='left'><span class='style2'>�ϴ�����ĵ�</span></div>";
	newRow.cells[1].innerHTML  ="<div align='left'><input type='file' name='mDoc" + RowCount + "'> &nbsp;&nbsp;</div>";
		RowCount = RowCount + 1;
}



function _CheckForm(){
	
	if(document.form1.filedept.value==-1){
		alert("�ļ�����δѡ��");
		return false;
	}
	else if(document.form1.filepower.value==-1){
		alert("�ļ��ܼ�δѡ��");
		return false;
	}
	else {
		var i=0;
		for(i=0; i<RowCount; i++){
			var filename = "mDoc"+ i;
			if(checkext(document.all(filename).value)==false){
				
				return false;
			}
		}
		return true;
	}
}

function _ok(){
	if(_CheckForm()){
		document.form1.submit();
	}
}

function _reset(){
	document.form1.reset();
}

function checkext(s)
   {
    var i = s.lastIndexOf(".");
    if(i < 0)
    {
     alert("�ļ�Ϊ�ջ���û����չ��!!");
     return false;
    }
    
    var var1 = s.substring(i+1) ;
    if(var1 == "exe"||var1=="bat"||var1=="jsp"||var1=="html"||var1=="htm")
            {
            	alert("�ϴ��ļ���չ����֧�֣�");
               return false;
             }
    return true ;
   }
	

</script>


<body leftmargin="0" topmargin="15">
<form name="form1" action="<%=path %>/servlet/UploadServlet" method=post enctype="multipart/form-data">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr> <th>�ļ��ϴ�</th>
      </tr>
	 <tr>
	 <td><div align="left">
          �ļ��ϴ�:</div></td>
	  </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr> 
        <td>
		
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="B1BCEC">
            <tr> 
              <td bgcolor="#993300"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#000066">
                  <tr> 
                    <td height="2" bgcolor="#000033"></td>
                  </tr>
                </table>
     
                <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#000066">
				   <tr bgcolor="#FFFFFF">
				     <td width="14%" height="25" bgcolor="#FFFFFF">�ļ���������<font color="#FF0000">*</font></td>
				     <td width="16%"><select name="filedept">
 						<option value=-1>--��ѡ���ļ���������--</option>
                       <option value=0>�����в��ſɼ�</option>
                       <option value=1>���Ա����ſɼ�</option>
                     </select></td>
			      </tr>
				   <tr bgcolor="#FFFFFF">
				     <td height="25">�ļ��ܼ�<font color="#FF0000">*</font></td>
				     <td><label>
				       <select name="filepower">
					   <option value =-1>--��ѡ���ļ��ܼ�--</option>
                       <option value=0>����Ա</option>
                       <option value=1>����</option>
					   <option value=2>������</option>
					   <option value=3>�Ƴ�</option>
					   <option value=4>���Ƴ�</option>
					   <option value=5>�鳤</option>
					   <option value=6>��ͨԱ��</option>
			         </select>
				     </label>				     </td>
			      </tr>
				  <tr bgcolor="#FFFFFF">
				     <td height="25">�ļ�����</td>
				     <td><label>
				       <select name="filetype">
					   <option value =-1>--��ѡ���ļ�����--</option>
                       <option value=0>��Ƶ</option>
                       <option value=1>��Ƶ</option>
                        <option value=2>ͼƬ</option>
					   <option value=3>�����ļ�</option>
			         </select>
				     </label>				     </td>
			      </tr>
				   <tr bgcolor="#FFFFFF">
				     <td height="25">�ļ���ǩ</td>
				     <td><label>
				       <input name="filelabel" type="text" maxlength="80">
				     </label>
			         �ʵ��ı�ǩ������������Դ����������</td>
			      </tr>
				  <tr bgcolor="#FFFFFF">
				     <td height="25">�ļ�����</td>
				     <td><label>
				       <input name="fileauthor" type="text" maxlength="20">
				     </label>
			         </td>
			      </tr>
				   <tr bgcolor="#FFFFFF">
				     <td height="25">����д��Ҫ����������</td>
				     <td><label>
                     <textarea wrap="hard" cols="45" rows="8" name="describe"></textarea>
</label></td>
			      </tr>
                  <tr bgcolor="#FFFFFF"> 
				  <td colspan="2">
					<table id="detail" width="100%" align="center">
						<TBODY>
						<TR align=middle  height=20>
						  <TD height="22" align="left" class="style3" width="14%" >
						    <div align="left"><span class="style2">�ϴ�����ĵ�</span></div>						  </TD>
						  <TD height="22" width="64%">	
						  	<div align="left"><input type="file" name="mDoc0"></div>						  </TD>
						</TR>
						</TBODY>
					  </TABLE>					  </td>
                  </tr>
                  <tr align="left" bgcolor="#FFFFFF"> 
                    <td height="22" colspan="2"><div align="left"><a href="javascript:addAttach()">���Ӹ���</a>&nbsp;&nbsp; <a href='javascript:delAttach()'>��ȥ����</a>&nbsp;&nbsp;��ʾ�����ܷ��͵ĸ������������Ϊ1G�� ��ֹ�ϴ�������չ���ļ���<span class="STYLE1">exe,bat,jsp,html,htm</span></div></td>
                  </tr>
                </table> </td>
            </tr>
          </table>		</td>
      </tr> 
    </table>

	<table width="100%" border="0" cellpadding="0" cellspacing="1"  class="sub">
	<tr>
	  <td style="text-align:center"><input type="button" value="�ύ"onClick="_ok();">&nbsp;&nbsp;
      <input name="imageField2" type="button"  width="53" height="20" border="0" value="����"onClick="_reset();"></td>
	  </tr>
	</table>
	<input type=hidden name="way" value="add">
</form>
</body>
</html>
