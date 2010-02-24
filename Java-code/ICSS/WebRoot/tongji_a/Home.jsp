<%@page pageEncoding="UTF-8"%>
<HTML><HEAD><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><TITLE>数据统计页</TITLE>
<style type="text/css">
<!--
.STYLE5 {font-family: "宋体"; font-size: medium; }
-->
</style>
<BODY>
<style type="text/css">
<!--
.STYLE1 {font-family: "宋体"}
-->
</style>

<table width="100%" bgcolor="#CCCCFF">
  <tr>
    <td width="40%" height="28">&nbsp;</td>
    <td width="60%"><h1><span class="STYLE1">数据统计</span></h1></td>
  </tr>
</table>
<table width="100%" height="50" border="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table><form name="f">
<table width="100%" height="184" border="0">
  <tr>
    <td width="19%">&nbsp;</td>
    <td width="19%"><span class="STYLE5">选择要显示的统计方式</span></td>
    <td width="44%"><FONT size=-1>
	
      <select  name="select1" id = "one" onChange="changeList(document.f.select1.options.selectedIndex)">
        <option value=0 selected>全部方式</option>
        <option 
                          value=1>数量统计</option>
        <option value=2>访问人数统计</option>
        <option value=3>下载次数统计</option>
      </select>
	  
      <script language="javascript">
	  var selectOP = document.getElementById("one");
	  
	  </script>
    </FONT></td>
    <td width="18%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><span class="STYLE5">选择图表的显示形式</span></td>
    <td><font size=-1>
      <select name="select2" id="two">
        <option value=0 selected>全部型式</option>
      </select>
	
    </font></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"><input type="submit" name="Submit" value="提交" onClick="changePage()"></td>
    <td>&nbsp;</td>
  </tr>
</table>
 </form>

<script language="javascript">
var List = new Array(5);
for(i = 0;i < 5;i++)
{List[i] = new Array();}

List[0][0] = new Option("请选择","");

List[1][0] = new Option("纵向直方图","");
List[1][1] = new Option("圆饼图（资源分布比例）","");

List[2][0] = new Option("纵向直方图","");
List[2][1] = new Option("折线图","");

List[3][0] = new Option("纵向直方图","");
List[3][1] = new Option("折线图","");


function changeList(x)
{
   var here = document.f.select2;
   here.options.length = 0;

   for(var i = 0;i < List[x].length;i++)
   {
      here.options[i] = new Option(List[x][i].text,i+1);
   }

   here.options[0].selected=true;
}

function changePage(){
   var selectObj = document.f.select1;
   var selectObj2 = document.f.select2;
if(selectObj.options[selectObj.selectedIndex].value == 1)
  {
     if(selectObj2.options[selectObj2.selectedIndex].value == 1)
     location.href = "a1.jsp";
     if(selectObj2.options[selectObj2.selectedIndex].value == 2)
     location.href = "a2.jsp";

  }

else if(selectObj.options[selectObj.selectedIndex].value == 2)
  {
     location.href = "统计页面2.html";
  }

else if(selectObj.options[selectObj.selectedIndex].value == 3)
  {
     if(selectObj2.options[selectObj2.selectedIndex].value == 1)
     location.href = "c1.jsp";
     if(selectObj2.options[selectObj2.selectedIndex].value == 2)
     location.href = "c2.jsp";
  }

}
</script>
</BODY>
</HTML>
