/*================================
Common functions
==================================*/
var otherMemberGoals = [];
var currentOtherMemberGoal = 0;
var blank = new Image();

var addThisHoverTimeout;

blank.src = '/Standard.Website/Images/Common/blank.gif';

$J(document).ready(function() {
    var badBrowser = (/MSIE ((5\.5)|6)/.test(navigator.userAgent) && navigator.platform == "Win32");

    //Find if ie6 and check all images for png's
    if (badBrowser) {
        $J('img.pngFix, .pngFix img, .largeCommIcon img, img[src$=.png]').each(function() {
            if (!this.complete) this.onload = function() { fixPng(this) };
            else fixPng(this);
        });
    }

    /*================================
    Input Button Rollovers
    ==================================*/

    //Send btn
    //=====================// 
    $J('input.btnSendSubmit').hover(function() {
        $J(this).addClass('btnSendSubmitOver');
    }, function() {
        $J(this).removeClass('btnSendSubmitOver');
    });


    //Send Report btn
    //=====================// 
    $J('input.btnSendReport').hover(function() {
        $J(this).addClass('btnSendReportOver');
    }, function() {
        $J(this).removeClass('btnSendReportOver');
    });

    //Join Community btn
    //=====================// 
    $J('input.btnJoinCommunity').hover(function() {
        $J(this).addClass('btnJoinCommunityOver');
    }, function() {
        $J(this).removeClass('btnJoinCommunityOver');
    });

    //Browse btn
    //=====================// 
    $J('input.btnBrowse').hover(function() {
        $J(this).addClass('btnBrowseOver');
    }, function() {
        $J(this).removeClass('btnBrowseOver');
    });

    //Create Group btn
    //=====================// 
    $J('input.btnCreateGroup').hover(function() {
        $J(this).addClass('btnCreateGroupOver');
    }, function() {
        $J(this).removeClass('btnCreateGroupOver');
    });

    //Update Results btn
    //=====================// 
    $J('input.btnUpdateResults').hover(function() {
        $J(this).addClass('btnUpdateResultsOver');
    }, function() {
        $J(this).removeClass('btnUpdateResultsOver');
    });

    //Personal goal field
    //=====================//
    $J('.personalGoal a.editProfileGoal').click(function() {
        parentObj = $J(this).parent();
        if ($J(parentObj).hasClass('editableGoal') == false) {
            $J(parentObj).addClass('editableGoal');
            $J('input', parentObj).focus();

            $J(this).blur();
            return false;
        }
    });

    $J('.personalGoal .goalTextField').blur(function() {
        if ($J(this).val() == '') {
            $J(this).next().addClass('requiredGoal');
        }
        else {
            $J(this).next().removeClass('requiredGoal');
        }
    });

    $J('.personalGoal .saveProfileGoal').click(function(e) {
        if ($J.trim($J('.personalGoal .goalTextField').val()) == '') {
            return false;
        }
    });

    /*
    //CONFLICT WITH SAVE BTN
    $J('.personalGoal input').blur(function() {
    parentObj = $J(this).parent();

    	if ($J(this).val() != "") $J('span', parentObj).html($J(this).val());
    else $J('span', parentObj).html('Enter your goal here');

    	$J(parentObj).removeClass('editableGoal');
    });*/

    $J('.personalGoal input').each(function() {
        parentObj = $J(this).parent();

        if ($J(this).val() != "") $J('span.defaultGoal', parentObj).html($J(this).val());
        else $J('span.defaultGoal', parentObj).html('Enter your goal here');
    });

    //Alternate views contact form
    //=================================// 
    if ($J('select.enquiryType').length > 0) {
        $J('select.enquiryType').change(function() {
            updateEnquiryForm();
        });
        updateEnquiryForm();
    }

    //Share this button
    //=====================//
    $J('.addthis_toolbox').css({ opacity: 0 });

    $J('.optionsBar a.shareThis').hover(function() {
        var tempPosLeft = getAbsoluteLeft(this);
        var tempPosTop = getAbsoluteTop(this);

        //Panel Position
        $J('.addthis_toolbox').css({ display: 'block',
            left: tempPosLeft - 12 + 'px',
            top: tempPosTop + this.offsetHeight - 3 + 'px'
        }).stop().fadeTo("fast", 1.0);

        tempHeight = $J('.addthis_toolbox')[0].offsetHeight;

        //Position the shim underneath      
        $J('.addThisShim').css({ opacity: 0 });
        $J('.addThisShim').css({ left: tempPosLeft - 12 + 'px',
            top: tempPosTop + this.offsetHeight - 3 + 'px',
            height: tempHeight + 'px'
        });

        enterAddThis();

    }, function() {
        exitAddThis();
    });

    $J('.addthis_toolbox').hover(function() {
        enterAddThis();
    }, function() {
        exitAddThis();
    })


    //Expandable Community list
    //========================================================================================================================================
    $J('a.viewAllCommunityLink').click(function() {
        parentObj = $J(this).parent().parent();

        if ($J(this).html() == 'View all') {
            $J('.hiddenItem', parentObj).css('display', 'block');
            $J(this).html('Hide');
        } else {
            $J('.hiddenItem', parentObj).css('display', 'none');
            $J(this).html('View all');
        }

        $J(this).blur();
        return false;
    });


    //Other member goals
    //========================================================================================================================================
    otherMemberGoals = $J('div.otherMemberGoals p.speechBubble');                   //Build array
    if ($J(otherMemberGoals[0])) {
        $J(otherMemberGoals[0]).css('display', 'block');    //Show first

        //Set click events
        $J('div.otherMemberGoals a.prevMemberGoal').click(function() {
            if (currentOtherMemberGoal > 0) currentOtherMemberGoal--;
            else currentOtherMemberGoal = otherMemberGoals.length - 1;

            $J('div.otherMemberGoals p.speechBubble').css('display', 'none');       //hide all
            $J(otherMemberGoals[currentOtherMemberGoal]).css('display', 'block');   //show current

            $J(this).blur();
            return false;
        });

        $J('div.otherMemberGoals a.nextMemberGoal').click(function() {
            if (currentOtherMemberGoal < otherMemberGoals.length - 1) currentOtherMemberGoal++;
            else currentOtherMemberGoal = 0;

            $J('div.otherMemberGoals p.speechBubble').css('display', 'none');       //hide all
            $J(otherMemberGoals[currentOtherMemberGoal]).css('display', 'block');   //show current

            $J(this).blur();
            return false;
        });

    } else {
        //hide prev/ next
        $J('div.otherMemberGoals .setYourGoal span').css('display', 'none');
    }


    //Table formatting
    //========================================================================================================================================
    $J('.productAccordion .accordion table').each(function() {
        curTable = $J(this);
        formatTable(curTable);
    });

    $J('div#innerLeftColumn table').each(function() {
        curTable = $J(this);
        formatTable(curTable);
    });


    //File uploader hidden  
    //========================================================================================================================================

    $J('.panelFull span.orangeArrowBtn').mouseenter(function() {
        $J(this).addClass('orangeArrowBtnHover');
    });

    $J('.panelFull span.orangeArrowBtn').mouseleave(function() {
        $J(this).removeClass('orangeArrowBtnHover');
    });


    $J('.panelFull .browseImageContainer .clickUploadBtn').mousemove(function(e) {
        moveFileUpload(e);
    });

    $J('.panelFull .browseImageContainer .fileUploadContainer').mousemove(function(e) {
        moveFileUpload(e);
    });

    //Goal upload button script
    $J('.orangeArrowBtn.thumbUploadBtn').hide();
    $J('.fileUploader').change(function() {
        $J('.orangeArrowBtn.thumbUploadBtn').show();

        $J('.fileUploadContainer').css({
            top: -4000 + "px",
            left: -4000 + "px"
        });
        $J(theBtn).removeClass('orangeArrowBtnHover');
    });

});


function moveFileUpload(e) {
    theBtn = $J('.panelFull .browseImageContainer .clickUploadBtn')[0]
    parentObj = $J(theBtn).parent();
    fileInput = $J('.fileUploadContainer', parentObj)[0];
    fileInputField = $J('input', fileInput)[0];
    uploadButtonTop = getAbsoluteTop($J(theBtn));
    uploadButtonLeft = getAbsoluteLeft($J(theBtn));

    uploadMarginTop = 20;

    fileTop = e.pageY - uploadButtonTop - (fileInput.offsetHeight / 2) + uploadMarginTop;


    fileLeft = (e.pageX - uploadButtonLeft) - (fileInputField.offsetWidth / 2) - 70;


    if (e.pageX < uploadButtonLeft || e.pageX > uploadButtonLeft + theBtn.offsetWidth || e.pageY < uploadButtonTop || e.pageY > (uploadButtonTop + theBtn.offsetHeight)) {
        $J(fileInput).css({
            top: -4000 + "px",
            left: -4000 + "px"
        });
        $J(theBtn).removeClass('orangeArrowBtnHover');

    } else {
        $J(fileInput).css({
            left: fileLeft + "px",
            top: fileTop + "px"
        });
        $J(theBtn).addClass('orangeArrowBtnHover');
    }
}


function formatTable(focusTable) {
    $J(focusTable).addClass('alternatingTable');

    var tableRows = $J('tr', focusTable);

    for (p = 0; p < tableRows.length; p++) {
        if (p % 2 != 0) $J(tableRows[p]).addClass('alt')

        var tableCols = $J('td', tableRows[p]);

        for (q = 0; q < tableCols.length; q++) {
            if (q != 0) $J(tableCols[q]).addClass('value');
        }
    }
}


function updateEnquiryForm() {

    if ($J('select.enquiryType').length > 0) {
        temp = $J('select.enquiryType')[0];

        if ($J(temp).val() == 'Product complaints') {
            $J('.subjectEnquiry').css('display', 'block');
            $J('.productEnquiry').css('display', 'block');
            $J('.technicalEnquiry').css('display', 'none');

        } else if ($J(temp).val() == 'Website technical problems') {
            $J('.subjectEnquiry').css('display', 'none');
            $J('.productEnquiry').css('display', 'none');
            $J('.technicalEnquiry').css('display', 'block');

        } else {
            $J('.subjectEnquiry').css('display', 'block');
            $J('.productEnquiry').css('display', 'none');
            $J('.technicalEnquiry').css('display', 'none');

        }
    }
}

function enterAddThis() {
    if (addThisHoverTimeout) clearTimeout(addThisHoverTimeout);
}

function exitAddThis() {
    //Set Time delay to hide dropdown and hover state
    addThisHoverTimeout = setTimeout(function() {
        $J('.addthis_toolbox').stop().fadeTo("fast", 0.0, function() {
            $J('.addthis_toolbox').css('left', '-40000px');
            $J('.addThisShim').css('left', '-40000px');
        });
    }, 150);
}

/* Fire Popup Window */
function openPopup(url, width, height) {
    var centerX;
    var centerY;

    //half the screen width minus half the new window width (plus 5 pixel borders).
    centerX = (window.screen.width / 2) - ((width / 2) + 30);
    centerY = (window.screen.height / 2) - ((height / 2) + 50);

    window.open(url, 'popupWindow', 'toolbar=0, scrollbars=1, location=0, statusbar=0, menubar=0, resizable=1, width=' + width + ',height=' + height + ',left=' + centerX + ',top=' + centerY);
}


/*Png fix*/
function fixPng(png) {
    var src = png.src;

    //No manual height and width set
    if (!png.style.width && $J(png).css('width') == 'auto') png.style.width = $J(png)[0].offsetWidth + "px";
    if (!png.style.height && $J(png).css('height') == 'auto') png.style.height = $J(png)[0].offsetHeight + "px";

    // replace by blank image
    png.onload = function() { };
    png.src = blank.src;
    png.runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + src + "',sizingMethod='scale')";
}


/* Common positioning functions */
function getAbsoluteLeft(focusObject) {
    // Get an object left position from the upper left viewport corner
    o = $J(focusObject)[0];
    oLeft = o.offsetLeft;
    while (o.offsetParent != null) {
        oParent = o.offsetParent;
        oLeft += oParent.offsetLeft;
        o = oParent;
    }
    return oLeft;
}

function getAbsoluteTop(focusObject) {
    // Get an object top position from the upper left viewport corner
    o = $J(focusObject)[0];
    oTop = o.offsetTop;
    while (o.offsetParent != null) {
        oParent = o.offsetParent;
        oTop += oParent.offsetTop;
        o = oParent;
    }
    return oTop;
}

