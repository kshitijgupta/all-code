<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0058)http://bbs.chinajavaworld.com/post!default.jspa?forumID=20 -->
<HTML><HEAD><TITLE>论坛: 发表新主题</TITLE>
<META http-equiv=content-type content="text/html; charset=UTF-8"><LINK 
href="<%=path%>/image3/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript type=text/javascript>
        
        var _jive_base_url = "http://bbs.chinajavaworld.com";
        // determine if a custom TinyMCE CSS file exists in a theme for this request
        var _jive_theme_base_url;
        
    </SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/image3/engine.js" 
type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/image3/util.js" 
type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/image3/Draft.js" 
type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/image3/WikiTextConverter.js" 
type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/image3/JiveSpellChecker.js" 
type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/image3/UploadMonitor.js" 
type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/image3/tiny_mce_gzip" 
type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript type=text/javascript>
        var _editor_lang = "zh";
        var _jive_is_reply = "false";
        var _jive_spell_check_enabled = "true";
        var _jive_gui_quote_text = "";
    </SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/image3/merge_messagepost" 
type=text/javascript></SCRIPT>

<SCRIPT>
	function showVcode(i){
	var isNone=false;
	if(document.getElementById('vcode').style.display=='none'){
	document.getElementById('vcode').style.display='';
	isNone = true;
	}
	if(isNone || i==1)
		 document.getElementById('imgvcode').innerHTML='&nbsp;&nbsp;<img src="/verify/img/'+new Date()+'.gif">&nbsp;<a href="javascript:showVcode(1)">看不清?&nbsp;换张图片</a><br>&nbsp;&nbsp;<input name="verifycode" id="verifycode" style="width:140" value="">&nbsp;输入图片中的字符(不区分大小写)';
	}
	</SCRIPT>

<META content="MSHTML 6.00.2900.3429" name=GENERATOR></HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD width="1%"><A href="http://bbs.chinajavaworld.com/index.jspa"></A></TD>
    <TD width="98%"><IMG height=38 alt="" 
      src="<%=path%>/image3/header-stretch.gif" width="100%" border=0></TD>
    <TD width="1%"><IMG height=38 alt="" src="<%=path%>/image3/header-right.gif" 
      width=5 border=0></TD></TR></TBODY></TABLE><BR>
    <BR>
<DIV class=clearfix id=jive-accountbox>
<DL>
  <DT>欢迎, <STRONG><A title=luoleicn 
  href="http://bbs.chinajavaworld.com/profile.jspa?userID=236374">luoleicn</A> 
  </STRONG></DT>
  <DD><A class=jive-acc-cp 
  href="http://bbs.chinajavaworld.com/profile.jspa?editMode=true&amp;userID=236374">设置</A> 
  </DD>
  <DD><A class="jive-acc-mail " 
  href="http://bbs.chinajavaworld.com/pm.jspa">(0)</A> </DD>
  <DD><A class=jive-acc-logout 
  href="http://bbs.chinajavaworld.com/logout.jspa">退出</A> </DD></DL></DIV>
<P id=jive-breadcrumbs>&nbsp;</P>
<P class=jive-page-title>发表新主题 </P>
<P class=jive-description></P>
<DIV id=jive-postpage>
<SCRIPT type=text/javascript>
    var editorTabs = new MCTabs();
    
    function focusOnGUIEditor(callEvent) {
        var keycode = callEvent.keyCode;
        if (keycode == 9 && !callEvent.shiftKey) { // tab
            tinyMCE.execCommand("mceFocus", null, "mce_editor_0");
        }
    }
    

    // dwr error handling i18n
    var errorHandlerMessage = "从服务器读取数据出错。请稍候重试。";
    DWREngine.setErrorHandler(editorErrorHandler);
</SCRIPT>

<TABLE class=jive-error-message id=dwr-error-table style="DISPLAY: none" 
cellSpacing=0 cellPadding=3 summary="" border=0>
  <TBODY>
  <TR vAlign=top>
    <TD width="1%"><IMG height=16 alt=错误 src="<%=path%>/image3/error-16x16.gif" 
      width=16 border=0></TD>
    <TD width="99%"><SPAN class=jive-error-text 
    id=dwr-error-text></SPAN><BR></TD></TR></TBODY></TABLE>
<TABLE class=jive-error-message id=post-error-table style="DISPLAY: none" 
cellSpacing=0 cellPadding=3 summary="" border=0>
  <TBODY>
  <TR id=post-error-subject style="DISPLAY: none" vAlign=top>
    <TD width="1%"><IMG height=16 alt=错误 src="<%=path%>/image3/error-16x16.gif" 
      width=16 border=0></TD>
    <TD width="99%"><SPAN class=jive-error-text>请输入主题。</SPAN><BR></TD></TR>
  <TR id=post-error-body style="DISPLAY: none" vAlign=top>
    <TD width="1%"><IMG height=16 alt=错误 src="<%=path%>/image3/error-16x16.gif" 
      width=16 border=0></TD>
    <TD width="99%"><SPAN 
  class=jive-error-text>不能发表空的帖子。请填写内容重试。</SPAN><BR></TD></TR></TBODY></TABLE>
<FORM id=postform name=postform 
onsubmit="if (!validatePost(true)) {return false;};startUploadProgress('postButton', '上传进度:', 'attachFile'); return true;" 
action=post!post.jspa?forumID=20&amp;reply=false method=post 
encType=multipart/form-data><INPUT type=hidden value=20 name=forumID> <INPUT 
id=postTypeFlag type=hidden value=false name=postedFromGUIEditor> 
<DIV class=jive-post-form>
<TABLE cellSpacing=2 cellPadding=3 summary="" border=0>
  <TBODY>
  <TR>
    <TD class=jive-label noWrap><LABEL for=subject01>主题: </LABEL></TD>
    <TD><INPUT id=subject01 onkeydown=focusOnGUIEditor(event); 
      style="WIDTH: 100%" tabIndex=1 maxLength=75 size=60 name=subject> </TD></TR>
  <TR>
    <TD class=jive-label style="PADDING-TOP: 6px" vAlign=top><LABEL 
      for=body01>帖子: </LABEL></TD>
    <TD>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" summary="" border=0>
        <TBODY>
        <TR vAlign=top>
          <TD width="100%">
            <DIV id=jive-post-bodybox>
            <DIV class=jive-editor-panel>
            <DIV class=jivetabs id=editor-tabs>
            <DIV class=jive-preferredlink id=jivePreferredEditorModeLink><A 
            class=jive-description onMouseDown="return false;" 
            id=jivePreferredEditorModeLinkHREF 
            href="javascript:setPreferredEditorMode(getEditorMode())">一直使用这种模式</A></DIV>
            <DIV id=jivePreferredEditorMode-advanced 
            style="DISPLAY: none">一直使用这种模式</DIV>
            <DIV id=jivePreferredEditorMode-text 
            style="DISPLAY: none">一直使用这种模式</DIV>
            <UL>
              <LI class=current id=wysiwyg-tab><SPAN><A class=jive-editor-tab 
              title="Click for rich text editor (ALT+R)" accessKey=r 
              onclick="setEditorMode('advanced');return false;" 
              href="javascript:void(0);">高级模式</A> </SPAN></LI>
              <LI id=text-tab><SPAN><A class=jive-editor-tab 
              title="Click for plain text editor (ALT+X)" accessKey=x 
              onclick="setEditorMode('text');return false;" 
              href="javascript:void(0);">普通文本模式</A> </SPAN></LI>
              <LI id=preview-tab><SPAN><A class=jive-editor-tab 
              title="Click for preview (ALT+P)" accessKey=p 
              onclick="setEditorMode('preview');return false;" 
              href="http://bbs.chinajavaworld.com/post!default.jspa?forumID=20#">预览</A> 
              </SPAN></LI></UL><IMG id=jiveEditorWaitImage 
            style="VISIBILITY: hidden" alt="请稍候 ..." 
            src="<%=path%>/image3/busy-16x16.gif" border=0> </DIV>
            <DIV class=jive-panel-wrapper id=editor-panel-wrapper>
            <DIV class=panel id=wysiwyg-panel> </DIV>
            <DIV class=current id=text-panel>
              <DIV class=text-links id=link-panel style="DISPLAY: none">
            <TABLE cellSpacing=0 cellPadding=3 width="100%" summary="" 
              border=0><TBODY>
              <TR>
                <TD colSpan=2><SPAN class="error_label jive-description" 
                  id=link_form_error_msg style="DISPLAY: none">请输入 
                  URL.<BR></SPAN></TD></TR>
              <TR>
                <TD><INPUT class=jive-description id=linkURLID size=45 
                  name=url></TD>
                <TD><INPUT class=jive-description id=linkTextID size=45 
                  name=linkText></TD></TR>
              <TR>
                <TD class=jive-description><LABEL for=linkURLID>URL</LABEL> -- 
                  例子: http://mysite.com/ </TD>
                <TD class=jive-description><LABEL 
                  for=linkTextID>链接文本</LABEL>(可选项) -- 例子: My Site </TD></TR>
              <TR>
                <TD colSpan=2><INPUT class=jive-description onClick="insertLinkCallback();return false;" type=button value=插入链接 name=insertLink> 
<INPUT class=jive-description onClick="insertLinkCancelCallback();return false;" type=button value=取消 name=cancelLink>                </TD></TR></TBODY></TABLE></DIV>
            <DIV><SPAN class=textareaResizeBox id=textEditorResizeBox></SPAN>
            <DIV 
            style="PADDING-LEFT: 0px; PADDING-TOP: 2px; BACKGROUND-COLOR: #fff"><TEXTAREA id=textEditor onfocus=showVcode(0) tabIndex=2 name=body rows=15 cols=30></TEXTAREA> 
            </DIV>
            <DIV id=textEditorResize>
            <DIV onmouseup=rescanInlineSpellCheck(false); class=textareaResize 
            onmousedown="textareaSetResizing(event,'textEditor',true);" 
            style="DISPLAY: block"></DIV><BR 
            style="CLEAR: both"></DIV></DIV></DIV>
            <DIV class=panel id=preview-panel></DIV></DIV></DIV>
            </DIV>
            <BR>
            <INPUT id=postButton tabIndex=3 type=submit value=发表 name=doPost> 
            &nbsp;-&nbsp; <INPUT onClick="if (autoSave.confirmDiscard('你确认要删除吗？')) { handleAttachmentCancel(); return true;} return false;" tabIndex=5 type=submit value=清除 name=cancel> 
            &nbsp; 
            <DIV class=jive-description id=autosave></DIV></TD>
          <TD width="1%">
            <DIV id=jive-markup-help-block style="DISPLAY: none">
            <DIV id=jive-markup-help>
            <TABLE cellSpacing=0 cellPadding=3 width="100%" border=0>
              <THEAD>
              <TR>
                <TH><!-- Plain Text Help -->文本模式帮助 </TH></TR></THEAD>
              <TBODY>
              <TR>
                <TD>
                  <TABLE class=jive-inner-table cellSpacing=0 cellPadding=0 
                  width="100%" border=0>
                    <THEAD>
                    <TR>
                      <TH><!-- Markup -->标记 </TH>
                      <TH><!-- Result -->结果 </TH></TR></THEAD>
                    <TBODY>
                    <TR>
                      <TD><!-- *bold* -->*bold* </TD>
                      <TD><!-- <b>bold</b> --><B>bold</B> </TD></TR>
                    <TR>
                      <TD><!-- +italics+ -->+italics+ </TD>
                      <TD><!-- <i>italics</i> --><I>italics</I> </TD></TR>
                    <TR>
                      <TD><!-- _underline_ -->_underline_ </TD>
                      <TD><!-- <u>underline</u> --><U>underline</U> </TD></TR>
                    <TR>
                      <TD><!-- Superscript: 3^rd^ -->Superscript: 3^rd^ </TD>
                      <TD><!--3<sup>rd</sup>-->3<SUP>rd</SUP> </TD></TR>
                    <TR>
                      <TD><!-- Subscript: 2~n~ -->Subscript: 2~n~ </TD>
                      <TD><!-- 2<sub>n</sub> -->2<SUB>n</SUB> </TD></TR>
                    <TR>
                      <TD><!-- --strike-- -->--strike-- </TD>
                      <TD><!--<strike>strike</strike>--><STRIKE>strike</STRIKE>                      </TD></TR>
                    <TR>
                      <TD><!-- Line: ----- -->Line: ----- </TD>
                      <TD><!-- <hr /> -->
                        <HR>                      </TD></TR>
                    <TR>
                      <TD><!-- Heading 1: h1. -->Heading 1: h1. </TD>
                      <TD><!-- <h1>ABC</h1> -->
                        <H1>ABC</H1></TD></TR>
                    <TR>
                      <TD><!-- Heading 2: h2. -->Heading 2: h2. </TD>
                      <TD><!-- <h2>ABC</h2> -->
                        <H2>ABC</H2></TD></TR>
                    <TR>
                      <TD><!-- Heading 3: h3. -->Heading 3: h3. </TD>
                      <TD><!-- <h3>ABC</h3> -->
                        <H3>ABC</H3></TD></TR>
                    <TR>
                      <TD><!-- Heading 4: h4. -->Heading 4: h4. </TD>
                      <TD><!-- <h4>ABC</h4> -->
                        <H4>ABC</H4></TD></TR>
                    <TR>
                      <TD><!-- Heading 5: h5. -->Heading 5: h5. </TD>
                      <TD><!-- <h5>ABC</h5> -->
                        <H5>ABC</H5></TD></TR>
                    <TR>
                      <TD><!-- Heading 6: h6. -->Heading 6: h6. </TD>
                      <TD><!-- <h6>ABC</h6> -->
                        <H6>ABC</H6></TD></TR>
                    <TR>
                      <TD><!-- Image: !http://../post.gif! -->Image: 
                        !http://../post.gif! </TD>
                      <TD><!-- <img src="images/post-16x16.gif" alt="Post" border="0" /> --><IMG 
                        alt=Post src="<%=path%>/image3/post-16x16.gif" border=0>                      </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></DIV></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=jive-label>&nbsp;</TD>
    <TD noWrap>
      <DIV id=progressBar style="DISPLAY: none">
      <DIV id=theMeter>
      <DIV id=progressBarText></DIV>
      <DIV id=progressBarBox>
      <DIV 
id=progressBarBoxContent></DIV></DIV></DIV></DIV></TD></TR></TBODY></TABLE></DIV></FORM></DIV>
<SCRIPT language=JavaScript type=text/javascript>

var onloadQueue = new Array();

// scripts for dynamic attachment messages:
// shortAttachmentMessage: Attach Files
// longAttachmentMessage: Attach Files (maximum: 5) -- Note, attachments are not saved with a message draft.
var shortAttachmentMessage = "添加附件";
var longAttachmentMessage = "添加附件 (最多: 5)";

longAttachmentMessage += " -- <span class=\"jive-description\">注, 附件不会保存到草稿里.</span>"


// Function passed to multifile.js, MultiSelector object.
function updateAttachmentMessage(length) {
    var attachmentMessageSection = document.getElementById("attachmentMessage");
    if (attachmentMessageSection) {
        if (length && length > 0) {
            attachmentMessageSection.innerHTML = longAttachmentMessage;
        }
        else {
            attachmentMessageSection.innerHTML = shortAttachmentMessage;
        }
    }
}


<!-- Create an instance of the multiSelector class, pass it the output target and the max number of files -->
var multi_selector = new MultiSelector(document.getElementById('jive-file-list'), 5, 0, '删除', updateAttachmentMessage);
<!-- Pass in the file element -->
multi_selector.addElement(document.getElementById('attachFile'));

document.getElementById('jive-file-list').innerHTML = "";
updateAttachmentMessage(0);



var h = parseInt(getCookie("jive_textEditor_height"));
if (h) {
    textareaResizer.editor_id = 'textEditor';
    textareaResizeTo(h);
}





preferredMode = "text";


popupBlockerAlertMessage = "对不起，你的浏览器弹出窗口功能被禁用。请启用弹出窗口功能后继续。";


enabled = true;
interval = 30;
draftType = 2;

objectType = 0;
objectID = 20;

body = 'textEditor';
subject = 'subject01';
properties = [];

confirmationMessage = '你的草稿还未保存。';
saveMessage = '立即保存';
savedMessage = '已保存';
var autoSave = new JiveAutoSave(enabled, interval, draftType, objectType, objectID, body, subject, properties, confirmationMessage, saveMessage, savedMessage);


if (isAdvancedEditorBrowser()) {
    setEditorMode(preferredMode);


}
else if (isTextEditorBrowser()) {
    disableAdvancedMode();
    setEditorMode(preferredMode);
}

function initEditor() {

    Event.observe($('textEditor'), "keyup", autoSave.messageChangeHandler);
    Event.observe($('textEditor'), "change", autoSave.messageChangeHandler);
    Event.observe($('subject01'), "keyup", autoSave.messageChangeHandler);
    Event.observe($('subject01'), "change", autoSave.messageChangeHandler);


    document.postform.subject.focus();

}

onloadQueue.push(initEditor);

function fireOnloadQueue() {
    for (i = 0; i < onloadQueue.length; i++) {
        var func = onloadQueue[i];
        func();
    }
}

/*
* Make sure to remove any existing function in window.onload and add
* it to the onloadQueue.
*/
if (typeof window.onload == 'function') {
    var oldonload = window.onload;
    onloadQueue.push(oldonload);
}

window.onload = fireOnloadQueue;

/*
* When a user cancels a message after selecting attachments,
* remove all the attachments from the multi_selector, otherwise
* they will still be uploaded to the server.
*/
function handleAttachmentCancel() {

    for (var i = 0; i < multi_selector.count; i++) {
        if ($('attachFile_' + i)) {
            Element.remove('attachFile_' + i);
        }
    }
    multi_selector.count = 0;

}


</SCRIPT>
<BR><BR>
<TABLE id=jive-footer cellSpacing=0 cellPadding=6 width="100%" border=0>
  <TBODY>
  <TR>
    <TD>&nbsp;</TD>
  </TR></TBODY></TABLE></BODY></HTML>

