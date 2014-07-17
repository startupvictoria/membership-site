$(document).ready(function()
{   
/***************************************************
    MENU
***************************************************/
makeNavHover();
makeSlider();
});


function makeNavHover() {
    jQuery('ul.nav li.dropdown').hover(function ()
    {
        jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn();
        jQuery('a').hover(function() {
            var height = jQuery(this).offset();
            jQuery(this).parent().find('.sub-menu').css('top', height.top - +106);
        });
    }, function (){
        jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut();      
    });
}

var revapi;
function makeSlider () { 
    revapi = jQuery('.fullwidthbanner').revolution(
    {
        delay:9000,
        startwidth:1170,
        startheight:600,
        fullWidth:"on",
        onHoverStop:"on" ,
        touchenabled:"on"
    });
}
        
        