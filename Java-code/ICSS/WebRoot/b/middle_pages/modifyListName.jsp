<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%
  String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>目录更改页面</title>
</head>
<style type="text/css">
<!--
body{
     font-family:"宋体";
	 font-size:12px;
}
-->
</style>
<script language="javascript">
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
            	//判断返回消息，exist表示文件名已经存在。ok表示成功。
            	if(res=="ok")
            	{
            	    window.alert("重命名成功");
            	    //怎样左侧目录树页刷新？？？？？？？？？？？？？？？
            	    //是否刷新页面？？？？？？？？？？？？？？？？？？？？？
            	}
            	else if(res=="exist")
            	{
            	    window.alert("文件名已经存在，请更换！");
            	}
            	else//错误
                {
                    window.alert("未知错误，请稍后重新操作！");
                }         
            }
            else { //页面不正常
                window.alert("您所请求的页面有异常。");
            }
        }
    }
function testNull(){
	var fm = window.document.form1;
	var word = fm.textfield;

	if( word.value =="") {
		wrong.innerHTML="新目录名称不能为空！";
		word.focus();
	}
	else
	{
	    sendRequest("<%=path%>"+"/servlet/modifyListNameServlet?textfield="+form1.textfield.value+"&oldName="+"oldName");
	}
}
-->
</script>
<body>
<table width="90%" height="404" border="0" align="center">
  <tr>
    <td height="51" valign="top"><div align="right"><a href="javascript:history.back(-1);">返回</a>    </div></td>
  </tr>
  <tr>
    <td height="17"><div align="center"><span id="wrong"></span></div></td>
  </tr>
  <tr>
    <td align="center" valign="top"><form id="form1" name="form1">
	  <table width="280" border="0" align="center">
      <tr>
        <td width="282" align="left">
          <label>目录 新 名称：  
            <input type="text" name="textfield" />
          </label>        </td>
      </tr>
      <tr>
        <td align="center"><div align="left">
          <input type="button" name="submit" value="确认" onClick="testNull();" />
          <input type="reset" name="reset" value="重置" />
        </div></td>
      </tr>
    </table>
    </form></td>
  </tr>
</table>
</body>
</html>
