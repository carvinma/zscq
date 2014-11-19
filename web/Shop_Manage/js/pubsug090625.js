
var suggest_j=-1,tempArr=[],tempSize=10,tempLast,allwordsview='',suggest_div_width,search_input_id,sugTO,sugTO2,sugIsDown=false,sugX,sugY;

var sug_gid=function(node){
	return document.getElementById(node);
}
var sug_gname=function(node){
	return sug_gid("suggest_key").getElementsByTagName(node);
}

function Suggest_Initialize(id,width,x,y)
{
    search_input_id = id;
    if(sug_gid(search_input_id))
    {
       sug_gid(search_input_id).onkeyup =keyup;
       sug_gid(search_input_id).onkeydown = keydown;
       sug_gid(search_input_id).autocomplete = "off";
       document.onclick =hide_suggest;  
       suggest_div_width = width;  
       sugX=(x=="undefined"||x==""?0:x);
       sugY=(y=="undefined"||y==""?0:y);
    }
    Create_Suggest_Div();	
}
function Create_Suggest_Div()
{
    document.write('<div id="suggest_key" class="suggest_key" style="position:absolute;left:0px;top:0px;z-index:10000;background-color:White;" ></div>');
}

function getkeyword()
{
	if(sugTO2) clearTimeout(sugTO2);
	if(escape(sug_gid(search_input_id).value)=="")
        hide_suggest();
	else{
	    var tempI=tempCheck(sug_gid(search_input_id).value);	
	    if(tempI==-1){	  
            var myurl="suggest.asp?"+"keyword="+(sug_gid(search_input_id).value)+"&"+Math.random();			
            invokeServer(myurl);
	        viewkeywords();
        }
        else if(tempI==-2)	    
             hide_suggest();
        else if(tempLast!=sug_gid(search_input_id).value || sug_gid("suggest_key").innerHTML=="" ){
                sug_gid("suggest_key").innerHTML=unescape(tempArr[tempI][1]);
	            viewkeywords();
        }
   }
   if(sugIsDown) {
        tempLast=sug_gid(search_input_id).value;
        sugTO2=window.setTimeout(getkeyword,500); 
   }
}

function tempFill(n,v){
    if(tempArr.length>=tempSize) tempArr.shift();
    tempArr.push([escape(n),escape(v)])
}
function tempCheck(n){
    for(var i=0;i<tempArr.length;i++) {
        var t0=unescape(tempArr[i][0]),t1=unescape(tempArr[i][1]);
        if(t0==n) 
            return i;
        else if(t1=="" && n.indexOf(t0)==0 && n.length>t0.length) 
            return -2;
    }
    return -1;
}

function invokeServer(url)   
{
     var scriptOld=document.getElementById('temp_script');  
     if(scriptOld!=null && document.all)  
     {  
        scriptOld.src = url;   
        return;  
     }  
    var head=document.documentElement.firstChild,script=document.createElement('script');   
    script.id='temp_script';   
    script.type = 'text/javascript';   
    script.src = url;
    if(scriptOld!=null)  
       head.replaceChild(script,scriptOld);   
    else
       head.appendChild(script);
}

function viewkeywords()
{
    var x=getposOffset_Sug(sug_gid(search_input_id),'left');
    var y=getposOffset_Sug(sug_gid(search_input_id),'top');
    var div_obj=sug_gid("suggest_key");
        div_obj.style.left=(x+sugX)+'px';
        div_obj.style.top=(y+sugY)+'px';
        div_obj.style.display="inline";
}

function set_style(num){
    
	for(var i=0;i<sug_gname("li").length;i++){
		var li_node=sug_gname("li")[i];
		li_node.className="";
	}
	if(suggest_j>=0 && suggest_j<sug_gname("li").length){
		var i_node=sug_gname("li")[suggest_j];
		sug_gname("li")[suggest_j].className="select_key";
		sug_gname("li")[suggest_j].style.width=suggest_div_width+"px";
		}
	}
function mo(nodevalue){
	suggest_j=nodevalue;
	set_style(suggest_j);
}
function form_submit(){
	if(suggest_j>=0 && suggest_j<sug_gname("li").length) 
	    sug_gid(search_input_id).value=sug_gname("li")[suggest_j].childNodes[0].nodeValue;
	//searchsubmit();
	sug_gid('search_btn').click()
}
function hide_suggest(){
	var nodes=document.body.childNodes
	for(var i=0;i<nodes.length;i++){
		if(nodes[i]!=sug_gid(search_input_id)) sug_gid("suggest_key").innerHTML="";
		}
	}
	
	

function keyup(e)
{
    sugIsDown=false;
}	
function keydown(e){
	var keyc;
	if(window.event){
		keyc=event.keyCode;
		}
	else if(e.which){
		keyc=e.which;
		}
	if(keyc!=40&&keyc!=38){
	if(sugTO) clearTimeout(sugTO);
	sugTO = setTimeout(getkeyword,300);
	sugIsDown=true;
	}
	if(keyc==40 || keyc==38){
	if(keyc==40){
		if(suggest_j<sug_gname("li").length){
			suggest_j++;
			if(suggest_j>=sug_gname("li").length) suggest_j=-1;
			
		}
		if(suggest_j>=sug_gname("li").length) suggest_j=-1;
	}
	if(keyc==38){
		if(suggest_j>=0){
			suggest_j--;
			if(suggest_j<=-1) suggest_j=sug_gname("li").length;
		}
		else
			suggest_j=sug_gname("li").length-1;
		
	}
	set_style(suggest_j);
	if(suggest_j>=0 && suggest_j<sug_gname("li").length)
		sug_gid(search_input_id).value=sug_gname("li")[suggest_j].childNodes[0].nodeValue;
	else{
		//sug_gid(search_input_id).value=temp_str;
		}
	}
}
//

function getposOffset_Sug(what, offsettype)
{ 
    var totaloffset=(offsettype=="left")? what.offsetLeft : what.offsetTop; 
    var parentEl=what.offsetParent; 
    while (parentEl!=null)
    { 
        totaloffset=(offsettype=="left")? totaloffset+parentEl.offsetLeft : totaloffset+parentEl.offsetTop; 
         parentEl=parentEl.offsetParent; 
    } 
    return totaloffset; 
}
