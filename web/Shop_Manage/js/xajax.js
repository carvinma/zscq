/********************************************************
 * Ajax类
 * 返回值用回调函数可多次使用ajax加载
 ********************************************************/
    XAjax = function(){
        var http_request = false;
        var result = "";
        this.init = function(){
            http_request = false;
            if (window.XMLHttpRequest) { // Mozilla, Safari,...
                http_request = new XMLHttpRequest();
            }
            else 
                if (window.ActiveXObject) { // IE
                    try {
                        http_request = new ActiveXObject("Msxml2.XMLHTTP");
                    } 
                    catch (e) {
                        try {
                            http_request = new ActiveXObject("Microsoft.XMLHTTP");
                        } 
                        catch (e) {
							alert("Can't Creat AJAX Object!");
							return false;
                        }
                    }
                }
        }
        this.get = function(url, callback){
			this.init();
            http_request.onreadystatechange = function(){
                if (http_request.readyState == 4) {
                    if (http_request.status == 200) {
                        result = http_request.responseText;
                        try {
                            callback(result);
                        } 
                        catch (e) {
							alert("The CallBack Method Wrong!"+e);
							return false;
                        
                        }
                    }
                }
            };
            http_request.open('GET', url, true);
            http_request.send(null);
        }
    }