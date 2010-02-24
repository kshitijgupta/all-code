<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String sql ="select abcfile.fileid,filetype,filename,fileauthor,time,filedescribe,departmentname,filepower from abcfile,department,filedept where abcfile.fileid=filedept.fileid AND filedept.departmentid=department.departmentid and flag=1";
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String powertable[]={"超级管理员","董事","经理","科长","处长","组长","高级职员","普通职员","临时职员","杂物","等"}; 
%>
<%@ page import="icss.abc.base.db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>数据清除</title>
<style type="text/css">
<!--
body,td,th {
	font-family: 宋体;
	font-size: 12px;
}
.STYLE2 {
	font-size: 16px;
	font-weight: bold;
}
.STYLE3 {font-weight: bold}
-->
</style></head>
<script language="javascript">
  function resure(){
     var a = window.confirm("sure?");
	 if(a){
	       var s = document.getElementsByName("checkboxs");
	       var j = s.length;
	       for( i=0; i<j; i++)
	       {
	           if(s[i].checked==true)
	           {
	               break;
	           }
	       }
	       if(i==j){
	           window.alert("您还没有选择删除项");
	       }
	       else
	       {
	           document.form1.action="../actionjsp/DeleteDB.jsp";
	           document.form1.submit();
	       }
	               
     }
	 else{
	 
	     }
  }	
	

var jishu = 0;
 function selectAll() 
{ 
    if(jishu%2==0){
        var checkboxs = document.getElementsByName("checkboxs"); 
        for(var i=0;i<checkboxs.length;i++){checkboxs[i].checked =true;}
        jishu++; 
    }
    else
    {
        var checkboxs = document.getElementsByName("checkboxs"); 
        for(var i=0;i<checkboxs.length;i++){checkboxs[i].checked =false;}
        jishu++;
    }
} 
</script>
   

<body>
<%
    //连接数据库变量
    ResultSet  rs = null;
    PreparedStatement stmt = null;
	Connection conn = null;
	ResultSet  rs2 = null;
    try{
	    conn=DBConnection.getConnection();
    }catch(Exception e){
         out.println("error");
    }
%>
<form id="form1" name="form1" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="1" rowspan="10" bgcolor="#0000FF"></td>
      <td height="1" colspan="2" bgcolor="#0000FF"></td>
      <td width="1" rowspan="10" bgcolor="#0000FF"></td>
    </tr>
    <tr>
      <td width="705" height="41"> 　<span class="STYLE2">数据清除</span></td>
      <td width="34" align="right" valign="top"></td>
    </tr>
    <tr>
      <td height="22" colspan="2"> 　　搜索符合条件的资源，选中清除。 </td>
    </tr>
    <tr>
      <td height="1" colspan="2" bgcolor="#0000FF"></td>
    </tr>
    <tr>
      <td height="33" colspan="2"><div align="right">
          <label>按时间排序
            <select name="StimeUD">
			  <option value="0" selected>--请选择--</option>
			  <option value="1">按升序排列</option>
			  <option value="2">按降序排列</option>
            </select>
            </label>
      </div></td>
    </tr>
    <tr>
      <td colspan="2" align="left"><div align="cente">
        <label>资源名
          <input name="Sfilename" type="text" size="10" />
          </label>
        <label>作者
        <input name="Sfileuser" type="text" size="10" />
        </label>
        <label>部门
        <select name="Sdepartmentname">
             <option value="-1">--请选择--</option>
<%
      try{
          stmt = conn.prepareStatement("select departmentid,departmentname from department");	
	      rs = stmt.executeQuery();
          while(rs.next()){
%>
             <option value="<%=rs.getInt("departmentid") %>"><%=rs.getString("departmentname") %></option>
<%
          }
       }catch(Exception e){
           System.out.println(e.toString());
       }
%>
          </select> 
        </label>
        <label>上传时间
        <input name="Suptime" type="text" size="10" />
        </label>
        <label>类型
        <select name="Sfiletype">
		  <option value="0" selected="selected">--请选择--</option>
		  <option value="movie">movie</option>
		  <option value="music">music</option>
		  <option value="picture">picture</option>
		  <option value="other">other</option>
        </select>
        </label>
        <label>密级
        <select name="Sfilepower">
            <option value="-1" selected>--全部--</option>
            <option value="100">公开</option>
<%
      int i=0;
      for(i=0; i<10; i++){
%>
             <option value="<%=i%>"><%=powertable[i]%></option>
<%
      }
%>

          </select>
        </label>
        <label>
        <input type="submit" name="Submit3" value="搜索" onclick="document.form1.action='DBdelete.jsp';document.form1.submit();"/>
        </label>
      </div>      </td>
    </tr>
    <tr>
      <td height="1" colspan="2" bgcolor="#0000FF"></td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="1" cellspacing="1" cellpadding="1">
        <tr>
          <td width="3%">&nbsp;</td>
          <td width="5%">类型</td>
          <td width="15%">标题</td>
          <td width="15%">密级</td>
          <td width="15%">部门</td>
          <td width="15%">编著者</td>
          <td width="15%">描述</td>
          <td width="17%">录入时间</td>
        </tr>
<%
    //获得隐含参数，判断根据用户搜索拼接SQL语句
    String StimeUD = request.getParameter("StimeUD");
    String Sfilename = request.getParameter("Sfilename");
    if(Sfilename!=null){Sfilename = new String(Sfilename.getBytes("iso-8859-1"),"UTF-8");}
    String Sfileuser = request.getParameter("Sfileuser");
    if(Sfileuser!=null){Sfileuser = new String(Sfileuser.getBytes("iso-8859-1"),"UTF-8");}
    String Sdepartmentname = request.getParameter("Sdepartmentname");
    String Suptime = request.getParameter("Suptime");
    String Sfiletype = request.getParameter("Sfiletype");
    if(Sfiletype!=null){Sfiletype = new String(Sfiletype.getBytes("iso-8859-1"),"UTF-8");}
    String Sfilepower = request.getParameter("Sfilepower");
    
    if(StimeUD==null){}else{System.out.println(StimeUD);
        if(!Sfilename.equals("")&&!Sfilename.equals("null"))
        {
             sql+=" and abcfile.filename like '"+Sfilename+"%'";
        }
        if(!Sfileuser.equals("")&&!Sfileuser.equals("null"))
        {
             sql+=" and abcfile.fileauthor='"+Sfileuser+"'";
        }
        if(!Sdepartmentname.equals("")&&!Sdepartmentname.equals("null")&&!Sdepartmentname.equals("-1"))
        {
             sql+=" and department.departmentid="+Sdepartmentname;
        }
        if(!Suptime.equals("")&&!Suptime.equals("null"))
        {
             sql+=" and abcfile.time='"+Suptime+"'";
        }
        if(!Sfiletype.equals("")&&!Sfiletype.equals("null")&&!Sfiletype.equals("0"))
        {
             sql+=" and abcfile.filetype='"+Sfiletype+"'";
        }
        if(!Sfilepower.equals("")&&!Sfilepower.equals("null")&&!Sfilepower.equals("-1"))
        {
             sql+=" and filedept.filepower="+Sfilepower;
        }
        if(StimeUD.equals("1"))
        {
             sql+=" order by abcfile.time desc";
        }else if(StimeUD.equals("2"))
        {
             sql+=" order by abcfile.time asc";    
        }
    }
    System.out.println(sql);
        
%>
<%
    //页面变量
    int fileid = 0;
    String filetype = "";
    String filename = "";
    int filepower = 100;
    String departmentname = "";
    String fileauthor = "";
    String filedescribe = "";
    String time = "";
    try{
	    stmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    //执行取得结果集(查询)
	    rs = stmt.executeQuery();
//分页
            int intRowCount=0;//记录总数
			int intPageCount;//总页数
			int intPageSize = 3;
			int intPage;//待显示页码
			java.lang.String strPage;
			int j;
			strPage=request.getParameter("page");//取得待显示页码
			if(strPage==null){
				//表明在QUERYSTRING中没有PAGE这一个参数,此时显示第一页留言
				intPage=1;
			}else{
				//将字符串转换成整型
				intPage = java.lang.Integer.parseInt(strPage);
				if(intPage<1) intPage=1;
			}
			 rs.last();
			 
			 intRowCount = rs.getRow();	 
 
			
			intPageCount=(intRowCount+intPageSize-1)/intPageSize;//计算总页数
			if(intPage>intPageCount)intPage=intPageCount;//调整待显示页码
		 
			if(intPageCount>0)
			{
                
				try
				{
				    rs.absolute((intPage-1)*intPageSize+1);//将记录指针定位到待显示页的第一条记录上
				}catch(Exception e)
				{
				   out.println("error1");
				}
				//显示数据
				j=0;
				while(j<intPageSize&&!rs.isAfterLast()) {
	        fileid=rs.getInt("fileid");
	        filetype=rs.getString("filetype");
	        filename=rs.getString("filename");
	        filepower=rs.getInt("filepower");
	        departmentname=rs.getString("departmentname");
	        fileauthor=rs.getString("fileauthor");
	        filedescribe=rs.getString("filedescribe");
	        time=rs.getString("time");
%>
        <tr>
          <td><input type="checkbox" name="checkboxs" value="<%=fileid %>" /></td>
          <input type="hidden" value="<%=fileid %>"/>
          <td><%=filetype %></td>
          <td><%=filename %></td>
          <td><%=powertable[filepower] %></td>
          <td><%=departmentname %></td>
<%
    if(fileauthor==null){
%>
          <td>&nbsp;</td>
<%
    }else{
%>
          <td><%=fileauthor %></td>
<%
    }
    if(filedescribe==null){
%>
          <td>&nbsp;</td>
<%
    }else{
%>
          <td><%=filedescribe %></td>
<%
    }
%>
          <td><%=time %></td>
        </tr>
<%	   
    rs.next();
	j++;
   }
   conn.close();
   stmt.close();
   rs.close();
%>
        <tr>
          <td colspan="9"><input type="button" name="Submit4" value="全选" onclick="selectAll();"/>
            <input type="button" name="Submit5" value="删除" onclick="resure();"/></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td height="1" colspan="2" bgcolor="#0000FF">=</td>
    </tr>
  </table>
</form>
<hr>
			<div align="center">
				第<%=intPage%>页 共<%=intPageCount%>页
				<%if(intPage!=1){%>
					<a href="DBdelete.jsp?page=1&StimeUD=<%=StimeUD %>&Sfilename=<%=Sfilename %>&Sfileuser=<%=Sfileuser %>&Sdepartmentname=<%=Sdepartmentname %>&Suptime=<%=Suptime %>&Sfiletype=<%=Sfiletype %>&Sfilepower=<%=Sfilepower %>">第一页</a>
				<%}else{%>
					第一页
				<%}%>
				<%if(intPage>1){%>
					<a href="DBdelete.jsp?page=<%=intPage-1%>&StimeUD=<%=StimeUD %>&Sfilename=<%=Sfilename %>&Sfileuser=<%=Sfileuser %>&Sdepartmentname=<%=Sdepartmentname %>&Suptime=<%=Suptime %>&Sfiletype=<%=Sfiletype %>&Sfilepower=<%=Sfilepower %>">上一页</a>
				<%}else{%>
					上一页
				<%}%>
				<%if(intPage<intPageCount){%>
					<a href="DBdelete.jsp?page=<%=intPage+1%>&StimeUD=<%=StimeUD %>&Sfilename=<%=Sfilename %>&Sfileuser=<%=Sfileuser %>&Sdepartmentname=<%=Sdepartmentname %>&Suptime=<%=Suptime %>&Sfiletype=<%=Sfiletype %>&Sfilepower=<%=Sfilepower %>">下一页</a>
				<%}else{%>
					下一页
				<%}%>
				<%if(intPage!=intPageCount){%>
					<a href="DBdelete.jsp?page=<%=intPageCount%>&StimeUD=<%=StimeUD %>&Sfilename=<%=Sfilename %>&Sfileuser=<%=Sfileuser %>&Sdepartmentname=<%=Sdepartmentname %>&Suptime=<%=Suptime %>&Sfiletype=<%=Sfiletype %>&Sfilepower=<%=Sfilepower %>">最后一页</a>
				<%}else{%>
					最后一页
				<%}%>
			</div>
  
<br/> 
<%       
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>  
</body>
</html>

