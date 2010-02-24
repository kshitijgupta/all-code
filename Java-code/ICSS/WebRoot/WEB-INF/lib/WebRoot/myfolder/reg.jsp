<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="icss.abc.base.db.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<!-- STATUS OK --><HTML><HEAD><TITLE>ABC用户注册</TITLE>
<s:head theme="ajax" />
<script language="JavaScript" type="text/javascript">
        function doSomething() {
        
          	Document.forms[0].submit();
        }
    </script>

<META http-equiv=Pragma content=no-cache>
<STYLE type=text/css>FORM {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px
}
BODY {
	MARGIN: 4px 8px 0px 0px
}
TD {
	FONT-SIZE: 12px; LINE-HEIGHT: 18px
}
A:link {
	COLOR: #261cdc
}
A:visited {
	COLOR: #261cdc
}
A.bluelink:link {
	COLOR: #0033cc
}
A.bluelink:hover {
	COLOR: #0033cc
}
A.bluelink:visited {
	COLOR: #800080
}
.f14 {
	FONT-SIZE: 14px; LINE-HEIGHT: 20px
}
.p14 {
	FONT-SIZE: 14px
}
.pad10L {
	PADDING-LEFT: 10px
}
.i {
	FONT-SIZE: 16px; FONT-FAMILY: arial
}
A.top {
	FONT-FAMILY: arial
}
A.top:link {
	COLOR: #0000cc; TEXT-DECORATION: underline
}
A.top:visited {
	COLOR: #0000cc; TEXT-DECORATION: underline
}
A.top:active {
	COLOR: #0000cc; TEXT-DECORATION: underline
}
.c {
	COLOR: #7777cc
}
A.c {
	COLOR: #7777cc
}
A.c:visited {
	COLOR: #7777cc
}
.ft {
	FONT-SIZE: 12px; COLOR: #777777; PADDING-TOP: 2px; FONT-FAMILY: Arial; HEIGHT: 20px; TEXT-ALIGN: center
}
.input {
	
}
.item {
	MARGIN-TOP: 0px; FONT-SIZE: 12px; PADDING-TOP: 0px; TEXT-ALIGN: left
}
.item_title {
	FONT-WEIGHT: bold
}
.item_desc {
	MARGIN-TOP: 1px; COLOR: #666
}
.item_error {
	MARGIN-TOP: 1px; DISPLAY: none; COLOR: #ff0000; HEIGHT: 14px
}
.item_green {
	COLOR: #008000
}
.item_input {
	VERTICAL-ALIGN: top; HEIGHT: 20px
}
#ft {
	CLEAR: both; BACKGROUND: #e6e6e6; MARGIN: auto; WIDTH: 650px; LINE-HEIGHT: 20px; TEXT-ALIGN: center
}
#ft {
	FONT-SIZE: 12px; COLOR: #77c; FONT-FAMILY: Arial
}
#ft  {
	FONT-SIZE: 12px; COLOR: #77c; FONT-FAMILY: Arial
}
BODY {
	MARGIN: 0px; FONT-FAMILY: 宋体; TEXT-ALIGN: center
}
TD {
	FONT-SIZE: 12px; LINE-HEIGHT: 18px
}
.BGL {
	PADDING-LEFT: 10px; BACKGROUND-COLOR: #d9f0f0
}
.p14 {
	FONT-SIZE: 14px
}
#freg {
	WIDTH: 650px
}
A IMG {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
.passTips {
	WIDTH: 415px; POSITION: absolute; BACKGROUND-COLOR: #fff
}
.passTips TD {
	FONT: 400 12px/20px arial
}
.tl {
	BACKGROUND: url(/img/passport/tl.gif) no-repeat 0px 50%; WIDTH: 12px; HEIGHT: 40px
}
.tc {
	PADDING-LEFT: 110px; BACKGROUND: url(/img/passport/tc.gif) repeat-x; VERTICAL-ALIGN: top
}
.tr {
	BACKGROUND: url(/img/passport/tr.gif) no-repeat 0px 50%; WIDTH: 35px; TEXT-ALIGN: center
}
.tr IMG {
	MARGIN-TOP: 10px
}
.ml {
	BACKGROUND: url(/img/passport/mlline.gif) repeat-y
}
.mr {
	BACKGROUND: url(/img/passport/mrline.gif) repeat-y
}
.mc {
	BACKGROUND-COLOR: #effdfd
}
.bl {
	BACKGROUND: url(/img/passport/bl.gif) no-repeat; HEIGHT: 13px
}
.bc {
	BACKGROUND: url(/img/passport/bc.gif) repeat-x
}
.br {
	BACKGROUND: url(/img/passport/br.gif) no-repeat
}
</STYLE>


<META content="MSHTML 6.00.2900.3354" name=GENERATOR></HEAD>
<BODY onresize=tipResize() style="MARGIN-TOP: 6px">
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=650 align=center border=0>
  <TBODY>
  <TR>
    <TD id=tdlogo vAlign=top width=146><IMG 
            src="../img/logo.jpg" align=absMiddle border=0></TD>
    

    <TD vAlign=bottom>
      <TABLE style="MARGIN-BOTTOM: 2px" cellSpacing=0 cellPadding=0 width="82%" 
      border=0>
        <TBODY>
        <TR>
          <TD class=BGL align=left width="80%" height=24><B class=p14>
            <DIV id=divBanner>用户注册</DIV></B></TD>
          <TD class="BGL p14" id=tdhelp align=right 
      width="20%"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<DIV id=freg align=left>
<DIV id=check_username_script style="DISPLAY: none"></DIV>








<s:form method="post"  validate="true" theme="ajax" >
	<s:textfield label="用户名" name="username" maxlength="14"/>
    <s:password label="密码" name="password1" maxlength="14"/>
    <s:password label="确认" name="password2" maxlength="14"/>
    <s:textfield label="电子与邮箱" name="Email"maxlength="30"/>
    
    要加入的部门<select name="dept">
    
    <%
    Connection conn=null;
    Statement stmt = null;
    ResultSet rs = null;
      String sql = "select departmentid, departmentname from department";
      try{conn = DBConnection.getConnection();
       stmt = conn.createStatement();
       rs = stmt.executeQuery(sql);
      
      while(rs.next()){
      %>
      <option value="<%=rs.getInt("departmentid") %>"><%=rs.getString("departmentname") %></option>
      
      <%}
      }catch(Exception e){}
      finally{
      	if(rs!=null)	rs.close();
      	if(stmt!=null)	stmt.close();
      	if(conn!=null)	conn.close();
      }
     %>
    
    
    
    </select>
     <DIV style="MARGIN: 10px 0px">  <s:submit value="同意以下协议并注册"onclick='doSomething()' />
            </DIV>
</s:form>









<TABLE cellSpacing=0 cellPadding=0 width=630 border=0>
  <TBODY>
  <TR>
    <TD>
      
      
      <TABLE class=pad10L cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          </TR>
        <TR id=act_space style="DISPLAY: none">
          <TD class=f14 vAlign=top></TD></TR>
   

        <TR>
          <TD class=f14 vAlign=top>
           
            <textarea name="textarea" readonly style="FONT-SIZE: 12px; WIDTH: 480px; COLOR: #666; HEIGHT: 110px">一、总则

1．1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击"同意"按钮即表示用户与ABC公司达成协议，完全接受本协议项下的全部条款。
1．2　用户注册成功后，ABC将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。
1．3　用户可以使用ABC各个频道单项服务，当用户使用ABC各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及ABC在该单项服务中发出的各类公告的同意。
1．4　ABC会员服务协议以及各个频道单项服务条款和公告可由ABC公司随时更新，且无需另行通知。您在使用相关服务时,应关注并遵守其所适用的相关条款。
　　您在使用ABC提供的各项服务之前，应仔细阅读本服务协议。如您不同意本服务协议及/或随时对其的修改，您可以主动取消ABC提供的服务；您一旦使用ABC服务，即视为您已了解并完全同意本服务协议各项内容，包括ABC对服务协议随时所做的任何修改，并成为ABC用户。

二、注册信息和隐私保护

2．1　ABC帐号（即ABC用户ID）的所有权归ABC，用户完成注册申请手续后，获得ABC帐号的使用权。用户应提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。如果因注册信息不真实而引起的问题，并对问题发生所带来的后果，ABC不负任何责任。
2．2　用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知ABC。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，ABC不承担任何责任。
2．3　ABC不对外公开或向第三方提供单个用户的注册资料，除非：
（1）事先获得用户的明确授权；
（2）只有透露你的个人资料，才能提供你所要求的产品和服务；
（3）根据有关的法律法规要求；
（4）按照相关政府主管部门的要求；
（5）为维护ABC的合法权益。
2．4　在你注册ABC帐户，使用其他ABC产品或服务，访问ABC网页, 或参加促销和有奖游戏时，ABC会收集你的个人身份识别资料，并会将这些资料用于：改进为你提供的服务及网页内容。

三、使用规则

3．1　用户在使用ABC服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶
（1）上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：
1） 反对宪法所确定的基本原则的； 2） 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3） 损害国家荣誉和利益的； 4） 煽动民族仇恨、民族歧视、破坏民族团结的； 5） 破坏国家宗教政策，宣扬邪教和封建迷信的； 6） 散布谣言，扰乱社会秩序，破坏社会稳定的； 7） 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8） 侮辱或者诽谤他人，侵害他人合法权利的； 9） 含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容； 10） 含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的； 
（2）不得为任何非法目的而使用网络服务系统；
（3）不利用ABC服务从事以下活动：
1) 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；
2) 未经允许，对计算机信息网络功能进行删除、修改或者增加的；
3) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；
4) 故意制作、传播计算机病毒等破坏性程序的；
5) 其他危害计算机信息网络安全的行为。
3．2　用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，您同意赔偿ABC与合作公司、关联公司，并使之免受损害。对此，ABC有权视用户的行为性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收ABC帐号、追究法律责任等措施。对恶意注册ABC帐号或利用ABC帐号进行违法活动、捣乱、骚扰、欺骗、其他用户以及其他违反本协议的行为，ABC有权回收其帐号。同时，ABC公司会视司法部门的要求，协助调查。
3．3　用户不得对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其它商业目的。
3．4　用户须对自己在使用ABC服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及在ABC公司首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应给予ABC公司等额的赔偿。 

四、服务内容

4．1　ABC网络服务的具体内容由ABC根据实际情况提供。
4．2　除非本服务协议另有其它明示规定，ABC所推出的新产品、新功能、新服务，均受到本服务协议之规范。
4．3　为使用本服务，您必须能够自行经有法律资格对您提供互联网接入服务的第三方，进入国际互联网，并应自行支付相关服务费用。此外，您必须自行配备及负责与国际联网连线所需之一切必要装备，包括计算机、数据机或其它存取装置。
4．4　鉴于网络服务的特殊性，用户同意ABC有权不经事先通知，随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。ABC不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。
4．5　ABC需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，ABC无栉顺械Ｈ魏卧鹑巍０俣缺Ａ舨痪孪韧ㄖ薇Ｑ⑸痘蚱渌康脑萃１痉袢魏尾糠值娜ɡ?．6本服务或第三人可提供与其它国际互联网上之网站或资源之链接。由于ABC无法控制这些网站及资源，您了解并同意，此类网站或资源是否可供利用，ABC不予负责，存在或源于此类网站或资源之任何内容、广告、产品或其它资料，ABC亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资源获得的任何内容、商品或服务所产生的任何损害或损失，ABC不承担任何责任。。
4．7　用户明确同意其使用ABC网络服务所存在的风险将完全由其自己承担。用户理解并接受下载或通过ABC服务取得的任何信息资料取决于用户自己，并由其承担系统受损、资料丢失以及其它任何风险。ABC对在服务网上得到的任何商品购物服务、交易进程、招聘信息，都不作担保。
4．8　6个月未登陆的帐号，ABC保留关闭的权利。
4．9　ABC有权于任何时间暂时或永久修改或终止本服务（或其任何部分），而无论其通知与否，ABC对用户和任何第三人均无需承担任何责任。
4．10　终止服务
您同意ABC得基于其自行之考虑，因任何理由，包含但不限于长时间未使用，或ABC认为您已经违反本服务协议的文字及精神，终止您的密码、帐号或本服务之使用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本服务协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并同意，ABC可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您的帐号及相关信息和文件被关闭或删除，ABC对您或任何第三人均不承担任何责任。

五、知识产权和其他合法权益（包括但不限于名誉权、商誉权）

5．1　用户专属权利
ABC尊重他人知识产权和合法权益，呼吁用户也要同样尊重知识产权和他人合法权益。若您认为您的知识产权或其他合法权益被侵犯，请按照以下说明向ABC提供资料∶
　 请注意：如果权利通知的陈述失实，权利通知提交者将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。如果上述个人或单位不确定网络上可获取的资料是否侵犯了其知识产权和其他合法权益，ABC建议该个人或单位首先咨询专业人士。 
　 为了ABC有效处理上述个人或单位的权利通知，请使用以下格式（包括各条款的序号）： 
　　 1. 权利人对涉嫌侵权内容拥有知识产权或其他合法权益和/或依法可以行使知识产权或其他合法权益的权属证明；
　　 2. 请充分、明确地描述被侵犯了知识产权或其他合法权益的情况并请提供涉嫌侵权的第三方网址（如果有）。
　　 3. 请指明涉嫌侵权网页的哪些内容侵犯了第2项中列明的权利。
　　 4. 请提供权利人具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、单位登记证明复印件（对单位）、通信地址、电话号码、传真和电子邮件。
　　 5. 请提供涉嫌侵权内容在信息网络上的位置（如指明您举报的含有侵权内容的出处，即：指网页地址或网页内的位置）以便我们与您举报的含有侵权内容的网页的所有权人/管理人联系。
　　 6. 请在权利通知中加入如下关于通知内容真实性的声明： “我保证，本通知中所述信息是充分、真实、准确的，如果本权利通知内容不完全属实，本人将承担由此产生的一切法律责任。”
　　 7. 请您签署该文件，如果您是依法成立的机构或组织，请您加盖公章。 
　 请您把以上资料和联络方式书面发往以下地址：　　
中国北京市海淀区海淀大街38号银科大厦19层
　　 ABC公司 投诉组
　　 邮政编码：100080
5．2　对于用户通过ABC服务（包括但不限于贴吧、知道、MP3、影视等）上传到ABC网站上可公开获取区域的任何内容，用户同意ABC在全世界范围内具有免费的、永久性的、不可撤销的、非独家的和完全再许可的权利和许可，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知的或以后开发的其他任何形式的作品、媒体或技术中。
5．3　ABC拥有本网站内所有资料的版权。任何被授权的浏览、复制、打印和传播属于本网站内的资料必须符合以下条件：
所有的资料和图象均以获得信息为目的；
　　 所有的资料和图象均不得用于商业目的；
　　 所有的资料、图象及其任何部分都必须包括此版权声明；
　　 本网站（www.baidu.com）所有的产品、技术与所有程序均属于ABC知识产权，在此并未授权。
　　 “Baidu”, “ABC”及相关图形等为ABC的注册商标。
　　 未经ABC许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，ABC将依法追究法律责任。

六、青少年用户特别提示

青少年用户必须遵守全国青少年网络文明公约：
要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。

七、其他

7．1　本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。
7．2　如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向ABC所在地的人民法院提起诉讼。
7．3　ABC未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。
7．4　如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。


　　请您在发现任何违反本服务协议以及其他任何单项服务的服务条款、ABC各类公告之情形时，通知ABC。您可以通过如下联络方式同ABC联系∶
中国黑龙江省哈尔滨市区哈尔滨工业大学2公寓6楼
　　 ABC公司 投诉组
　　 邮政编码：150001


		    </textarea></TD>
        </TR>

		</TBODY></TABLE>
     
      <BR>
      <DIV></DIV>
      <CENTER></CENTER>
      <DIV id=ft>&copy;2008 abc</DIV>
      <DIV class=passTips id=passTips style="DISPLAY: none">
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD class=tl></TD>
          <TD class=tc><IMG src="bd.files/arrow.gif"></TD>
          <TD class=tr><A href="javascript:showTips();"><IMG title=关闭 
            src="bd.files/close2.gif"></A></TD></TR>
        <TR>
          <TD class=ml></TD>
          <TD 
            class=mc>密码被盗，您就会有个人信息泄漏的危险，有可能对您和好友的利益造成损害。<BR>强烈建议您在设置密码时注意以下几点：<BR>1、不要使用过于简单的密码，如"111"、"abc"等。<BR>2、不要使用自己的公开信息作为密码，如生日、电话、用户名等。<BR>3、最好使用数字、字母、下划线的组合。<BR>4、不要相信以ABC名义询问密码的站内信息，一经发现请立刻举报。<BR><A 
            href="http://www.baidu.com/search/passport_help.html#06" 
            target=_blank>更多安全防范措施</A><BR>
            <CENTER></CENTER></TD>
          <TD class=mr></TD></TR>
        <TR>
          <TD class=bl></TD>
          <TD class=bc></TD>
          <TD 
class=br></TD></TR></TBODY></TABLE></DIV></TR></TBODY></TABLE></DIV></CENTER>

</BODY></HTML>
