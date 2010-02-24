//welcome
function welcome(){
	var tNow = new Date();
	var iHour = tNow.getHours();
	var sWelcome;
	if(iHour == 23||iHour < 1){sWelcome='午夜';}
	else if(iHour <  6){sWelcome='凌晨';}
	else if(iHour <  8){sWelcome='早晨';}
	else if(iHour < 11){sWelcome='上午';}
	else if(iHour < 13){sWelcome='中午';}
	else if(iHour < 17){sWelcome='下午';}
	else if(iHour < 19){sWelcome='傍晚';}
	else{sWelcome='晚上';}
	sWelcome += '好!';
	document.write(sWelcome);
}

function checkCookie(){
	var sCookieValue1 = getCookie('NTES_SESS');
	if(sCookieValue1){
		var sCookieValue2 = getCookie('NETEASE_SSN'); 
		if (sCookieValue2){
			window.location="/Main.jsp?username="+sCookieValue2;
		}
	}
	//$('username').focus();
}
			
function getCookie(name){
    var cookiestr,reg,res,pos;
    cookiestring    =       new String(document.cookie);
    reg             =       new RegExp(name + '=[^;]*','i');
    tmp             =       cookiestring.match(reg);
    if(tmp == null){return false;}
    res             =       tmp[0];
    chr             =       "=";
    pos             =       res.indexOf(chr);
    return res.substring(pos+1);
}

function checkUsername(username) {
	 	var pos = username.indexOf("@");
	 	if(pos == -1)
	 		return username.length > 0;
	 	else{
	 		var ssn = username.substring(0,pos);
	 		return ssn.length > 0;
	 		
	 	}
	 	
	}
	

function checkdata() {
	
	if( !checkUsername(fLogin.username.value) ) {
		eHint.innerHTML="\请您输入正确的用户名";
        fLogin.username.focus() ;
		return false;
	}
	if( fLogin.password.value.length<1 || fLogin.password.value.length>20 ) {
		eHint.innerHTML="\请您输入正确的密码";
        fLogin.password.focus() ;
		return false;
	}
}