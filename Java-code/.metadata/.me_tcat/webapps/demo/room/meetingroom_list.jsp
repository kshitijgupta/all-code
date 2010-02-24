<%@ page contentType="text/html;charset=GB2312" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="com.chinasofti.meeting.room.vo.MeetingRoomVO" %>
<%@ page import="com.chinasofti.meeting.room.dao.*" %>
<%@ page import="com.chinasofti.base.db.PageHelper"%>
<%@ page import="com.chinasofti.base.util.StringUtil"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%
 String contextPath     = request.getContextPath();
 PageHelper pageHelper 	= null;
 int currentPage		= 1; //当前显示的页面号
 int pageSize 			= 10;
 
 MeetingRoomDAO dao = new MeetingRoomDAOImpl();
 pageHelper=(PageHelper)request.getAttribute("pageHelper");
 if(pageHelper==null){
 	pageHelper = dao.getList("",pageSize,currentPage); 
 }

 List recordList  = pageHelper.getObjList();
 String condition = pageHelper.getCondition();
 Map condMap	  = StringUtil.readCondition(condition);
 
 String mrName    = (String)condMap.get("mrName");
 String mrCount   = (String)condMap.get("mrCount"); 
 
 if(mrName==null) 	mrName = ""; 
 if(mrCount==null) 	mrCount = "";  
  
 if(pageHelper.getCurrentPage()!=0 ){
  	currentPage = pageHelper.getCurrentPage();
 }
 if(pageHelper.getPageSize()!=0 ){
  	pageSize = pageHelper.getPageSize();
 } 
%>

 <SCRIPT  src="<%= contextPath %>/include/js/common.js"></SCRIPT>
 
 <script language="javascript">
function changepage(currentpage){
	document.form1.currentPage.value=currentpage;
	document.form1.way.value="list";
	document.form1.submit();
}
function addRecord(){

	document.form1.action="<%= contextPath %>/room/meetingroom_add.jsp";
	document.form1.submit();
}
function modifyRecord(id){
	var frm = document.form1;	
	frm.way.value="modify";
	frm.currentMrId.value=id;
	frm.submit();	
}
function deleteRecord(id){
	var frm = document.form1;	
	frm.way.value="delete";
	frm.currentMrId.value=id;
	if(confirm("此操作不可恢复，您确定要删除吗？")){
		frm.submit();
	}

}
function deleteMultiRecord(){
	var frm = document.form1;
	if(_recordselected(frm,frm.mrIds)){
		if(confirm("此操作不可恢复，您确定要删除吗？")){
			frm.way.value="batchdel";
			frm.submit();
			return true;
		}
	}
}	
function exportExcel(){
	var frm = document.form1;	
	frm.way.value="downexcel";
	frm.submit();
	return true;	
}

function exportPdf(){
	var frm = document.form1;	
	frm.way.value="downpdf";
	frm.submit();
	return true;	
}

function query(){
	var frm = document.form1;	

	condstr = "";
	if(frm.mrName.value!="")  condstr = condstr + "&mrName="  + frm.mrName.value ;
	if(frm.mrCount.value!="") condstr = condstr + "&mrCount=" + frm.mrCount.value ;
	
	if(condstr!="") condstr = condstr.substring(1,condstr.length);

	
	frm.way.value			= "list";
	frm.condition.value     = condstr;
	frm.currentPage.value	= "1";
	frm.submit();
	return true;	
}

</script>
<title>会议室查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/table.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="15">
<form name=form1 method="post" action="<%= contextPath %>/servlet/MeetingRoomServlet">

    <table width="98%" border="0" cellspacing="0" cellpadding="0" align=center>
	<tr>
	  <th>查询会议室<br>
      &nbsp;</th>
	</tr>

      <tr> 
        <td>
		
		<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="B1BCEC" align=center>
            <tr> 
		      <td width="40%" height="22" bgcolor="#FFFFFF" style="text-align:center">
会议室名称：
			      <input type="text" name="mrName" size="12" value="<%= mrName %>">
		        </td>
		      <td width="40%" bgcolor="#FFFFFF" style="text-align:center">至少容纳人数:
	          <input type="text" name="mrCount" size="12" value="<%= mrCount %>"><br></td>
			    <td width="20%" bgcolor="#FFFFFF" style="text-align:center"><img src="<%= contextPath %>/images/cx.gif" width="53" height="20"   border="0" onClick="query();"></td>
            </tr>
          </table>
		</td>
        
      </tr>
      <tr> 
        <td height="4" background="<%= contextPath %>/images/danghangbg5.jpg"></td>
       
      </tr>
	  <tr>
	  <td> <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="B1BCEC">
            <tr> 
              <td bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
                  <tr> 
                    <td height="2" bgcolor="#993300"></td>
                  </tr>
                </table>
                <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
	          	  <tr bgcolor="#FFFFFF"> 
	          	  	<td width="5%">&nbsp;</td>
                    <td width="10%" height="25">会议室名称</td>
                    <td width="8%">可容纳人数</td>
                    <td width="28%">地址</td>
                    <td>编辑</td>
                    <td>删除</td>
				  </tr>
<%

	int recordnum   = 0;
	for(int i=0; i< recordList.size();i++){
		recordnum ++;
		MeetingRoomVO vo		= (MeetingRoomVO)recordList.get(i);
%>				  
				   <tr bgcolor="#FFFFFF">
				   <td><input type="checkbox" name="mrId" value="<%= vo.getMrId()%>"></td>
				     <td height="24"><%=vo.getMrName() %></td>
				     <td><%=vo.getMrCount() %></td>
				     <td><%=vo.getMrAddress()  %><br></td>
				     <td><input name="imageField3" type="image" src="<%= contextPath %>/images/bianji.gif" width="16" height="16" border="0" onClick="modifyRecord('<%=vo.getMrId() %>');"></td>
				     <td><input name="imageField22" type="image" src="<%= contextPath %>/images/shachu.gif" width="16" height="16" border="0" onClick="deleteRecord('<%=vo.getMrId() %>');"></td>
			      </tr>
<%
	}		
	for(int i=0; i<pageSize - recordnum;i++){
%>
    <tr bgcolor="#FFFFFF">
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td> 
      <td>&nbsp;</td>       
    </tr>

<%
	}
	
%>

<%
if(pageHelper.getPageCount()>0){ %>
	<tr bgcolor="#FFFFFF">		
	    <td colspan="6" style="text-align:center">&nbsp;<%=pageHelper.getPagebar()%></td>
	</tr>
<%
}
%>	      
                </table> </td>
            </tr>
          </table></td>
	  </tr>	 

    </table>
  <p align="center">
    <input type="button" name="AddButton"	  value="增加"  onclick="addRecord();">
    <input type="button" name="DeleteButton"  value="删除"  onclick="deleteMultiRecord();">
    <input type="button" name="excelButton"  value="导出EXCEL"  onclick="exportExcel();">	
    <input type="button" name="pdfButton"  value="导出Pdf"  onclick="exportPdf();">	    
	<input type="hidden" name="way"  value="list" >
	<input type="hidden" name="currentPage" value="<%=currentPage%>"> 
	<input type="hidden" name="pageSize" value="<%=pageSize%>"> 
	<input type="hidden" name="condition" value="<%=condition%>">
	<input type="hidden" name="mrIds" >
	<input type="hidden" name="currentMrId" >	
</p>    
</form>

</body>
</html>
