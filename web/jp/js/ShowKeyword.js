//使用本JS需要在文本框外层定义1个div，并设置style为"position:relative;"。如果文本框的onkeyup与onblur还要执行其他函数，请将代码定义到名为showkeywordkeyup与showkeywordblur函数中
//服务器代码div项示例：<div id=\"keyworditem" + shu + "\" onmouseover=\"javascript:showkeyworditem=" + shu + ";\" class=\"showkeywordlist\" onclick=\"confirmkeyword('文本框id','自定义关键字列表di','要得到的内容')\"><span style=\" font-weight:900;\">" + 字段列.Replace(Keyword.ToLower(), "</span>" + Keyword.ToLower() + "<span style=\" font-weight:900;\">") + "</span></div>
//showkeyword(文本框id，自定义关键字列表divid，文本框外层divid，AJAX路径，AJAX参数)
var showkeyworditems=0;//项总数
var showkeyworditem=0;//焦点在哪个列表项上
function showkeyword(textid,divid,divinid,ajaxurl,ajaxcs)
{
    var obj_indiv=document.getElementById(divinid);//外层div加入关键字列表样式
    var style='<style type="text/css">.showkeywordlist,.showkeywordlisthover{cursor:pointer;height:20px;line-height:20px;width:100%;background-color:#ffffff;overflow:hidden; font-family:微软雅黑;}';
    style+='.showkeywordlist:hover{background-color:#d5d5d5;}.showkeywordlisthover{background-color:#d5d5d5;overflow:hidden;}</style>';
    obj_indiv.innerHTML+=style;
    
    var xuanzekeyword=0;//鼠标是否在关键字列表div上
    var shangcivalue="";//记录上次输入的值以便判断如果没有改变值则不ajax
    var t=document.getElementById(textid);
    //生成一个div
    if(!document.getElementById(divid))
    {
        var div=document.createElement("div"); 
        div.id = divid;
        div.style.position="absolute";
        div.style.width=t.offsetWidth+"px";
        div.style.left=0+"px";
        div.style.top=t.offsetHeight+"px";
        div.style.border="solid 1px #817f82";
        div.style.zIndex=101;
        div.style.display='none';
        obj_indiv.appendChild(div);
    }
    var obj_search=document.getElementById(divid);
    //按键松开
    t.onkeyup=function()
    {
        var tvalue=t.value;
        if(tvalue!="")
        {
            if(tvalue!=shangcivalue)
            {
                var rand = Math.floor(Math.random() * 1000000);
                var cs = "Keyword="+tvalue+"&n=" + rand+ajaxcs;
                $.ajax({type:"get",url:ajaxurl,data:cs,
                success:function(data)
                {
                    showkeyworditems=data.toString().split(';;;;;')[0];
                    var sss=data.toString().split(';;;;;')[1];
                    obj_search.innerHTML=sss;
                    if(sss!="")
                    {
                        if(obj_search.style.display=='none')
                        {
                            obj_search.style.display='';
                        }
                    }
                    else
                    {
                        if(obj_search.style.display!='none')
                        {
                            obj_search.style.display='none';
                        }
                    }
                }
                });
                shangcivalue=tvalue;
            }
        }
        else
        {
            if(obj_search.style.display!='none')
            {
                obj_search.style.display='none';
            }
        }
        //文本框在松开按键时可能还执行其他事件，外部自定义
        try 
        {  
            if(typeof(eval(showkeywordkeyup))=="function")  
            {
                showkeywordkeyup();
            }
        }
        catch(e){}
    }
    //键盘按下
    t.onkeydown=function(e)
    {
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which;
        if(code==13)
        {
            if(obj_search.style.display!='none')
            {
                if(document.getElementById('keyworditem'+showkeyworditem))
                {
                    document.getElementById('keyworditem'+showkeyworditem).click();
                }
                return false;
            }
            else
            {
                if(typeof(eval(showkeywordkeydown))=="function")  
                {
                    showkeywordkeydown();
                }
            }
        }
        else if(code==38)//上
        {
            if(obj_search.style.display!='none')
            {
                showkeyworditem--;
                if(showkeyworditem<1)
                {
                    showkeyworditem=showkeyworditems;
                }
                changekeyworditem(showkeyworditem);
            }
            else if(obj_search.innerHTML!="")
            {
                obj_search.style.display='';
            }
        }
        else if(code==40)//下
        {
            if(obj_search.style.display!='none')
            {
                showkeyworditem++;
                if(showkeyworditem>showkeyworditems)
                {
                    showkeyworditem=1;
                }
                changekeyworditem(showkeyworditem);
            }
            else if(obj_search.innerHTML!="")
            {
                obj_search.style.display='';
            }
        }
    }
    //失去焦点
    t.onblur=function()
    {
        if(xuanzekeyword==0)//鼠标不在项列表div上
        {
            showkeyworditem=0;
            document.getElementById('div_search').style.display='none';
            //文本框在失去焦点时可能还执行其他事件，外部自定义
            try 
            {  
                if(typeof(eval(showkeywordblur))=="function")
                {
                    showkeywordblur();
                }
            }
            catch(e){}
        }
    }
    obj_search.onmouseover=function()
    {
        xuanzekeyword=1;//鼠标在项列表div上
        changekeyworditem(0);
    }
    obj_search.onmouseout=function()
    {
        xuanzekeyword=0;//鼠标不在项列表div上
        changekeyworditem(0);
    }
}
function confirmkeyword(textid,divid,confirmvalue)//项点击事件
{
    showkeyworditem = 0;
    document.getElementById(textid).value = confirmvalue; 
    document.getElementById(divid).style.display='none';
    //文本框在失去焦点时可能还执行其他事件，外部自定义
    try 
    {  
        if(typeof(eval(showkeywordblur))=="function")
        {
            showkeywordblur();
        }
    }
    catch(e){}
}
function changekeyworditem(shu)//上下键选择事件
{
    for(var i=1;i<showkeyworditems+1;i++)
    {
        if(document.getElementById('keyworditem'+i))
        {
            if(i==shu)
            {
                document.getElementById('keyworditem'+i).className="showkeywordlisthover";
            }
            else
            {
                if(document.getElementById('keyworditem'+i).className=="showkeywordlisthover")
                {
                    document.getElementById('keyworditem'+i).className="showkeywordlist";
                }
            }
        }
    }
}