<%@ page contentType="text/html;charset=GB2312" language="java"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������</title>
<link href="../css/table.css" rel="stylesheet" type="text/css">
</head>
<script src="<%=request.getContextPath()%>/include/js/prototype-1.6.0.2.js"></script>    
<SCRIPT language=JavaScript>

function _CheckForm(){
	var frm = document.RoomForm;
	if(frm.mrName.value == ""){
		alert("����д���������ƣ�");
		frm.mrName.focus();
		return false;
	}
	if(frm.mrAddress.value == ""){
		alert("����д�����ҵ�ַ��");
		frm.mrAddress.focus();
		return false;
	}   
	if(frm.mrCount.value == ""){
	   alert("����д����������");
	   frm.mrCount.focus();
	   return false;
	}
	if(!is_numeric(frm.mrCount)){
	   alert("�������������֣�");
	   frm.mrCount.focus();
	   return false;
	}
	return true;
}

function _ok(){
	if(_CheckForm()){
		document.RoomForm.submit();
	}
}

function _reset(){
	document.RoomForm.reset();
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

function checkName(){
	var url = '<%=request.getContextPath()%>/servlet/MeetingRoomServlet';
	var param="way=check&mrName=" + document.RoomForm.mrName.value;
	var myAjax = new Ajax.Request(url,{method: 'post',parameters: param ,onSuccess: getcheckstr});
}

function getcheckstr(request)
{ 
	var returnstr= request.responseText;
	var chk_name = $('chk_name');

	if(returnstr.match("true")){
		chk_name.update('�������������޸�').setStyle({ background: '#dfd' });
	}else{
		chk_name.update('����ʹ�ã������').setStyle({ background: '#dfd' });
	}
}
</SCRIPT>
<body leftmargin="0" topmargin="15">
<form name=RoomForm action="<%=request.getContextPath() %>/servlet/MeetingRoomServlet" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr> <th>����������</th>
      </tr>
	 <tr>
	 <td><div align="left">
          ����������:</div></td>
	  </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr> 
        <td>
		
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="B1BCEC">
            <tr> 
              <td bgcolor="#000000"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#000000">
                  <tr> 
                    <td height="2" bgcolor="#993300"></td>
                  </tr>
                </table>
                <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#993300">
                  <tr bgcolor="#FFFFFF"> 
				    <td width="14%" height="25">����������</td>
                    <td width="16%"><input name="mrName" type="text" size="15">
                    <input type="button" name="check" value="�������" onClick="checkName();">
      				<label id=chk_name></label><font color="#ff0000">*</font></td>
		          </tr>
	          <tr bgcolor="#FFFFFF"> 
                    <td width="14%" height="25">�����ҵ�ַ</td>
                    <td width="16%"><input name="mrAddress" type="text" size="15"><font color="#ff0000">*</font></td>
                  </tr>

				   <tr bgcolor="#FFFFFF">
				     <td height="25">��������</td>
				     <td><input name="mrCount" type="text" size="15"><font color="#ff0000">*</font></td>
			      </tr>
				   <tr bgcolor="#FFFFFF">
				     <td height="25">����������</td>
				     <td><textarea name="mrDesc" rows="10" cols="60"></textarea></td>
			      </tr>
			      
				   <tr bgcolor="#FFFFFF"> 
				    
                    <td  colspan=2 align="center"><img src="../images/tj.jpg" width="53" height="20"   border="0" onClick="javascript:_ok();" style="cursor:hand">&nbsp;&nbsp;
                    <img width="53" height="20" border="0" src="../images/cz.jpg" onclick="javascript:_reset();" style="">&nbsp;
                      </td>
                  </tr>
                </table> </td>
            </tr>
          </table>		</td>
      </tr> 
    </table>
    <input type=hidden name="way" value="add">
    </form>
</body>
</html>
