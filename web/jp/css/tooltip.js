/*================================
	Tooltip
==================================*/
var tooltipPopup;
var tooltipContent;
var tooltipShim;
var tempPos;
var tempTitle;

$J(document).ready(function () {
    tooltipPopup = $J('#tooltip')[0];
    tooltipShim = $J('#tooltipShim')[0];
    tooltipContent = $J('.tooltipContent', tooltipPopup)[0];
    $J(tooltipPopup).css({ 'display': 'block', 'opacity': '0' });


    $J('.tooltip').hover(function () {
        tempTitle = $J(this).attr('title');
        if ($J(this).parent().hasClass('alphaGrid')) {
            //Is the alphabet selector link so use custom html
            temp = "<span class='letter'>" + $J(this).html() + "</span><br /><span class='productCount'>" + $J(this).attr('title') + "</span>";
        } else {
            //Normal tooltip, just use the title
            temp = $J(this).attr('title');
        }

        $J(tooltipContent).html(temp);
        $J(this).attr('title', '');

        //Position left
        temp = $J(this).css('padding-left');
        temp = temp.substr(0, temp.length - 2);
        temp = parseInt(temp);

        tempPos = getAbsoluteLeft(this) + ($J(this)[0].offsetWidth / 2) - ($J(tooltipPopup)[0].offsetWidth / 2);

        //Re-adjust the tip if it forces horizontal scroll
        if (tempPos + $J(tooltipPopup)[0].offsetWidth > $J(window).width()) {
            diff = (tempPos + $J(tooltipPopup)[0].offsetWidth) - $J(window).width();
            tempPos -= diff;
            diff = diff + 76;
            $J('.tooltipTip', tooltipPopup).css('left', diff + 'px');

        } else if (tempPos < 0) {
            diff = 0 - tempPos;
            tempPos = 0;
            diff = 76 - diff;
            $J('.tooltipTip', tooltipPopup).css('left', diff + 'px');


        } else $J('.tooltipTip', tooltipPopup).css('left', '76px');

        $J(tooltipPopup).css('left', tempPos + 'px');
        if (typeof document.body.style.maxHeight === "undefined") $J(tooltipShim).css('left', tempPos + 'px');

        //Position top
        if ($J(this).hasClass('beamItem')) tempPos = getAbsoluteTop(this) + 8 - ($J(tooltipPopup)[0].offsetHeight) - 1;
        else tempPos = getAbsoluteTop(this) - ($J(tooltipPopup)[0].offsetHeight) - 1;



        $J(tooltipPopup).css('top', tempPos + 'px');
        $J(tooltipShim).css('top', tempPos + 'px');

        temp = $J(tooltipPopup)[0].offsetHeight;

        if (typeof document.body.style.maxHeight === "undefined") $J(tooltipShim).css('height', temp + 'px');



        //Fade        
        $J(tooltipPopup).stop().fadeTo('normal', 1.0);

    }, function () {
        //Fade out
        $J(tooltipPopup).stop().fadeTo('fast', 0.0, function () { $J(tooltipPopup).css('left', '-4000px'); $J(tooltipShim).css('left', '-4000px'); });

        if ($J(this).parent().hasClass('alphaGrid')) {
            //Return alphabet selector title
            temp = $J(tooltipContent).html();
            temp = temp.substr(temp.indexOf('('), temp.length);
            temp = temp.substr(0, temp.indexOf('<'));
        } else {
            //Return normal title
            temp = $J(tooltipContent).html();
        }
        //$J(this).attr('title', temp);
        $J(this).attr('title', tempTitle);
    });
});
