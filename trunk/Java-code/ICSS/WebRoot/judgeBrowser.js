if (window.navigator.userAgent.indexOf("MSIE")>=1)
{
//�����ΪIE
}else{
if (window.navigator.userAgent.indexOf("Firefox")>=1)
{
//�����ΪFirefox
alert('��Ǹ����ʹ��IEϵ�������');
window.location.href="download.html";
}else{
//�����Ϊ����
alert('����������IE��');
window.location.href="download.html";
}
}


