function yidong(objid,objtitleid)
{    
    var obj = document.getElementById(objid);
    var leftmain=document.documentElement.clientWidth-obj.style.width.replace("px","");//left最大值页面宽-div宽
    obj.style.left=(leftmain/2)+'px';//居中
    var objtitle = document.getElementById(objtitleid);
    var sx=0;//鼠标与div左边距的距离
    var sy=0;//鼠标与div上边距的距离
    objtitle.onmousedown=function(ed)
    {
        document.onselectstart = function(){return false;}//不选择页面文字
        var top1=document.documentElement.scrollTop+document.body.scrollTop;//页面出现被卷去的高，代码中未用到
        var l=window.event||ed;
        sx=l.clientX-obj.offsetLeft;
        sy=l.clientY-obj.offsetTop;
        document.onmousemove = function(em)
        {
        	l=window.event||em;
            var Left = l.clientX - sx;
            var Top = l.clientY - sy;
            if (Left<10)
            {
                Left=0;
            }
            if(Left>leftmain-10)
            {
                Left=leftmain;
            }
            if (Top<10)
            {
                Top=0;
            }
            obj.style.left = Left + "px";
            obj.style.top = Top + "px";
        }
        document.onmouseup = function()
        {
            document.onmousemove = null;
            document.onmouseup = null;
            document.onselectstart = function(){return true;}//选择页面文字
        };
        return false;
    }
}