
String.prototype.trim = function () {
	return this.replace(/(^\s*)|(\s*$)/g, "");
};
var Util = {getXY:function (Obj) {
	var sumTop = 0, sumLeft = 0;
	while (Obj != document.body) {
		sumLeft += Obj.offsetLeft;
		sumTop += Obj.offsetTop;
		Obj = Obj.offsetParent;
	}
	return {x:sumLeft, y:sumTop};
}};
var Passport = {usernameInputElement:false, usernameInputElementX:false, usernameInputElementY:false, usernameInputHeight:false, usernameListElement:false, currentSelectIndex:-1, domainSelectElmentString:"<div id = \"passportusernamelist\" class=\"domainSelector\"   style=\"position: absolute; display: none;\"><table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td class=\"title\" style=\"title\" >\u8bf7\u9009\u62e9\u7528\u6237\u540d</td></tr><tr><td><td /></tr></tbody></table></div><div style=\"display: none;\"></div><div id=\"passport_111\"></div>", domainSelectElement:false, domainArray:["",""],
 bind:function (obj) {
	this.usernameInputElement = obj;
	var xy = Util.getXY(this.usernameInputElement);
	this.usernameInputElementX = xy.x;
	this.usernameInputElementY = xy.y;
	this.handle();
}, handle:function () {
	document.write(this.domainSelectElmentString);
	this.domainSelectElement = document.getElementById("passportusernamelist");
	this.usernameListElement = this.domainSelectElement.firstChild.rows[1].firstChild;
	this.currentSelectIndex = 0;
	this.usernameInputElement.onblur = function () {
		Passport.doSelect();
	};
	try {
		this.usernameInputElement.addEventListener("keypress", this.keypressProc, false);
		this.usernameInputElement.addEventListener("keyup", this.keyupProc, false);
	}
	catch (e) {
		try {
			this.usernameInputElement.attachEvent("onkeydown", this.checkKeyDown);
			this.usernameInputElement.attachEvent("onkeypress", this.keypressProc);
			this.usernameInputElement.attachEvent("onkeyup", this.keyupProc);
		}
		catch (e) {
		}
	}
}, preventEvent:function (event) {
	event.cancelBubble = true;
	event.returnValue = false;
	if (event.preventDefault) {
		event.preventDefault();
	}
	if (event.stopPropagation) {
		event.stopPropagation();
	}
}, checkKeyDown:function (event) {
	this.currentSelectIndex = 0;
	var keyCode = event.keyCode;
	if (keyCode == 38 || keyCode == 40) {
		Passport.clearFocus();
		if (keyCode == 38) {
			Passport.upSelectIndex();
		} else {
			Passport.downSelectIndex();
		}
		Passport.setFocus();
	}
}, keyupProc:function (event) {
	this.currentSelectIndex = 0;
	var keyCode = event.keyCode;
	Passport.changeUsernameSelect();
	if (keyCode == 13) {
		Passport.doSelect();
	}
}, keypressProc:function (event) {
	this.currentSelectIndex = 0;
	var keyCode = event.keyCode;
	if (keyCode == 13) {
		Passport.preventEvent(event);
	} else {
		if (keyCode == 38 || keyCode == 40) {
			Passport.preventEvent(event);
			Passport.clearFocus();
			if (keyCode == 38) {
				Passport.upSelectIndex();
			} else {
				Passport.downSelectIndex();
			}
			Passport.setFocus();
		} else {
			if (keyCode == 108 || keyCode == 110 || keyCode == 111 || keyCode == 115) {
				setTimeout("Passport.changeUsernameSelect()", 20);
			}
		}
	}
}, clearFocus:function (index) {
	var index = this.currentSelectIndex;
	try {
		var x = this.findTdElement(index);
		x.style.backgroundColor = "white";
	}
	catch (e) {
	}
}, findTdElement:function (index) {
	try {
		var x = this.usernameListElement.firstChild.rows;
		for (var i = 0; i < x.length; ++i) {
			if (x[i].firstChild.idx == index) {
				return x[i].firstChild;
			}
		}
	}
	catch (e) {
	}
	return false;
}, upSelectIndex:function () {
	var index = this.currentSelectIndex;
	if (this.usernameListElement.firstChild == null) {
		return;
	}
	var x = this.usernameListElement.firstChild.rows;
	var i;
	for (i = 0; i < x.length; ++i) {
		if (x[i].firstChild.idx == index) {
			break;
		}
	}
	if (i == 0) {
		this.currentSelectIndex = (x.length - 1);
	} else {
		this.currentSelectIndex = x[i - 1].firstChild.idx;
	}
}, downSelectIndex:function () {
	var index = this.currentSelectIndex;
	if (this.usernameListElement.firstChild == null) {
		return;
	}
	var x = this.usernameListElement.firstChild.rows;
	var i = 0;
	for (; i < x.length; ++i) {
		if (x[i].firstChild.idx == index) {
			break;
		}
	}
	if (i >= x.length - 1) {
		this.currentSelectIndex = x[0].firstChild.idx;
	} else {
		this.currentSelectIndex = x[i + 1].firstChild.idx;
	}
}, setFocus:function () {
	var index = this.currentSelectIndex;
	try {
		var x = this.findTdElement(index);
		x.style.backgroundColor = "#D5F1FF";
	}
	catch (e) {
	}
}, changeUsernameSelect:function () {
	var userInput = this.usernameInputElement.value;
	if (userInput.trim() == "") {
		this.domainSelectElement.style.display = "none";
	} else {
		var username = "", hostname = "";
		var pos;
		if ((pos = userInput.indexOf("@")) < 0) {
			username = userInput;
			hostname = "";
		} else {
			username = userInput.substr(0, pos);
			hostname = userInput.substr(pos + 1, userInput.length);
		}
		var usernames = [];
		if (hostname == "") {
			for (var i = 0; i < this.domainArray.length; ++i) {
				usernames.push(username + "@" + this.domainArray[i]);
			}
		} else {
			for (var i = 0; i < this.domainArray.length; ++i) {
				if (this.domainArray[i].indexOf(hostname) == 0) {
					usernames.push(username + "@" + this.domainArray[i]);
				}
			}
		}
		if (usernames.length > 0) {
			//this.currentSelectIndex = 0 ;
			this.domainSelectElement.style.left = this.usernameInputElementX + "px";
			var isSafari;
			if((isSafari=navigator.userAgent.indexOf("Safari"))>0){
				this.domainSelectElement.style.top = (this.usernameInputElementY + this.usernameInputElement.offsetHeight + 20) + "px";
				
			}else
				this.domainSelectElement.style.top = (this.usernameInputElementY + this.usernameInputElement.offsetHeight) + "px";
				
					
			this.domainSelectElement.style.zIndex = "2000";
			this.domainSelectElement.style.paddingRight = "0";
			this.domainSelectElement.style.paddingLeft = "0";
			this.domainSelectElement.style.paddingTop = "0";
			this.domainSelectElement.style.paddingBottom = "0";
			this.domainSelectElement.style.backgroundColor = "white";
			this.domainSelectElement.style.display = "block";
			var myTable = document.createElement("TABLE");
			myTable.width = "100%";
			myTable.cellSpacing = 0;
			myTable.cellPadding = 3;
			var tbody = document.createElement("TBODY");
			myTable.appendChild(tbody);
			for (var i = 0; i < usernames.length; ++i) {
				var tr = document.createElement("TR");
				var td = document.createElement("TD");
				td.nowrap = "true";
				td.align = "left";
				td.innerHTML = usernames[i];
				td.idx = i;
				td.onmouseover = function () {
					Passport.clearFocus();
					Passport.currentSelectIndex = this.idx;
					Passport.setFocus();
					this.style.cursor = "hand";
				};
				td.onmouseout = function () {
				};
				td.onclick = function () {
					Passport.doSelect();
				};
				tr.appendChild(td);
				tbody.appendChild(tr);
			}
			this.usernameListElement.innerHTML = "";
			this.usernameListElement.appendChild(myTable);
			this.setFocus();
		} else {
			this.domainSelectElement.style.display = "none";
			this.currentSelectIndex = -1;
		}
	}
}, doSelect:function () {
	this.domainSelectElement.style.display = "none";
	if (this.usernameInputElement.value.trim() == "") {
		return;
	}
	var currentUsernameTd = this.findTdElement(this.currentSelectIndex);
	if (currentUsernameTd) {
		this.usernameInputElement.value = currentUsernameTd.innerHTML;
	}
}};

