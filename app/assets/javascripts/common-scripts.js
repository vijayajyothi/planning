
var Script = function () {

//    sidebar dropdown menu

jQuery('#sidebar .sub-menu > a').click(function () {
  var last = jQuery('.sub-menu.open', $('#sidebar'));
  last.removeClass("open");
  jQuery('.arrow', last).removeClass("open");
  jQuery('.sub', last).slideUp(200);
  var sub = jQuery(this).next();
  if (sub.is(":visible")) {
    jQuery('.arrow', jQuery(this)).removeClass("open");
    jQuery(this).parent().removeClass("open");
    sub.slideUp(200);
  } else {
    jQuery('.arrow', jQuery(this)).addClass("open");
    jQuery(this).parent().addClass("open");
    sub.slideDown(200);
  }
  var o = ($(this).offset());
  diff = 200 - o.top;
  if(diff>0)
    $(".sidebar-scroll").scrollTo("-="+Math.abs(diff),500);
  else
    $(".sidebar-scroll").scrollTo("+="+Math.abs(diff),500);
});

//    sidebar toggle

$('.icon-reorder').click(function () {
  if ($('#sidebar > ul').is(":visible") === true) {
    $('#main-content').css({
      'margin-left': '0px'
    });
    $('#sidebar').css({
      'margin-left': '-180px'
    });
    $('#sidebar > ul').hide();
    $("#container").addClass("sidebar-closed");
  } else {
    $('#main-content').css({
      'margin-left': '180px'
    });
    $('#sidebar > ul').show();
    $('#sidebar').css({
      'margin-left': '0'
    });
    $("#container").removeClass("sidebar-closed");
  }
});

// custom scrollbar
$(".sidebar-scroll").niceScroll({styler:"fb",cursorcolor:"#4A8BC2", cursorwidth: '5', cursorborderradius: '0px', background: '#404040', cursorborder: ''});

$(".portlet-scroll-1").niceScroll({styler:"fb",cursorcolor:"#4A8BC2", cursorwidth: '5', cursorborderradius: '0px', background: '#404040', cursorborder: ''});

$(".portlet-scroll-2").niceScroll({styler:"fb",cursorcolor:"#4A8BC2", cursorwidth: '5', cursorborderradius: '0px', autohidemode: false, cursorborder: ''});

$(".portlet-scroll-3").niceScroll({styler:"fb",cursorcolor:"#4A8BC2", cursorwidth: '5', cursorborderradius: '0px', background: '#404040', autohidemode: false, cursorborder: ''});

$("html").niceScroll({styler:"fb",cursorcolor:"#4A8BC2", cursorwidth: '8', cursorborderradius: '0px', background: '#404040', cursorborder: '', zindex: '1000'});


// theme switcher

var scrollHeight = '60px';
jQuery('#theme-change').click(function () {
  if ($(this).attr("opened") && !$(this).attr("opening") && !$(this).attr("closing")) {
    $(this).removeAttr("opened");
    $(this).attr("closing", "1");

    $("#theme-change").css("overflow", "hidden").animate({
      width: '20px',
      height: '22px',
      'padding-top': '3px'
    }, {
      complete: function () {
        $(this).removeAttr("closing");
        $("#theme-change .settings").hide();
      }
    });
  } else if (!$(this).attr("closing") && !$(this).attr("opening")) {
    $(this).attr("opening", "1");
    $("#theme-change").css("overflow", "visible").animate({
      width: '226px',
      height: scrollHeight,
      'padding-top': '3px'
    }, {
      complete: function () {
        $(this).removeAttr("opening");
        $(this).attr("opened", 1);
      }
    });
    $("#theme-change .settings").show();
  }
});

jQuery('#theme-change .colors span').click(function () {
  var color = $(this).attr("data-style");
  setColor(color);
});

jQuery('#theme-change .layout input').change(function () {
  setLayout();
});

var setColor = function (color) {
  $('#style_color').attr("href", "css/style-" + color + ".css");
}

// widget tools

jQuery('.widget .tools .icon-chevron-down').click(function () {
  var el = jQuery(this).parents(".widget").children(".widget-body");
  if (jQuery(this).hasClass("icon-chevron-down")) {
    jQuery(this).removeClass("icon-chevron-down").addClass("icon-chevron-up");
    el.slideUp(200);
  } else {
    jQuery(this).removeClass("icon-chevron-up").addClass("icon-chevron-down");
    el.slideDown(200);
  }
});

jQuery('.widget .tools .icon-remove').click(function () {
  jQuery(this).parents(".widget").parent().remove();
});

//    tool tips

$('.element').tooltip();

$('.tooltips').tooltip();

//    popovers

$('.popovers').popover();

// scroller

$('.scroller').slimscroll({
  height: 'auto'
});



}();

function CheckNumericKeyInfo(char1, mozChar) {
  if (mozChar != null) { // Look for a Mozilla-compatible browser
    if ((mozChar >= 48 && mozChar <= 57) || char1 == 8)
      RetVal = true;
    else {
      RetVal = false;
    }
  }
  else { // Must be an IE-compatible Browser
    if ((char1 >= 48 && char1 <= 57) || char1 == 8) RetVal = true;
    else {
      RetVal = false;
    }
  }
  return RetVal;
}


function onlyNumbersCompat(chr){
 console.log(chr);
 return !(chr > 31 && (chr < 48 || chr > 57))
}

function onlyNumbers(evt)
{
  var e = event || evt; // for trans-browser compatibility
  var charCode = e.which || e.keyCode;
  if ((charCode > 45 && charCode < 58) || charCode == 8){  
    return true;  
  }  
  return false;
}

function compareintrest()
{
  if($('#min_int').val()>=$('#max_int').val() ){
    $('#min_int').val("")
    alert("Minimum interest should not exceed maximum interest and should not be equal")
  }
}

function maxthree(event)
{

  var keyCode = (event.which) ? event.which : event.keyCode // Browser compatability
  if (keyCode==8 ||keyCode==46)
  {
    return true;
  }
  // accept only chars
  if($('#currency_cur_code').val().length>2)
    return false;
  if ((keyCode > 64 && keyCode < 91) || (keyCode > 96 && keyCode < 123) || keyCode == 8)
   return true;
}

function onlyDotsAndNumbers(event) {
  var charCode = (event.which) ? event.which : event.keyCode
  if (charCode == 46) {
    return true;
  }
  if (charCode > 31 && (charCode < 48 || charCode > 57))
    return false;
  
  return true;
}

function onlyAlphabets(e, t) {
  try {

    if (window.event) {
      var charCode = window.event.keyCode;
    }
    else if (e) {
      var charCode = e.which;
    }
    else { return true; }
    if(charCode == 8 || charCode == 0)
        {
             return;
        }
    if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
      return true;
    else
      return false;
  }
  catch (err) {
  }
}

// function phone_number_is_valid(val) {
    // alert(return (eregi('^(?:\([2-9]\d{2}\)\ ?|[2-9]\d{2}(?:\-?|\ ?))[2-9]\d{2}[- ]?\d{4}$', val));)
// }