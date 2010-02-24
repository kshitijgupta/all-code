<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%
  String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>delList</title>
</head>
<script src="resure.js"></script>
<script language="JavaScript">
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
                //判断返回值确定对用户显示的文字
                if(res=="success")//操作成功
                {
                    window.alert("删除成功");
                    //是否刷新页面？？？？？？？？？？？？？？？？？？？？
                }
                else if(res=="ifFather")//有子文件
                {
                    window.alert("删除目录不为空！")
                }
                else//错误
                {
                    window.alert("未知错误，请稍后重新操作！");
                }
                //window.alert("新建成功！");                
            } else { //页面不正常
                window.alert("您所请求的页面有异常。");
            }
        }
    }
    //
    function testNull(){
        var fm = window.document.form1;
	    if(form1.textfield.value ==""){
		    window.alert("\请输入新目录名称?");
		    fm.textfield.focus();
		    //return false;
	    }
	    else
	    {
	        var a =resure();
	        if(a)//确定要删除
	        {
	             sendRequest("<%=path%>"+"/servlet/delListServlet?textfield="+form1.textfield.value);
	        }
	        else//放弃操作
	        {
	             //放弃无操作
	        }
	    }
    }
-->
</script>

<style type="text/css">
<!--
body{
     font-family:"宋体";
	 font-size:12px;
-->
}
</style>
<body>
<table width="90%" height="530" border="0" align="center">
  <tr>
    <td valign="top"><div align="right"><a href="javascript:history.back(-1);">返回</a>    </div></td>
  </tr>
  <tr>
    <td align="center" valign="middle"><form id="form1" name="form1">
	 <table width="280" border="0" align="center">
      <tr>
        <td width="282" align="center">
          <label>
          <div align="left">当前目录名称：
            <input type="text" name="textfield" />
          </div>
          </label>        </td>
      </tr>
      <tr>
        <td align="center"><div align="left">
          <input type="button" name="submit" value="确认" onClick="testNull();"/>
          <input type="reset" name="reset" value="重置" />
        </div></td>
      </tr>
    </table>
    </form></td>
  </tr>
</table>
</body>
</html>
