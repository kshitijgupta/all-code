













function customSelector(instance) {
var matches   = {};
var ret       = []; // Beginning matches
var partial   = []; // Inside matches
var entry     = instance.getToken();
var count     = 0;
var existingTags = $('tags').value.split(/\s|,/g);


for (var i = 0; i < instance.options.array.length; i++) {
var t =  instance.options.array[i];
var elem = t;
var foundPos = elem.toLowerCase().indexOf(entry.toLowerCase());
while (foundPos != -1) {
if (foundPos == 0 && elem.length != entry.length && !existingTags.include(t)) {
matches[t] = "<li>" + t + "<span class='informal'></span></li>";
ret.push(t)
break;
}
foundPos = elem.toLowerCase().indexOf(entry.toLowerCase(), foundPos + 1);
}
}


ret.sort(function sortResults(a,b) {
if (instance.options.array[b] - instance.options.array[a] == 0) {
return (b > a ? -1 : 1);
} else {
return instance.options.array[b]-instance.options.array[a]
}
});

var dropDown = '';
for (i=0; i<ret.length; i++) {
dropDown += matches[ret[i]];
}
return "<ul>" + dropDown + "</ul>";
}

function customOnShow(element, update) {
s = update;
s.style.overflow = 'visible'
s.style.height = 'auto';
s.style.width = 'auto';


inviso = document.createElement('div')
inviso.style.top = inviso.style.left = 0
inviso.style.position = 'absolute'; inviso.style.visibility = 'hidden'
inviso.innerHTML = update.innerHTML;
$('tags').parentNode.appendChild(inviso)

var autoCompleteHeight = getY($('tag_choices_container')) + inviso.offsetHeight

if(windowHeight() < autoCompleteHeight) {




s.style.height = '240px'
s.style.overflow = 'auto'
s.scrollTop = 0
if(inviso.clientWidth < inviso.scrollWidth) {
s.style.width = inviso.scrollWidth + (inviso.scrollWidth - inviso.clientWidth) + 'px' // get rid of horizontal scrollbars on ie overflow divs
}
}


inviso = document.createElement('div')
inviso.style.top = inviso.style.left = 0
inviso.style.position = 'absolute'; inviso.style.visibility = 'hidden'
inviso.style.fontSize =  Element.getStyle(element, 'font-size');
inviso.style.fontFamily = Element.getStyle(element, 'font-family');
var text = element.value;
var esc = {'<':'[','>':']',' ':'&nbsp;'}
for(var i in esc) {
text=text.replace(new RegExp(i,'g'), esc[i])
}
inviso.innerHTML = text
$('tags').parentNode.appendChild(inviso)
n = inviso.offsetWidth - 10;

s.style.left = getX(element) + n + 'px' // put dropdown right below current typed tag
if(getX(s) + s.offsetWidth > getX(element) + element.offsetWidth) { // force dropdown to right align to tags input
s.style.left = getX(s) - (getX(s) + s.offsetWidth - getX(element) - element.offsetWidth) + 'px'
}
Effect.Appear(update,{duration:0.15});
}


function processKey(set, messageID) {
var setArray = set.value.split(/\s/i);
var tagArray = document.getElementsByName('tag-'+messageID);

for (var i = 0; i < tagArray.length; i++) {
var exists = false;
for (var j = 0; j < setArray.length; j++) {
if (setArray[j].toLowerCase() == tagArray[i].innerHTML.toLowerCase()) {
exists = true;
break;
}
}

if (exists) {
tagArray[i].className = "jive-tag-selected";
} else {
tagArray[i].className = "jive-tag-unselected";
}
}
}

function swapTag(tag, messageID) {
currentValue = $('tags-' + messageID).value;
recTag = $('recommendedTags-' + tag + '-' + messageID);
popularTag = $('popularTags-' + tag + '-' + messageID);

if ((recTag != undefined && recTag.className == 'jive-tag-selected') ||
(popularTag != undefined && popularTag.className == 'jive-tag-selected')) {

var setArray = currentValue.split(/\s/i);
var val = '';
for (var i = 0; i < setArray.length; i++) {
if (setArray[i].length > 0 && setArray[i] != ' ' && setArray[i].toLowerCase() != tag.toLowerCase()) {
val += setArray[i] + ' ';
}
}
$('tags-' + messageID).value = val;

if (recTag != undefined) {
recTag.className = 'jive-tag-unselected';
}
if (popularTag != undefined) {
popularTag.className = 'jive-tag-unselected';
}
} else {

if (recTag != undefined) {
recTag.className = 'jive-tag-selected';
}
if (popularTag != undefined) {
popularTag.className = 'jive-tag-selected';
}

if (currentValue.length == 0 || currentValue.charAt(currentValue.length - 1) == ' ') {
$('tags-' + messageID).value = $('tags-' + messageID).value + tag;
} else {
$('tags-' + messageID).value = $('tags-' + messageID).value + ' ' + tag;
}
}
}


function windowHeight() { return self.innerHeight || document.documentElement.clientHeight || document.body.clientHeight || 0 }
function windowWidth() { return self.innerWidth || document.documentElement.clientWidth || document.body.clientWidth || 0 }


function getY(o){ var y = 0
if (o.offsetParent) while (o.offsetParent) { y += o.offsetTop; o = o.offsetParent }
return y
}
function getX(o){ var x = 0
if (o.offsetParent) while (o.offsetParent) { x += o.offsetLeft; o = o.offsetParent }
return x
}

function keydown(e) { e=e||window.event
if(Element.visible('tag_choices')) {
switch(e.keyCode) {
case 40:
scrollDropdown()
prevent(e)
break
case 38:
scrollDropdown()
prevent(e)
break
}
}
}

function prevent(e) {
if (window.event) window.event.returnValue = false
else e.preventDefault()
}

function scrollDropdown() {
var amt = Math.ceil((Math.ceil($('tag_choices').offsetHeight - tagHeight) / tagHeight) / 2 )
var scrollTo = (ac.index * tagHeight) - (amt * tagHeight)
$('tag_choices').scrollTop = (scrollTo < 0) ? 0 : scrollTo
}


