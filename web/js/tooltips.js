//需要引入jquery 类库
//调用：<input class="tooltip" tips="&nbsp;&nbsp;&nbsp;&nbsp;内容<B><font color=red>?</font>" />
$(function () {
  if (document.getElementById("tooltipshow") == null || document.getElementById("tooltipshow") == "underfind") {
    $(function () {
      $('<div class="tooltipshow" style="position: absolute; background-color: White; width: auto; height: auto; border: 1px solid gray; display: none; z-index:1; filter: progid:DXImageTransform.Microsoft.Shadow(color=#999999,direction=135,strength=3); left: 0; top: 0;"></div>').appendTo("body");
    });
  }
  $(".tooltip").mousemove(function (e) {
    var tipscon = $(this).attr("tips");
    if ($.trim(tipscon) != "") {
      //鼠标移入
      var leftpos = e.pageX;
      var toppos = e.pageY;
      $(".tooltipshow").html(tipscon).css({ top: toppos + 10, left: leftpos + 10 }).show();
    }
  }).mouseout(function (e) {
    //鼠标移出
    $(".tooltipshow").html("").css({ top: 0, left: 0 }).hide();
  });
})