// JavaScript Document

var treeRight = new Array();
for(var i = 1; i<100; i++){
	treeRight.push(new Array);	
}
	
function Node(id, name, fatherId, right, subNum, isEnd, subArray, divHtml){
	this.id = id;
	this.name = name;
	this.fatherId = fatherId;
	this.right = right;
	
	this.subNum = subNum;
	this.isEnd = isEnd;
	this.subArray = subArray;
	
	this.divHtml = divHtml;
	this.end = "</div>"
}
//通过addNode 将所有节点存入treeRight
function addNode(id, name, fatherId, right){
	var a_node = new Node(id, name, fatherId, right, 0, true, new Array(), "");
	
	treeRight[right--].push(a_node);
}

function getNode(id, right){
	var a_tree =  treeRight[right];
	
	for(var i=0; i<a_tree.length; i++){
		if(a_tree[i].id = id){
			return a_tree[i];
		}
	}
	return null;
}

function getLastTree(){
	var lastTree = null;
	for(var i=0; i<treeRight.length; i++){
		a_tree = treeRight[i];
		if(a_tree.length == 0){
			return lastTree;
		}
		lastTree = treeRight[i];
	}
	return null;
}

function refrashTree(){
	
}

function creatTree(){
	var lastTree[i] = getLastTree();
	var right = lastTree[0].right;
	
	for(var i=0; i<lastTree.length; i++){
		var bar = lastTree[i];
		var barFather = getNode(bar.fatherId, right-1);	
		barFather.isEnd = false;
		barFater.subArray.push(bar);
		
		bar.divHtml = "<div id='" +bar.id+"'"+"><table><tr><td></td><td></td><td>"+bar.name+"</td></tr></table>";
	}
	
	right--;

	while(right > 0){
		lastTree = treeRight[right];
		
		for(var i=0; i<lastTree.length; i++){
			var bar = lastTree[i];
			var barFather = getNode(bar.fatherId, right-1);
			barFather.isEnd = false;
			barFater.subArray.push(bar);
			
			bar.divHtml = "<div id='" +bar.id+"'"+"><table><tr><td></td><td></td><td>"+bar.name+"</td></tr></table>";
			
			var a_bar = bar.subArray;
			for(var i=0; i< bar.subArray.length; i++){
				bar.divHtml += "<br>" + a_bar[i].divHtml + a_bar[i].end;
			}
		}
		
		right --;
	}
	
	lastTree = treeRight[0];
	
	for(var i=0; i<lastTree.length; i++){
		var bar = lastTree[i];
		
		bar.divHtml = "<div id='" +bar.id+"'"+"><table><tr><td></td><td></td><td>"+bar.name+"</td></tr></table>";
		
		var a_bar = bar.subArray;
		for(var i=0; i< bar.subArray.length; i++){
			bar.divHtml += "<br>" + a_bar[i].divHtml + a_bar[i].end;
		}
		
		bar.divHtml += bar.end + "<br>";
	}
}













