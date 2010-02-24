<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="icss.abc.base.db.*" %>
<%String powertable[]={"管理员","处长","副处长","科长","副科长","组长","普通员工"}; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>资源信息更改</title>
</head>
<style type="text/css">
<!--
body{
     font-family:"宋体";
	 font-size:12px;
}
.STYLE1 {
	color: #333366;
	font-size: 16px;
	font-weight: bold;
}
-->
</style>
<script language="javascript">
<!--
function testNull(){
	var fm = window.document.form1;
	if(fm.filetype.value==""){
	   leimu.innerHTML="类目不能为空！";
	   fm.filetype.focus();
	   return false;
	 }
	 if(fm.filename.value==""){
	   biaoti.innerHTML="标题不能为空！";
	   fm.filename.focus();
	   return false;
	 }
	 if(fm.folderid.value==0){
	   mulu.innerHTML="请选择所属目录!";
	   fm.folderid.focus();
	   return false;
	 }
	 
	 return true;
}
-->
</script>
<body>
<table width="100%" border="0" cellspacing="1" cellpadding="1">
  <tr>
    <td colspan="2"><div align="right">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="20%"> 　<span class="STYLE1">资源信息修改</span> </td>
          <td width="80%" valign="top"><div align="right"><a href="javascript:history.back(-1);">返回</a></div></td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="86%">
<%
    int fileid = Integer.parseInt(request.getParameter("fid"));
    String filetype = "";
    String filename ="";
    int filepower = Integer.parseInt(new String(request.getParameter("fpower").getBytes("iso-8859-1"),"UTF-8"));
    String departmentname = new String(request.getParameter("dname").getBytes("iso-8859-1"),"UTF-8");
    String fileauthor ="";
    String time ="";
    String filelabel ="";
    String foldname ="";
    String foid=request.getParameter("folderid");
    int folderid=0;
    if(foid!=null){
        folderid = Integer.parseInt(foid);
    }
    
    String filedescribe = "";
%>
<%
    
    ResultSet  rs = null;
    PreparedStatement stmt = null;
	Connection conn = null;
	ResultSet  rs2 = null;
    try{
    //DBConnection dbconnection = new DBConnection();
     
	conn=DBConnection.getConnection();
	//创建Statement
	//stmt = conn.prepareStatement("select abcfile.fileid,filetype,filename,fileauthor,abcfile.Time,filelabel,filedescribe,foldname from abcfile,filefolder,abcfolder where abcfile.fileid= "+fileid+" And abcfile.fileid=filefolder.fileid and filefolder.folderid=abcfolder.folderid");
	stmt = conn.prepareStatement("select abcfile.fileid,filetype,filename,fileauthor,abcfile.Time,filelabel,filedescribe from abcfile where abcfile.fileid= "+fileid);
	
	rs = stmt.executeQuery();
    }catch(Exception e){
         out.println("error");
    }
     if(rs.next()){
     filedescribe = rs.getString("filedescribe");
     filetype =rs.getString("filetype");
     filename = rs.getString("filename");
     
     fileauthor = rs.getString("fileauthor");
     time = rs.getString("time");
     filelabel = rs.getString("filelabel");
     if(filelabel==null){filelabel="";}//标签为空时要显示为空
     
     filedescribe = rs.getString("filedescribe");
     if(filedescribe==null){filedescribe="";}
     //foldname = rs.getString("foldname");
     }

%>  
    <form id="form1" name="form1" method="post" action="../actionjsp/checkModify.jsp" onsubmit="return testNull();">
	<table width="100%" border="0" cellspacing="1" cellpadding="1">
      <tr>
        <td>
          <label>类 　 型
          <input type="hidden" name="fileid" value="<%=fileid%>"/>
          <select name="filetype">
<%
      if(filetype.equals("music")){
%>
              <option value="music" selected>music</option>
<%
      }
      else
      {
%>
              <option value="music">music</option>
<%
      }
%>
<%
      if(filetype.equals("movie")){
%>
              <option value="movie" selected>movie</option>
<%
      }
      else
      {
%>
              <option value="movie">movie</option>
<%
      }
%>
<%
      if(filetype.equals("picture")){
%>
              <option value="picture" selected>picture</option>
<%
      }
      else
      {
%>
              <option value="picture">picture</option>
<%
      }
%>    
<%
      if(filetype.equals("other")){
%>
              <option value="other" selected>other</option>
<%
      }
      else
      {
%>
              <option value="other">other</option>
<%
      }
%>       
  
          </select> 
          </label>        <span id="leimu"></span></td>
      </tr>
      <tr>
        <td>
          <label>标  　 题
            <input name="filename" type="text" size="24" value="<%=filename%>"/>
            </label><span id="biaoti2">例：名称后的-xx.扩展名不能更改        <span id="biaoti"></span></td>
      </tr>
      <tr>
        <td>
          <label>部  　 门
          <select name="departmentname">
<%
      stmt = conn.prepareStatement("select departmentid,departmentname from department");
      rs2=stmt.executeQuery();
      while(rs2.next()){
           if(rs2.getString("departmentname").equals(departmentname)){
           
%>
             <option value="<%=rs2.getInt("departmentid") %>" selected><%=rs2.getString("departmentname") %></option>
<%
           }
           else
           {
           
%>
             <option value="<%=rs2.getInt("departmentid") %>"><%=rs2.getString("departmentname") %></option>
<%
           }
     }
%>
          </select> 
            </label>        </td>
      </tr>
      <tr>
        <td>密  　 级
          <select name="filepower">
<%
      int i=0;
      for(i=0; i<7; i++){
         if(filepower==i){
%>
		     <option value="<%=i%>" selected><%=powertable[i]%></option>
<%
         }else{
             
%>
             <option value="<%=i%>"><%=powertable[i]%></option>
<%
         }
}
%>
<%
      if(filepower==100){
%>
             <option value="100" selected>公开</option>
<%
      }else{
%>
             <option value="100">公开</option>
<%
      }
%>
          </select>
          </td>
      </tr>
      <tr>
        <td>
          <label>上 传 者
            <input name="fileauthor" type="text" size="24" value="<%=fileauthor%>"/>
            </label>        </td>
      </tr>
      <tr>
        <td>
          <label>上传时间
            <!--  <input name="time" type="text" size="24" value="<%=time%>"/>--><%=time %>
            </label>        </td>
      </tr>
      <tr>
        <td>
          <label>标  　 签
            <input name="filelabel" type="text" size="24" value="<%=filelabel%>"/>
            </label>        </td>
      </tr>
      <tr>
        <td>
          <label>所在目录
            <!--<input name="folderid" type="hidden" value="<%=folderid %>"/>  -->
            <select name="folderid">
<%
      stmt = conn.prepareStatement("select folderid,foldname from abcfolder");
      rs2=stmt.executeQuery();
      if(folderid==0){
%>
                
<%
      }

      while(rs2.next()){
%>         
<%        
           if(rs2.getInt("folderid")==folderid){
              if(rs2.getInt("folderid")%2==1){
           
%>
                <option value="<%=rs2.getInt("folderid") %>" selected>公开-<%=rs2.getString("foldname") %></option>
<%
              }else{
%>
               <option value="<%=rs2.getInt("folderid") %>" selected>内部-<%=rs2.getString("foldname") %></option>
<%
              }
           }
           else
           {
              if(rs2.getInt("folderid")%2==1){
           
%>
                <option value="<%=rs2.getInt("folderid") %>" selected>公开-<%=rs2.getString("foldname") %></option>
<%
              }else{
%>
               <option value="<%=rs2.getInt("folderid") %>" selected>内部-<%=rs2.getString("foldname") %></option>
<%
              }
           }
      }try{
    if(stmt!=null)	stmt.close();
    if(conn!=null)	conn.close();
    }catch(Exception e){}
    
%>   
            <option value="0">--请选择--</option>
         </select>
            </label>        <span id="mulu"></span></td>
      </tr>
      <tr>
        <td>
          <label>描  　 述
            <textarea name="filedescribe" cols="24" ><%=filedescribe%></textarea>
            </label>        </td>
      </tr>
      <tr>
        <td><label>
          <input type="submit" name="Submit" value="提交" />
        </label>
          <label>
          <input type="reset" name="Submit2" value="重置" />
          </label></td>
      </tr>
    </table>
    </form></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
</body>
</html>
