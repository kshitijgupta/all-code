if (window.navigator.userAgent.indexOf("MSIE")>=1)
{
//IE
}else{
if (window.navigator.userAgent.indexOf("Firefox")>=1)
{
//Firefox
alert('抱歉，请使用IE浏览器');
window.location="download.html";
}else{
//Ohter
alert('非主流？用IE！');
window.location="download.html";
}
}