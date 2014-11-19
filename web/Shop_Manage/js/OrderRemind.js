//以下为非IE6下执行的弹出提醒
var juli=-80;
var juli2=0;
var tl=0;
function txxs()
{
	if(juli!=-5)
	{
	    setTimeout("txxs()",10);//1秒
	}
	else
	{
	    setTimeout("txyc()",10000);
	}
    document.getElementById("ddtx").style.bottom=(juli+5)+'px';
    juli=juli+5;
}
function txyc()
{
    if(juli2!=-75)
    {
        setTimeout("txyc()",10);
    }
    else
    {
        document.getElementById("ddtx").style.display="none";
    }
    if(tl==0)
    {
        document.getElementById("ddtx").style.bottom=(juli2-5)+'px';
        juli2=juli2-5;
	}
}
function gb(zt)//鼠标是否正在提示框上
{
    tl=zt;
}
//以下为IE6下执行的弹出提醒
var jj=0;
var isIE=window.XMLHttpRequest?false:true;
var kj=document.documentElement.clientHeight;
if(isIE)
{
    document.getElementById("ddtx").style.top=kj+'px';
    window.onscroll=divIE6;
}
function divIE6()
{
    var top1=document.documentElement.scrollTop;
    document.getElementById("ddtx").style.top=(top1+kj+jj)+'px';
}
function divshow()
{
    if(jj==-75)
    {
        setTimeout("divnone()",10000);
    }
    else
    {
        setTimeout("divshow()",10);
    }
    var top2=document.documentElement.scrollTop;
    jj=jj-5;
    document.getElementById("ddtx").style.top=(top2+kj+jj)+'px';
}
function divnone()
{
    if(jj==0)
    {
        document.getElementById("ddtx").style.display="none";
    }
    else
    {
        setTimeout("divnone()",10);
    }    
    if(tl==0)
    {
        jj=jj+5;
        var top3=document.documentElement.scrollTop;
        document.getElementById("ddtx").style.top=(top3+kj+jj)+'px';
    }
}