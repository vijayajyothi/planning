!function(t){"use strict";t.tablesorter.addWidget({id:"cssStickyHeaders",priority:10,options:{cssStickyHeaders_offset:0,cssStickyHeaders_addCaption:!1,cssStickyHeaders_attachTo:null,cssStickyHeaders_filteredToTop:!0,cssStickyHeaders_zIndex:10},init:function(e,i,s,n){var r=t(n.cssStickyHeaders_attachTo),a=".cssstickyheader",o=s.$table.children("thead"),l=s.$table.find("caption"),h=r.length?r:t(window);h.bind("scroll resize ".split(" ").join(a+" "),function(){var t=r.length?r.offset().top:h.scrollTop(),e=n.cssStickyHeaders_addCaption?l.outerHeight(!0)+(parseInt(s.$table.css("padding-top"),10)||0)+(parseInt(s.$table.css("border-spacing"),10)||0):0,i=s.$table.height()-o.height()-(s.$table.find("tfoot").height()||0)-e,a=t-o.offset().top+(parseInt(s.$table.css("border-top-width"),10)||0)+(n.cssStickyHeaders_offset||0)+e,c=a>0&&i>=a?a:0,d=o.children().children();n.cssStickyHeaders_addCaption&&(d=d.add(l)),d.css({position:"relative","z-index":n.cssStickyHeaders_zIndex,transform:0===c?"":"translate(0px,"+c+"px)","-ms-transform":0===c?"":"translate(0px,"+c+"px)","-webkit-transform":0===c?"":"translate(0px,"+c+"px)"})}),s.$table.bind("filterEnd",function(){n.cssStickyHeaders_filteredToTop&&window.scrollTo(0,s.$table.position().top)})},remove:function(e,i){var s=".cssstickyheader";t(window).unbind("scroll resize ".split(" ").join(s+" ")),i.$table.unbind("update updateAll ".split(" ").join(s+" ")).children("thead, caption").css({position:"","z-index":"",transform:"","-ms-transform":"","-webkit-transform":""})}})}(jQuery);