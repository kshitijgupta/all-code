// ѡ�б������е�checkbox���󣬻��ߣ�ȡ��ȫ����ѡ��
function _selectall(checkboxobj,formobj)
{   
	if(checkboxobj.checked){
		for(i=0;i<formobj.elements.length;i++){
			if(formobj.elements[i].type=="checkbox"){
				formobj.elements[i].checked = true;
			}
		}
	}
	else{
		for(i=0;i<formobj.elements.length;i++){
			if(formobj.elements[i].type=="checkbox"){
				formobj.elements[i].checked = false;
			}
		}
	}
}
//��¼����Ҫɾ������id��Ϣ
function _recordselected(frmobj,delid){
	var  delstr = "";
	var  findflag = false;
	for(i=0;i<frmobj.elements.length;i++){
		 if(frmobj.elements[i].type=="checkbox"&&frmobj.elements[i].checked==true&&frmobj.elements[i].name!="selectall"){
		 	if(findflag) delstr = delstr +","+frmobj.elements[i].value;
			else		 delstr = frmobj.elements[i].value;
			findflag = true;
		 }
	}
	if(delstr==""){
		  alert("��ѡ��Ҫɾ����ģ�飡");
		  return false;
	}else{
		delid.value = delstr;
		return true;
	}
}