<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,java.lang.reflect.*" errorPage="" %>

<%
  String sql ="select abcfile.fileid,filetype,filename,fileauthor,time,filelabel,filedescribe,departmentname,filepower from abcfile,department,filedept where abcfile.fileid=filedept.fileid AND filedept.departmentid=department.departmentid AND flag=0";
  String path = request.getContextPath();
  String powertable[]={"管理员","处长","副处长","科长","副科长","组长","普通员工"}; 
%>
<%@ page import="icss.abc.base.db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>资源审核</title>
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
.STYLE2 {color: #0000FF}
.STYLE3 {color: #999999}
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
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE6 {
	font-size: 12px;
	font-weight: bold;
}
body{
     font-family:"宋体";
	 font-size:12px;
}
.STYLE7 {
	font-size: 14px;
	font-weight: bold;
}
-->
</style>

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
	           document.form1.submit();
	       }
	               
     }
	 else{
	 
	     }
  }
  
  function inResure(){
      //try{
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
	           window.alert("您还没有选择入库项");
	       }
	       else
	       {
           document.form1.action="../actionjsp/inDB.jsp";
	       document.form1.submit();
	       
	       }
           /*var s = document.getElementsByName("checkboxs");
	       var j = s.length;
	       for( i=0; i<j; i++)
	       {
	           if(s[i].checked==true){
	           stmt = conn.prepareStatement("select * from abcfile,filefolder,abcfolder where abcfile.fileid= "+s[i].value+" And abcfile.fileid=filefolder.fileid and filefolder.folderid=abcfolder.folderid"); 
	           rs2=stmt.executeQuery();
	           if(!rs2.next){
	                window.alert("你还有未著项");
	                return false;
	           }
	           }
	       }
	       if(i==j){
	           window.alert("您还没有选择入库项");
	       }
	       else
	       {
	           document.form1.action="../actionjsp/inDB.jsp";
	           document.form1.submit();
	       }
	       }catch(Exception e){
	          
	       }*/
	}
	
	function checkItemNull(){
	    var sqls="";
	    sqls+=" and (abcfile.filetype is null or abcfile.filelabel is null or abcfile.fileauthor is null)"; 
	    document.form1.action="checkSource.jsp?sqls="+sqls;
	    document.form1.submit();
	}
	//function print(){
	    //Document documents = new Document(PageSize.A4);
	    //FileOutputStream fileOutputStream = new FileOutputStream();
	    //com.lowagie.text.PDF.PDFWriter.getInstance(documents, fileOutputStream("Helloworld.PDF"));
	    //Document document = new Document();
	    //PDFWriter.getInstance(document, new FileOutputStream("Helloworld.PDF"));
	    //document.open();
	    //document.add(new Paragraph("Hello World"));
	    //document.close();  
 
	//}
</script>
   
</head>

<body>
<% 
    String select1 = request.getParameter("select1"); 
    String select2 = request.getParameter("select2");
    String sqls = request.getParameter("sqls");
%>
<table width="100%" height="100%" border="0">
  <tr>
    <td><table width="100%" border="0"><tr><td>
	  <form id="form1" name="form1" method="post" action="../actionjsp/outDB.jsp">
      <table width="100%" border="0" align="center">
          <td colspan="12"><label>
            <span class="STYLE7">新上传资源</span>
            <div align="right">
			  <span class="STYLE6"> </span><span class="STYLE6">按类型显示</span>
              <select name="select1" id="s1">
			    <option value="0" selected>--全部--</option>
			    <option value="s">movie</option>
				<option value="y">music</option>
				<option value="p">picture</option>
				<option value="q">other</option>
              </select>
              <span class="STYLE6" id="s4">按时间排序</span>
              <select name="select2">
			    <option value="0" selected>--请选择--</option>
				<option value="desc">按降序排列</option>
				<option value="asc">按升序排列</option>
              </select>
              <input type="submit" value="搜索" onclick="document.form1.action='checkSource.jsp';document.form1.submit"/>
            </div>
          </label></td>
        <tr>
          <td height="1" colspan="12" bgcolor="#0099CC"></td>
        </tr>
        <tr bgcolor="#BED9EB">
		  <td>&nbsp;</td>
          <td><span class="STYLE1">类型</span></td>
          <td><span class="STYLE1">名称</span></td>
          <td><span class="STYLE1">密级</span></td>
          <td><span class="STYLE1">部门</span></td>
          <td><span class="STYLE1">上传者</span></td>
          <td><span class="STYLE1">上传时间</span></td>
          <td><span class="STYLE1">标签</span></td>
          <td><span class="STYLE1">所属文件</span></td>
          <td><span class="STYLE1">描述</span></td>
          <td><span class="STYLE1">预览</span></td>
          <td><span class="STYLE1">编辑</span></td>
        </tr>
        <tr>
          <td height="1" colspan="12" bgcolor="#0099CC"></td>
        </tr>
<%
    if(select1==null||select1.equals("null")){
    }else{   
         if(select1.equals("s"))
         {
             sql+=" and filetype='movie'";
         }
         else if(select1.equals("y"))
         {
             sql+=" and filetype='music'";
         }
         else if(select1.equals("p"))
         {
             sql+=" and filetype='picture'";
         }
         else if(select1.equals("q"))
         {
             sql+=" and filetype='other'";
         }
         if(select2.equals("desc")||select2.equals("asc")){
             sql+=" order by time "+select2;
         }
         if(sqls!=null && !sqls.equals("null")){
             sql+=sqls;
         }else{
              
              }
   }
%>
<%
    //页面用到的变量，主要在查找中使用
    int fid =0;
    String filetype ="";
    String filename = "";
    int filepower = 100;
    String departmentname = "";
    String fileauthor = "";
    String time = "";
    String filelabel = "";
    String filedescribe = "";
    int folderid = 0;
    String foldname ="";
    
    ResultSet  rs = null;
    PreparedStatement stmt = null;
	Connection conn = null;
	ResultSet  rs2 = null;
    //PreparedStatement stmt2 = null;
	//Connection conn2 = null;
    try{
    //DBConnection dbconnection = new DBConnection();
    System.out.println(sql);
	conn=DBConnection.getConnection();
	//创建Statement
	stmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	//执行取得结果集(查询)
	rs = stmt.executeQuery();
	
    }catch(Exception e){
        System.out.println(e.toString());
    }
    try{
//fenyefsfsdfdsddddddddddddddddddddddddddddddddddddddddddddddddddd
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
    //while(rs.next()){
     fid = rs.getInt("fileid");
     filetype =rs.getString("filetype");
     filename = rs.getString("filename");
     filepower = rs.getInt("filepower");
     departmentname = rs.getString("departmentname");
     fileauthor = rs.getString("fileauthor");
     time = rs.getString("time");
     filelabel = rs.getString("filelabel");
     filedescribe = rs.getString("filedescribe");
    //查询所属目录
    //conn2=DBConnection.getConnection();
	stmt = conn.prepareStatement("select abcfolder.folderid,foldname from abcfile,filefolder,abcfolder where abcfile.fileid= "+fid+" And abcfile.fileid=filefolder.fileid and filefolder.folderid=abcfolder.folderid"); 
	rs2=stmt.executeQuery();
	if(rs2.next()){//有结果
	     folderid = rs2.getInt("folderid");
        foldname = rs2.getString("foldname");
    }
    else
    {
        folderid = 0;
        foldname = "";
    }
    
    
%>
        <tr>
		  <td><div align="center">
		    <input type="checkbox" name="checkboxs" value="<%=fid %>" />
	      </div></td>
          <td><%=filetype %></td>
          <td><%=filename %></td>
<%
    if(filepower==100){
%>
          <td>公开</td>
<%
    }else{
%>
          <td><%=powertable[filepower] %></td>
<%
    }
%>
          <td><%=departmentname %></td>
<%if(fileauthor==null){ %>
          <td>&nbsp;</td>
<%}else{ %>
          <td><%=fileauthor %></td>
<%} %>
          <td><%=time%></td>
<%if(filelabel==null){ %>
          <td>&nbsp;</td>
<%}else{ %>
          <td><%=filelabel %></td>
<%} %>
          <td id="foldname"><%=foldname %></td>
<%if(filedescribe==null){ %>
          <td>&nbsp;</td>
<%}else{ %>
          <td><%=filedescribe %></td>
<%} %>
          <td><div align="center"><input id="~~~" type="button" onclick="javascript:window.location='../../fileDisplay.do?fileId=<%=fid%>';" value="打开" /></div></td>
          <td><div align="center"><a href="sourceModify.jsp?fid=<%=fid %>&fpower=<%=filepower %>&dname=<%=departmentname %>&folderid=<%=folderid %>"><img src="../image/images.jpg" alt="" name="bj" width="16" height="16" border="0" id="bj" /></a></div></td>
        </tr>
<%
    
   rs.next();
	j++;
   }
   
   
%>
        <tr>
          <td height="2" colspan="12" bgcolor="#BED9EB"></td>
        </tr>
        <tr>
          <td colspan="12">
            <input type="button" name="Submit" value="删除" onclick="resure();"/>
            <input type="button" name="Submit2" value="自检" onclick="checkItemNull();"/>
            
            <input type="button" name="Submit4" value="打印" onclick="print();"/>
            <input type="button" name="Submit3" value="入库" onclick="inResure();"/>
          </td>
        </tr>
        <tr>
          <td height="2" colspan="12" bgcolor="#BED9EB"></td>
        </tr>
        
      </table>
      <hr>
			<div align="center">
				第<%=intPage%>页 共<%=intPageCount%>页
				<%if(intPage!=1){%>
					<a href="checkSource.jsp?page=1&select1=<%=select1%>&select2=<%=select2%>&sqls=<%=sqls%>">第一页</a>
				<%}else{%>
					第一页
				<%}%>
				<%if(intPage>1){%>
					<a href="checkSource.jsp?page=<%=intPage-1%>&select1=<%=select1%>&select2=<%=select2%>&sqls=<%=sqls%>">上一页</a>
				<%}else{%>
					上一页
				<%}%>
				<%if(intPage<intPageCount){%>
					<a href="checkSource.jsp?page=<%=intPage+1%>&select1=<%=select1%>&select2=<%=select2%>&sqls=<%=sqls%>">下一页</a>
				<%}else{%>
					下一页
				<%}%>
				<%if(intPage!=intPageCount){%>
					<a href="checkSource.jsp?page=<%=intPageCount%>&select1=<%=select1%>&select2=<%=select2%>&sqls=<%=sqls%>">最后一页</a>
				<%}else{%>
					最后一页
				<%}%>
			</div>
  
<br/> 
	  </form>
	  </td></tr>
	
 
</table>

<% }
    }catch(Exception e){
        System.out.println(e.toString());
    } %> 
    </td>
    </tr>
    </table>

</body>
</html>
