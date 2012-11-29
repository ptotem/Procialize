$(document).bind("mobileinit", function () {
    $.mobile.pushStateEnabled = true;
});
 
$(function () {
    var menuStatus;

    // Show menu
    $("a.showMenu").click(function () {
        if (menuStatus != true) {
            $(".ui-page-active").animate({
                marginLeft: "165px"
            }, 300, function () {
                menuStatus = true
            });
            return false;
        } else {
            $(".ui-page-active").animate({
                marginLeft: "0px"
            }, 300, function () {
                menuStatus = false
            });
            return false;
        }
    });


    $('#menu, .pages').live("swipeleft", function () {
        if (menuStatus) {
            $(".ui-page-active").animate({
                marginLeft: "0px"
            }, 300, function () {
                menuStatus = false
            });
        }
    });

    $('.pages').live("swiperight", function () {
        if (!menuStatus) {
            $(".ui-page-active").animate({
                marginLeft: "165px"
            }, 300, function () {
                menuStatus = true
            });
        }
    });

    $('div[data-role="page"]').live('pagebeforeshow', function (event, ui) {
        menuStatus = false;
        $(".pages").css("margin-left", "0");
    });

    // Menu behaviour
    $("#menu li a").click(function () {
        var p = $(this).parent();
        if ($(p).hasClass('active')) {
            $("#menu li").removeClass('active');
        } else {
            $("#menu li").removeClass('active');
            $(p).addClass('active');
        }
    });
});



$(document).bind("mobileinit", function right() {
    $.mobile.pushStateEnabled = true;
});

$(function right(){
    var menuStatus1;

    $("a.showMenu1").click(function(){
        if(menuStatus1 != true){
            $(".ui-page-active").animate({
                width: "60%",
            }, 300, function(){menuStatus1 = true});
            return false;
        } else {
            $(".ui-page-active").animate({
                width: "100%",
            }, 300, function(){menuStatus1 = false});
            return false;
        }
    });

    $('.pages').live("swiperight", function(){
        if (menuStatus1){
            $(".ui-page-active").animate({
                width: "100%",
            }, 300, function(){menuStatus1 = false});
        }
    });

    $('.pages').live("swipeleft", function(){
        if (!menuStatus1){
            $(".ui-page-active").animate({
                width: "60%",
            }, 300, function(){menuStatus1 = true});
        }
    });

    $("#menu1 li a").click(function(){
        var p = $(this).parent();

        if($(p).hasClass('active')){
            $("#menu1 li").removeClass('active');
        } else {
            $("#menu1 li").removeClass('active');
            $(p).addClass('active');
        }
    });

});
