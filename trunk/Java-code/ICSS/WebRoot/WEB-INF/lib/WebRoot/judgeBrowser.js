if (window.navigator.userAgent.indexOf("MSIE")>=1)
{
//浏览器为IE
}else{
if (window.navigator.userAgent.indexOf("Firefox")>=1)
{
//浏览器为Firefox
alert('抱歉，请使用IE系列浏览器');
window.location.href="download.html";
}else{
//浏览器为其他
alert('非主流？用IE！');
window.location.href="download.html";
}
}


