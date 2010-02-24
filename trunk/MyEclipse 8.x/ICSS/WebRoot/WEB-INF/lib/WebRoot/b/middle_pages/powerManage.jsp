<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%
  String sql ="select usertable.userid,username,password,email,regtime,department.departmentid,departmentname from usertable,department,userdept where usertable.userid=userdept.userid and department.departmentid=userdept.departmentid";
  String path = request.getContextPath();
  String powertable[]={"管理员","处长","副处长","科长","副科长","组长","普通员工"};
%>
<%@ page import="icss.abc.base.db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<SCRIPT language="JavaScript">
//function print(){
	    //Document document = new Document();
	    //PDFWriter.getInstance(document, new FileOutputStream("Helloworld.PDF"));
	    //document.open();
	    //document.add(new Paragraph("Hello World"));
	    //document.close();  
 
	//}
</SCRIPT>
<script>
  function resure(userid){
     var a = window.confirm("sure?");
	 if(a){
	       //确定删除
	       var usid = userid;
	       window.location="../actionjsp/delUSER.jsp?userid="+usid;    
     }
	 else{
	       //放弃删除
	       return false;
	     }
  }
</script>
<style type="text/css">
<!--
.STYLE1 {color: #333333}

body{
     font-family:"宋体";
	 font-size:12px;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
-->
</style>
</head>

<body>
<% 
   
    //定义连接变量
    ResultSet  rs = null;
    ResultSet  rs2 = null;
    PreparedStatement stmt = null;
	Connection conn = null;
    try{//公共连接类
        conn=DBConnection.getConnection();
    }catch(Exception e){
    }
 
    //页面变量元素定义
    int userid = 0;
    String username = "";
    String password = "";
    String email = "";
    String regtime = "";
    String departmentname = "";
    int departmentid = 0;
    int power = -1;
%>
<form id="form1" name="form1" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><div align="right">
      
        部  　 门
          <select name="departmentname">
             <option value="0">--全部--</option>
<%    //查找部门名称
      stmt = conn.prepareStatement("select departmentid,departmentname from department where departmentname<>'公开'");
      rs=stmt.executeQuery();
      while(rs.next()){           
%>
             <option value="<%=rs.getInt("departmentid") %>"><%=rs.getString("departmentname") %></option>
<%
      }
%>
          </select> 
             
          用户名：
          <input name="username" type="text" size="16" />
          权限：
          <select name="power">
		    <option value="-1" selected="selected">全部</option>
			<option value="0"><%=powertable[0] %></option>
			<option value="1"><%=powertable[1] %></option>
			<option value="2"><%=powertable[2] %></option>
			<option value="3"><%=powertable[3] %></option>
			<option value="4"><%=powertable[4] %></option>
			<option value="5"><%=powertable[5] %></option>
			<option value="6"><%=powertable[6] %></option>
          </select>
          <span class="STYLE1"><input type="button" value="搜索" onClick="document.form1.action='powerManage.jsp';document.form1.submit();"></span>        
      
      <label></label>
    </div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <th colspan="10" scope="col">人员权限管理表</th>
        </tr>
      <tr>
        <td  bgcolor="#BED9EB">ID</td>
        <td  bgcolor="#BED9EB">姓名</td>
        <td  bgcolor="#BED9EB">密码</td>
        <td  bgcolor="#BED9EB">部门</td>
        <td  bgcolor="#BED9EB">权限</td>
        <td  bgcolor="#BED9EB">邮箱</td>
        <td  bgcolor="#BED9EB">注册日期</td>
        <td  bgcolor="#BED9EB">修改</td>
        <td  bgcolor="#BED9EB">删除</td>
      </tr>
<%
    //获得隐含参数，判断根据用户搜索拼接SQL语句
    String deptname = request.getParameter("departmentname");
    String uname="";
    String uuname = request.getParameter("username");
    if(uuname!=null){
    
       uname = new String(uuname.getBytes("iso-8859-1"),"UTF-8");
    }    
    String upower = request.getParameter("power");

    if(deptname==null){}else{
        if(!upower.equals("-1")&&!upower.equals("")&&!upower.equals("null"))
        {
             sql="select usertable.userid,username,password,email,regtime,department.departmentid,departmentname,userpower.power from usertable,department,userdept,userpower where usertable.userid=userdept.userid and department.departmentid=userdept.departmentid and usertable.userid=userpower.userid and userpower.power="+upower;
        }
        if(!deptname.equals("0")&&!deptname.equals("")&&!deptname.equals("null"))
        {
             sql+=" and userdept.departmentid="+deptname;
        }
        if(!uname.equals("")&&!uname.equals("null"))
        {
             sql+=" and usertable.username='"+uname+"'";
        }
    }
    System.out.println(sql);
        
%>
<%  //构建显示列表
    //查找了四张表，usertable中找userid,username,password,email,regtime
    //userpower中找userid,power
    //department中找departmentid,departmentname
    //userdept中找userid,departmentid
    try{

        stmt=conn.prepareStatement(sql+" order by usertable.userid",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        rs=stmt.executeQuery();
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>
<%
    try{
//fenyefsfsdfdsddddddddddddddddddddddddddddddddddddddddddddddddddd
            int intRowCount=0;//记录总数
			int intPageCount;//总页数
			int intPageSize = 10;
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
			System.out.println(intPage);
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
         
        userid = rs.getInt("userid");
        username = rs.getString("username");
        password = rs.getString("password");
        email = rs.getString("email");
        regtime = rs.getString("regtime");
        departmentid = rs.getInt("departmentid");
        departmentname = rs.getString("departmentname");
        
        //连接另一张表，查找权限。因为有些用户注册后的权限是要管理员来填写的，可能为空，所以要判断
        stmt=conn.prepareStatement("select power from userpower where userid="+userid);
        rs2=stmt.executeQuery();
        
%>
      <tr>
        <td><%=userid%></td>
        <td><%=username%></td>
        <td><%=password%></td>
        <td><%=departmentname%></td>
<%
        //权限是由管理员填写的，所以可能为空，要判断
        if(rs2.next()){//权限已填写
             power = rs2.getInt("power");
%>
        <td><%=powertable[power]%></td>
<%
        }
        else
        {
            power=-1;
%>
        <td>&nbsp;</td>
<%
        }
%>
        <td><%=email%></td>
        <td><%=regtime%></td>
        <td><div align="center"><a href="powerModify.jsp?userid=<%=userid %>&username=<%=username %>&password=<%=password %>&departmentid=<%=departmentid %>&regtime=<%=regtime %>&email=<%=email %>&power=<%=power %>"><img src="" alt="修改" name="xc" width="16" height="16" border="0" id="sc" style="background-color: #333333" /></a></div></td>
        <td><div align="center"><img src="" alt="删除" name="sc" width="16" height="16" id="sc" style="background-color: #333333;cursor:hand" onclick="resure(<%=userid %>);"/></div></td>
      </tr>
<%
        rs.next();
	j++;
   }//while
    
%>
      <tr>
        <td colspan="10"><label>
          
            <div align="center">
              <input type="button" name="Submit" value="打印" onclick="print();"/>
            </div>
        </label></td>
        </tr>
    </table></td>
  </tr>
</table>
<hr>
			<div align="center">
				第<%=intPage%>页 共<%=intPageCount%>页
				<%if(intPage!=1){%>
					<a href="powerManage.jsp?page=1&departmentname=<%=deptname%>&username=<%=uname%>&power=<%=upower%>">第一页</a>
				<%}else{%>
					第一页
				<%}%>
				<%if(intPage>1){%>
					<a href="powerManage.jsp?page=<%=intPage-1%>&departmentname=<%=deptname%>&username=<%=uname%>&power=<%=upower%>">上一页</a>
				<%}else{%>
					上一页
				<%}%>
				<%if(intPage<intPageCount){%>
					<a href="powerManage.jsp?page=<%=intPage+1%>&departmentname=<%=deptname%>&username=<%=uname%>&power=<%=upower%>">下一页</a>
				<%}else{%>
					下一页
				<%}%>
				<%if(intPage!=intPageCount){%>
					<a href="powerManage.jsp?page=<%=intPageCount%>&departmentname=<%=deptname%>&username=<%=uname%>&power=<%=upower%>">最后一页</a>
				<%}else{%>
					最后一页
				<%}%>
			</div>
  
<br/> 
</form>
<%
  }
    }catch(Exception e){
    }finally{try{
    if(stmt!=null)	stmt.close();
    if(conn!=null)	conn.close();
    }catch(Exception e){}
    }
%>

</body>
</html>
