/*
 * StaticRow widget for jQuery TableSorter 2.0
 * Version 1.2 - modified by Rob Garrison (6/28/2014 for tablesorter v2.16.1-beta+)
 * Requires:
 *  jQuery v1.4+
 *  tablesorter plugin, v2.8+, available at http://mottie.github.com/tablesorter/docs/
 *
 * Copyright (c) 2011 Nils Luxton
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/mit-license.php
 *
 */
!function(t){"use strict";var e=t.tablesorter,i="staticRowsRefresh updateComplete ".split(" ").join(".tsstaticrows "),s=function(e){var i,s,n,r,a,o=e.config;o&&(s=o.widgetOptions,o.$tbodies.each(function(){i=t(this).children(),a=i.length,i.filter(s.staticRow_class).each(function(){i=t(this),r=i.data(s.staticRow_index),"undefined"!=typeof r?(n=parseFloat(r),r=/%/.test(r)?Math.round(n/100*a):n):r=i.index(),i.data(s.staticRow_data,r)})}))};e.addWidget({id:"staticRow",options:{staticRow_class:".static",staticRow_data:"static-index",staticRow_index:"row-index"},init:function(t,e,n){s(t),n.$table.unbind(i).bind(i,function(){s(t),n.$table.trigger("applyWidgets")})},format:function(e,i,s){var n,r,a,o,l,h,c,d;i.$tbodies.each(function(){for(l=t.tablesorter.processTbody(e,t(this),!0),h=!0,a=0,c=l.children(s.staticRow_class),o=l.children("tr").length-1,d=c.length;h&&d>a;)h=!1,c.each(function(){n=t(this).data(s.staticRow_data),n=n>=o?o:0>n?0:n,n!==t(this).index()&&(h=!0,r=t(this).detach(),n>=o?r.appendTo(l):0===n?r.prependTo(l):r.insertBefore(l.find("tr:eq("+n+")")))}),a++;t.tablesorter.processTbody(e,l,!1)}),i.$table.trigger("staticRowsComplete",e)},remove:function(t,e){e.$table.unbind(i)}})}(jQuery);