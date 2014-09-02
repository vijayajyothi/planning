/**!
* TableSorter 2.17.7 - Client-side table sorting with ease!
* @requires jQuery v1.2.6+
*
* Copyright (c) 2007 Christian Bach
* Examples and docs at: http://tablesorter.com
* Dual licensed under the MIT and GPL licenses:
* http://www.opensource.org/licenses/mit-license.php
* http://www.gnu.org/licenses/gpl.html
*
* @type jQuery
* @name tablesorter
* @cat Plugins/Tablesorter
* @author Christian Bach/christian.bach@polyester.se
* @contributor Rob Garrison/https://github.com/Mottie/tablesorter
*/
!function(t){"use strict";t.extend({tablesorter:new function(){function e(){var t=arguments[0],e=arguments.length>1?Array.prototype.slice.call(arguments):t;"undefined"!=typeof console&&"undefined"!=typeof console.log?console[/error/i.test(t)?"error":/warn/i.test(t)?"warn":"log"](e):alert(e)}function i(t,i){e(t+" ("+((new Date).getTime()-i.getTime())+"ms)")}function s(t){for(var e in t)return!1;return!0}function n(e,i,s){if(!i)return"";var n,o=e.config,r=o.textExtraction||"",a="";return a="basic"===r?t(i).attr(o.textAttribute)||i.textContent||i.innerText||t(i).text()||"":"function"==typeof r?r(i,e,s):"function"==typeof(n=_.getColumnData(e,r,s))?n(i,e,s):i.textContent||i.innerText||t(i).text()||"",t.trim(a)}function o(t,i,s,o){for(var r,a=_.parsers.length,l=!1,h="",c=!0;""===h&&c;)s++,i[s]?(l=i[s].cells[o],h=n(t,l,o),t.config.debug&&e("Checking if value was empty on row "+s+", column: "+o+': "'+h+'"')):c=!1;for(;--a>=0;)if(r=_.parsers[a],r&&"text"!==r.id&&r.is&&r.is(h,t,l))return r;return _.getParserById("text")}function r(t){var s,n,r,a,l,h,c,d,u,p,f=t.config,g=f.$tbodies=f.$table.children("tbody:not(."+f.cssInfoBlock+")"),m=0,v="",b=g.length;if(0===b)return f.debug?e("Warning: *Empty table!* Not building a parser cache"):"";for(f.debug&&(p=new Date,e("Detecting parsers for each column")),n={extractors:[],parsers:[]};b>m;){if(s=g[m].rows,s[m])for(r=f.columns,a=0;r>a;a++)l=f.$headers.filter('[data-column="'+a+'"]:last'),h=_.getColumnData(t,f.headers,a),u=_.getParserById(_.getData(l,h,"extractor")),d=_.getParserById(_.getData(l,h,"sorter")),c="false"===_.getData(l,h,"parser"),f.empties[a]=_.getData(l,h,"empty")||f.emptyTo||(f.emptyToBottom?"bottom":"top"),f.strings[a]=_.getData(l,h,"string")||f.stringTo||"max",c&&(d=_.getParserById("no-parser")),u||(u=!1),d||(d=o(t,s,-1,a)),f.debug&&(v+="column:"+a+"; extractor:"+u.id+"; parser:"+d.id+"; string:"+f.strings[a]+"; empty: "+f.empties[a]+"\n"),n.parsers[a]=d,n.extractors[a]=u;m+=n.parsers.length?b:1}f.debug&&(e(v?v:"No parsers detected"),i("Completed detecting parsers",p)),f.parsers=n.parsers,f.extractors=n.extractors}function a(s){var o,r,a,l,h,c,d,u,p,f,g,m,v,b,y=s.config,x=y.$table.children("tbody"),w=y.extractors,C=y.parsers;if(y.cache={},y.totalRows=0,!C)return y.debug?e("Warning: *Empty table!* Not building a cache"):"";for(y.debug&&(g=new Date),y.showProcessing&&_.isProcessing(s,!0),d=0;d<x.length;d++)if(b=[],o=y.cache[d]={normalized:[]},!x.eq(d).hasClass(y.cssInfoBlock)){for(m=x[d]&&x[d].rows.length||0,h=0;m>h;++h)if(v={child:[]},u=t(x[d].rows[h]),p=[new Array(y.columns)],f=[],u.hasClass(y.cssChildRow)&&0!==h)r=o.normalized.length-1,o.normalized[r][y.columns].$row=o.normalized[r][y.columns].$row.add(u),u.prev().hasClass(y.cssChildRow)||u.prev().addClass(_.css.cssHasChild),v.child[r]=t.trim(u[0].textContent||u[0].innerText||u.text()||"");else{for(v.$row=u,v.order=h,c=0;c<y.columns;++c)"undefined"!=typeof C[c]?(r=n(s,u[0].cells[c],c),a="undefined"==typeof w[c].id?r:w[c].format(r,s,u[0].cells[c],c),l="no-parser"===C[c].id?"":C[c].format(a,s,u[0].cells[c],c),f.push(y.ignoreCase&&"string"==typeof l?l.toLowerCase():l),"numeric"===(C[c].type||"").toLowerCase()&&(b[c]=Math.max(Math.abs(l)||0,b[c]||0))):y.debug&&e("No parser found for cell:",u[0].cells[c],"does it have a header?");f[y.columns]=v,o.normalized.push(f)}o.colMax=b,y.totalRows+=o.normalized.length}y.showProcessing&&_.isProcessing(s),y.debug&&i("Building cache for "+m+" rows",g)}function l(e,n){var o,r,a,l,h,c,d,u=e.config,p=u.widgetOptions,f=e.tBodies,g=[],m=u.cache;if(s(m))return u.appender?u.appender(e,g):e.isUpdating?u.$table.trigger("updateComplete",e):"";for(u.debug&&(d=new Date),c=0;c<f.length;c++)if(a=t(f[c]),a.length&&!a.hasClass(u.cssInfoBlock)){for(l=_.processTbody(e,a,!0),o=m[c].normalized,r=o.length,h=0;r>h;h++)g.push(o[h][u.columns].$row),u.appender&&(!u.pager||u.pager.removeRows&&p.pager_removeRows||u.pager.ajax)||l.append(o[h][u.columns].$row);_.processTbody(e,l,!1)}u.appender&&u.appender(e,g),u.debug&&i("Rebuilt table",d),n||u.appender||_.applyWidget(e),e.isUpdating&&u.$table.trigger("updateComplete",e)}function h(t){return/^d/i.test(t)||1===t}function c(s){var n,o,r,a,l,c,d,p=s.config;p.headerList=[],p.headerContent=[],p.debug&&(d=new Date),p.columns=_.computeColumnIndex(p.$table.children("thead, tfoot").children("tr")),a=p.cssIcon?'<i class="'+(p.cssIcon===_.css.icon?_.css.icon:p.cssIcon+" "+_.css.icon)+'"></i>':"",p.$headers=t(s).find(p.selectorHeaders).each(function(e){o=t(this),n=_.getColumnData(s,p.headers,e,!0),p.headerContent[e]=t(this).html(),l=p.headerTemplate.replace(/\{content\}/g,t(this).html()).replace(/\{icon\}/g,a),p.onRenderTemplate&&(r=p.onRenderTemplate.apply(o,[e,l]),r&&"string"==typeof r&&(l=r)),t(this).html('<div class="'+_.css.headerIn+'">'+l+"</div>"),p.onRenderHeader&&p.onRenderHeader.apply(o,[e]),this.column=parseInt(t(this).attr("data-column"),10),this.order=h(_.getData(o,n,"sortInitialOrder")||p.sortInitialOrder)?[1,0,2]:[0,1,2],this.count=-1,this.lockedOrder=!1,c=_.getData(o,n,"lockedOrder")||!1,"undefined"!=typeof c&&c!==!1&&(this.order=this.lockedOrder=h(c)?[1,1,1]:[0,0,0]),o.addClass(_.css.header+" "+p.cssHeader),p.headerList[e]=this,o.parent().addClass(_.css.headerRow+" "+p.cssHeaderRow).attr("role","row"),p.tabIndex&&o.attr("tabindex",0)}).attr({scope:"col",role:"columnheader"}),u(s),p.debug&&(i("Built headers:",d),e(p.$headers))}function d(t,e,i){var s=t.config;s.$table.find(s.selectorRemove).remove(),r(t),a(t),x(s.$table,e,i)}function u(e){var i,s,n,o=e.config;o.$headers.each(function(r,a){s=t(a),n=_.getColumnData(e,o.headers,r,!0),i="false"===_.getData(a,n,"sorter")||"false"===_.getData(a,n,"parser"),a.sortDisabled=i,s[i?"addClass":"removeClass"]("sorter-false").attr("aria-disabled",""+i),e.id&&(i?s.removeAttr("aria-controls"):s.attr("aria-controls",e.id))})}function p(e){var i,s,n,o=e.config,r=o.sortList,a=r.length,l=_.css.sortNone+" "+o.cssNone,h=[_.css.sortAsc+" "+o.cssAsc,_.css.sortDesc+" "+o.cssDesc],c=["ascending","descending"],d=t(e).find("tfoot tr").children().add(o.$extraHeaders).removeClass(h.join(" "));for(o.$headers.removeClass(h.join(" ")).addClass(l).attr("aria-sort","none"),s=0;a>s;s++)if(2!==r[s][1]&&(i=o.$headers.not(".sorter-false").filter('[data-column="'+r[s][0]+'"]'+(1===a?":last":"")),i.length)){for(n=0;n<i.length;n++)i[n].sortDisabled||i.eq(n).removeClass(l).addClass(h[r[s][1]]).attr("aria-sort",c[r[s][1]]);d.length&&d.filter('[data-column="'+r[s][0]+'"]').removeClass(l).addClass(h[r[s][1]])}o.$headers.not(".sorter-false").each(function(){var e=t(this),i=this.order[(this.count+1)%(o.sortReset?3:2)],s=e.text()+": "+_.language[e.hasClass(_.css.sortAsc)?"sortAsc":e.hasClass(_.css.sortDesc)?"sortDesc":"sortNone"]+_.language[0===i?"nextAsc":1===i?"nextDesc":"nextNone"];e.attr("aria-label",s)})}function f(e){if(e.config.widthFixed&&0===t(e).find("colgroup").length){var i=t("<colgroup>"),s=t(e).width();t(e.tBodies[0]).find("tr:first").children(":visible").each(function(){i.append(t("<col>").css("width",parseInt(t(this).width()/s*1e3,10)/10+"%"))}),t(e).prepend(i)}}function g(e,i){var s,n,o,r,a,l=e.config,h=i||l.sortList;l.sortList=[],t.each(h,function(e,i){if(r=parseInt(i[0],10),o=l.$headers.filter('[data-column="'+r+'"]:last')[0]){switch(n=(""+i[1]).match(/^(1|d|s|o|n)/),n=n?n[0]:""){case"1":case"d":n=1;break;case"s":n=a||0;break;case"o":s=o.order[(a||0)%(l.sortReset?3:2)],n=0===s?1:1===s?0:2;break;case"n":o.count=o.count+1,n=o.order[o.count%(l.sortReset?3:2)];break;default:n=0}a=0===e?n:a,s=[r,parseInt(n,10)||0],l.sortList.push(s),n=t.inArray(s[1],o.order),o.count=n>=0?n:s[1]%(l.sortReset?3:2)}})}function m(t,e){return t&&t[e]?t[e].type||"":""}function v(e,i,s){if(e.isUpdating)return setTimeout(function(){v(e,i,s)},50);var n,o,r,a,h,c=e.config,d=!s[c.sortMultiSortKey],u=c.$table;if(u.trigger("sortStart",e),i.count=s[c.sortResetKey]?2:(i.count+1)%(c.sortReset?3:2),c.sortRestart&&(o=i,c.$headers.each(function(){this===o||!d&&t(this).is("."+_.css.sortDesc+",."+_.css.sortAsc)||(this.count=-1)})),o=i.column,d){if(c.sortList=[],null!==c.sortForce)for(n=c.sortForce,r=0;r<n.length;r++)n[r][0]!==o&&c.sortList.push(n[r]);if(a=i.order[i.count],2>a&&(c.sortList.push([o,a]),i.colSpan>1))for(r=1;r<i.colSpan;r++)c.sortList.push([o+r,a])}else{if(c.sortAppend&&c.sortList.length>1)for(r=0;r<c.sortAppend.length;r++)h=_.isValueInArray(c.sortAppend[r][0],c.sortList),h>=0&&c.sortList.splice(h,1);if(_.isValueInArray(o,c.sortList)>=0)for(r=0;r<c.sortList.length;r++)h=c.sortList[r],a=c.$headers.filter('[data-column="'+h[0]+'"]:last')[0],h[0]===o&&(h[1]=a.order[i.count],2===h[1]&&(c.sortList.splice(r,1),a.count=-1));else if(a=i.order[i.count],2>a&&(c.sortList.push([o,a]),i.colSpan>1))for(r=1;r<i.colSpan;r++)c.sortList.push([o+r,a])}if(null!==c.sortAppend)for(n=c.sortAppend,r=0;r<n.length;r++)n[r][0]!==o&&c.sortList.push(n[r]);u.trigger("sortBegin",e),setTimeout(function(){p(e),b(e),l(e),u.trigger("sortEnd",e)},1)}function b(t){var e,n,o,r,a,l,h,c,d,u,p,f=0,g=t.config,v=g.textSorter||"",b=g.sortList,y=b.length,x=t.tBodies.length;if(!g.serverSideSorting&&!s(g.cache)){for(g.debug&&(a=new Date),n=0;x>n;n++)l=g.cache[n].colMax,h=g.cache[n].normalized,h.sort(function(i,s){for(e=0;y>e;e++){if(r=b[e][0],c=b[e][1],f=0===c,g.sortStable&&i[r]===s[r]&&1===y)return i[g.columns].order-s[g.columns].order;if(o=/n/i.test(m(g.parsers,r)),o&&g.strings[r]?(o="boolean"==typeof g.string[g.strings[r]]?(f?1:-1)*(g.string[g.strings[r]]?-1:1):g.strings[r]?g.string[g.strings[r]]||0:0,d=g.numberSorter?g.numberSorter(i[r],s[r],f,l[r],t):_["sortNumeric"+(f?"Asc":"Desc")](i[r],s[r],o,l[r],r,t)):(u=f?i:s,p=f?s:i,d="function"==typeof v?v(u[r],p[r],f,r,t):"object"==typeof v&&v.hasOwnProperty(r)?v[r](u[r],p[r],f,r,t):_["sortNatural"+(f?"Asc":"Desc")](i[r],s[r],r,t,g)),d)return d}return i[g.columns].order-s[g.columns].order});g.debug&&i("Sorting on "+b.toString()+" and dir "+c+" time",a)}}function y(e,i){var s=e[0];s.isUpdating&&e.trigger("updateComplete"),t.isFunction(i)&&i(e[0])}function x(t,e,i){var s=t[0].config.sortList;e!==!1&&!t[0].isProcessing&&s.length?t.trigger("sorton",[s,function(){y(t,i)},!0]):(y(t,i),_.applyWidget(t[0],!1))}function w(e){var i=e.config,o=i.$table;o.unbind("sortReset update updateRows updateCell updateAll addRows updateComplete sorton appendCache updateCache applyWidgetId applyWidgets refreshWidgets destroy mouseup mouseleave ".split(" ").join(i.namespace+" ")).bind("sortReset"+i.namespace,function(s,n){s.stopPropagation(),i.sortList=[],p(e),b(e),l(e),t.isFunction(n)&&n(e)}).bind("updateAll"+i.namespace,function(t,s,n){t.stopPropagation(),e.isUpdating=!0,_.refreshWidgets(e,!0,!0),_.restoreHeaders(e),c(e),_.bindEvents(e,i.$headers,!0),w(e),d(e,s,n)}).bind("update"+i.namespace+" updateRows"+i.namespace,function(t,i,s){t.stopPropagation(),e.isUpdating=!0,u(e),d(e,i,s)}).bind("updateCell"+i.namespace,function(s,r,a,l){s.stopPropagation(),e.isUpdating=!0,o.find(i.selectorRemove).remove();var h,c,d,u,p=o.find("tbody"),f=t(r),g=p.index(t.fn.closest?f.closest("tbody"):f.parents("tbody").filter(":first")),m=t.fn.closest?f.closest("tr"):f.parents("tr").filter(":first");r=f[0],p.length&&g>=0&&(d=p.eq(g).find("tr").index(m),u=f.index(),i.cache[g].normalized[d][i.columns].$row=m,c="undefined"==typeof i.extractors[u].id?n(e,r,u):i.extractors[u].format(n(e,r,u),e,r,u),h="no-parser"===i.parsers[u].id?"":i.parsers[u].format(c,e,r,u),i.cache[g].normalized[d][u]=i.ignoreCase&&"string"==typeof h?h.toLowerCase():h,"numeric"===(i.parsers[u].type||"").toLowerCase()&&(i.cache[g].colMax[u]=Math.max(Math.abs(h)||0,i.cache[g].colMax[u]||0)),x(o,a,l))}).bind("addRows"+i.namespace,function(a,l,h,c){if(a.stopPropagation(),e.isUpdating=!0,s(i.cache))u(e),d(e,h,c);else{l=t(l).attr("role","row");var p,f,g,m,v,b,y,w=l.filter("tr").length,_=o.find("tbody").index(l.parents("tbody").filter(":first"));for(i.parsers&&i.parsers.length||r(e),p=0;w>p;p++){for(g=l[p].cells.length,y=[],b={child:[],$row:l.eq(p),order:i.cache[_].normalized.length},f=0;g>f;f++)m="undefined"==typeof i.extractors[f].id?n(e,l[p].cells[f],f):i.extractors[f].format(n(e,l[p].cells[f],f),e,l[p].cells[f],f),v="no-parser"===i.parsers[f].id?"":i.parsers[f].format(m,e,l[p].cells[f],f),y[f]=i.ignoreCase&&"string"==typeof v?v.toLowerCase():v,"numeric"===(i.parsers[f].type||"").toLowerCase()&&(i.cache[_].colMax[f]=Math.max(Math.abs(y[f])||0,i.cache[_].colMax[f]||0));y.push(b),i.cache[_].normalized.push(y)}x(o,h,c)}}).bind("updateComplete"+i.namespace,function(){e.isUpdating=!1}).bind("sorton"+i.namespace,function(i,n,r,h){var c=e.config;i.stopPropagation(),o.trigger("sortStart",this),g(e,n),p(e),c.delayInit&&s(c.cache)&&a(e),o.trigger("sortBegin",this),b(e),l(e,h),o.trigger("sortEnd",this),_.applyWidget(e),t.isFunction(r)&&r(e)}).bind("appendCache"+i.namespace,function(i,s,n){i.stopPropagation(),l(e,n),t.isFunction(s)&&s(e)}).bind("updateCache"+i.namespace,function(s,n){i.parsers&&i.parsers.length||r(e),a(e),t.isFunction(n)&&n(e)}).bind("applyWidgetId"+i.namespace,function(t,s){t.stopPropagation(),_.getWidgetById(s).format(e,i,i.widgetOptions)}).bind("applyWidgets"+i.namespace,function(t,i){t.stopPropagation(),_.applyWidget(e,i)}).bind("refreshWidgets"+i.namespace,function(t,i,s){t.stopPropagation(),_.refreshWidgets(e,i,s)}).bind("destroy"+i.namespace,function(t,i,s){t.stopPropagation(),_.destroy(e,i,s)}).bind("resetToLoadState"+i.namespace,function(){_.refreshWidgets(e,!0,!0),i=t.extend(!0,_.defaults,i.originalSettings),e.hasInitialized=!1,_.setup(e,i)})}var _=this;_.version="2.17.7",_.parsers=[],_.widgets=[],_.defaults={theme:"default",widthFixed:!1,showProcessing:!1,headerTemplate:"{content}",onRenderTemplate:null,onRenderHeader:null,cancelSelection:!0,tabIndex:!0,dateFormat:"mmddyyyy",sortMultiSortKey:"shiftKey",sortResetKey:"ctrlKey",usNumberFormat:!0,delayInit:!1,serverSideSorting:!1,headers:{},ignoreCase:!0,sortForce:null,sortList:[],sortAppend:null,sortStable:!1,sortInitialOrder:"asc",sortLocaleCompare:!1,sortReset:!1,sortRestart:!1,emptyTo:"bottom",stringTo:"max",textExtraction:"basic",textAttribute:"data-text",textSorter:null,numberSorter:null,widgets:[],widgetOptions:{zebra:["even","odd"]},initWidgets:!0,initialized:null,tableClass:"",cssAsc:"",cssDesc:"",cssNone:"",cssHeader:"",cssHeaderRow:"",cssProcessing:"",cssChildRow:"tablesorter-childRow",cssIcon:"tablesorter-icon",cssInfoBlock:"tablesorter-infoOnly",selectorHeaders:"> thead th, > thead td",selectorSort:"th, td",selectorRemove:".remove-me",debug:!1,headerList:[],empties:{},strings:{},parsers:[]},_.css={table:"tablesorter",cssHasChild:"tablesorter-hasChildRow",childRow:"tablesorter-childRow",header:"tablesorter-header",headerRow:"tablesorter-headerRow",headerIn:"tablesorter-header-inner",icon:"tablesorter-icon",info:"tablesorter-infoOnly",processing:"tablesorter-processing",sortAsc:"tablesorter-headerAsc",sortDesc:"tablesorter-headerDesc",sortNone:"tablesorter-headerUnSorted"},_.language={sortAsc:"Ascending sort applied, ",sortDesc:"Descending sort applied, ",sortNone:"No sort applied, ",nextAsc:"activate to apply an ascending sort",nextDesc:"activate to apply a descending sort",nextNone:"activate to remove the sort"},_.log=e,_.benchmark=i,_.construct=function(e){return this.each(function(){var i=this,s=t.extend(!0,{},_.defaults,e);s.originalSettings=e,!i.hasInitialized&&_.buildTable&&"TABLE"!==this.tagName?_.buildTable(i,s):_.setup(i,s)})},_.setup=function(i,s){if(!i||!i.tHead||0===i.tBodies.length||i.hasInitialized===!0)return s.debug?e("ERROR: stopping initialization! No table, thead, tbody or tablesorter has already been initialized"):"";var n="",o=t(i),l=t.metadata;i.hasInitialized=!1,i.isProcessing=!0,i.config=s,t.data(i,"tablesorter",s),s.debug&&t.data(i,"startoveralltimer",new Date),s.supportsDataObject=function(t){return t[0]=parseInt(t[0],10),t[0]>1||1===t[0]&&parseInt(t[1],10)>=4}(t.fn.jquery.split(".")),s.string={max:1,min:-1,emptyMin:1,emptyMax:-1,zero:0,none:0,"null":0,top:!0,bottom:!1},/tablesorter\-/.test(o.attr("class"))||(n=""!==s.theme?" tablesorter-"+s.theme:""),s.table=i,s.$table=o.addClass(_.css.table+" "+s.tableClass+n).attr("role","grid"),s.$headers=o.find(s.selectorHeaders),s.namespace=s.namespace?"."+s.namespace.replace(/\W/g,""):".tablesorter"+Math.random().toString(16).slice(2),s.$table.children().children("tr").attr("role","row"),s.$tbodies=o.children("tbody:not(."+s.cssInfoBlock+")").attr({"aria-live":"polite","aria-relevant":"all"}),s.$table.find("caption").length&&s.$table.attr("aria-labelledby","theCaption"),s.widgetInit={},s.textExtraction=s.$table.attr("data-text-extraction")||s.textExtraction||"basic",c(i),f(i),r(i),s.totalRows=0,s.delayInit||a(i),_.bindEvents(i,s.$headers,!0),w(i),s.supportsDataObject&&"undefined"!=typeof o.data().sortlist?s.sortList=o.data().sortlist:l&&o.metadata()&&o.metadata().sortlist&&(s.sortList=o.metadata().sortlist),_.applyWidget(i,!0),s.sortList.length>0?o.trigger("sorton",[s.sortList,{},!s.initWidgets,!0]):(p(i),s.initWidgets&&_.applyWidget(i,!1)),s.showProcessing&&o.unbind("sortBegin"+s.namespace+" sortEnd"+s.namespace).bind("sortBegin"+s.namespace+" sortEnd"+s.namespace,function(t){clearTimeout(s.processTimer),_.isProcessing(i),"sortBegin"===t.type&&(s.processTimer=setTimeout(function(){_.isProcessing(i,!0)},500))}),i.hasInitialized=!0,i.isProcessing=!1,s.debug&&_.benchmark("Overall initialization time",t.data(i,"startoveralltimer")),o.trigger("tablesorter-initialized",i),"function"==typeof s.initialized&&s.initialized(i)},_.getColumnData=function(e,i,s,n){if("undefined"!=typeof i&&null!==i){e=t(e)[0];var o,r,a,l=e.config;if(i[s])return n?i[s]:i[l.$headers.index(l.$headers.filter('[data-column="'+s+'"]:last'))];for(a in i)if("string"==typeof a&&(r=n?l.$headers.eq(s).filter(a):l.$headers.filter('[data-column="'+s+'"]:last').filter(a),r.length))return i[a];return o}},_.computeColumnIndex=function(e){var i,s,n,o,r,a,l,h,c,d,u,p,f,g=[],m={},v=0;for(i=0;i<e.length;i++)for(l=e[i].cells,s=0;s<l.length;s++){for(a=l[s],r=t(a),h=a.parentNode.rowIndex,c=h+"-"+r.index(),d=a.rowSpan||1,u=a.colSpan||1,"undefined"==typeof g[h]&&(g[h]=[]),n=0;n<g[h].length+1;n++)if("undefined"==typeof g[h][n]){p=n;break}for(m[c]=p,v=Math.max(p,v),r.attr({"data-column":p}),n=h;h+d>n;n++)for("undefined"==typeof g[n]&&(g[n]=[]),f=g[n],o=p;p+u>o;o++)f[o]="x"}return v+1},_.isProcessing=function(e,i,s){e=t(e);var n=e[0].config,o=s||e.find("."+_.css.header);i?("undefined"!=typeof s&&n.sortList.length>0&&(o=o.filter(function(){return this.sortDisabled?!1:_.isValueInArray(parseFloat(t(this).attr("data-column")),n.sortList)>=0})),e.add(o).addClass(_.css.processing+" "+n.cssProcessing)):e.add(o).removeClass(_.css.processing+" "+n.cssProcessing)},_.processTbody=function(e,i,s){e=t(e)[0];var n;return s?(e.isProcessing=!0,i.before('<span class="tablesorter-savemyplace"/>'),n=t.fn.detach?i.detach():i.remove()):(n=t(e).find("span.tablesorter-savemyplace"),i.insertAfter(n),n.remove(),void(e.isProcessing=!1))},_.clearTableBody=function(e){t(e)[0].config.$tbodies.children().detach()},_.bindEvents=function(e,i,n){e=t(e)[0];var o,r=e.config;n!==!0&&(r.$extraHeaders=r.$extraHeaders?r.$extraHeaders.add(i):i),i.find(r.selectorSort).add(i.filter(r.selectorSort)).unbind("mousedown mouseup sort keyup ".split(" ").join(r.namespace+" ")).bind("mousedown mouseup sort keyup ".split(" ").join(r.namespace+" "),function(n,l){var h,c=n.type;if(!(1!==(n.which||n.button)&&!/sort|keyup/.test(c)||"keyup"===c&&13!==n.which||"mouseup"===c&&l!==!0&&(new Date).getTime()-o>250)){if("mousedown"===c)return o=(new Date).getTime(),/(input|select|button|textarea)/i.test(n.target.tagName)?"":!r.cancelSelection;r.delayInit&&s(r.cache)&&a(e),h=t.fn.closest?t(this).closest("th, td")[0]:/TH|TD/.test(this.tagName)?this:t(this).parents("th, td")[0],h=r.$headers[i.index(h)],h.sortDisabled||v(e,h,n)}}),r.cancelSelection&&i.attr("unselectable","on").bind("selectstart",!1).css({"user-select":"none",MozUserSelect:"none"})},_.restoreHeaders=function(e){var i=t(e)[0].config;i.$table.find(i.selectorHeaders).each(function(e){t(this).find("."+_.css.headerIn).length&&t(this).html(i.headerContent[e])})},_.destroy=function(e,i,s){if(e=t(e)[0],e.hasInitialized){_.refreshWidgets(e,!0,!0);var n=t(e),o=e.config,r=n.find("thead:first"),a=r.find("tr."+_.css.headerRow).removeClass(_.css.headerRow+" "+o.cssHeaderRow),l=n.find("tfoot:first > tr").children("th, td");i===!1&&t.inArray("uitheme",o.widgets)>=0&&(n.trigger("applyWidgetId",["uitheme"]),n.trigger("applyWidgetId",["zebra"])),r.find("tr").not(a).remove(),n.removeData("tablesorter").unbind("sortReset update updateAll updateRows updateCell addRows updateComplete sorton appendCache updateCache applyWidgetId applyWidgets refreshWidgets destroy mouseup mouseleave keypress sortBegin sortEnd resetToLoadState ".split(" ").join(o.namespace+" ")),o.$headers.add(l).removeClass([_.css.header,o.cssHeader,o.cssAsc,o.cssDesc,_.css.sortAsc,_.css.sortDesc,_.css.sortNone].join(" ")).removeAttr("data-column").removeAttr("aria-label").attr("aria-disabled","true"),a.find(o.selectorSort).unbind("mousedown mouseup keypress ".split(" ").join(o.namespace+" ")),_.restoreHeaders(e),n.toggleClass(_.css.table+" "+o.tableClass+" tablesorter-"+o.theme,i===!1),e.hasInitialized=!1,delete e.config.cache,"function"==typeof s&&s(e)}},_.regex={chunk:/(^([+\-]?(?:0|[1-9]\d*)(?:\.\d*)?(?:[eE][+\-]?\d+)?)?$|^0x[0-9a-f]+$|\d+)/gi,chunks:/(^\\0|\\0$)/,hex:/^0x[0-9a-f]+$/i},_.sortNatural=function(t,e){if(t===e)return 0;var i,s,n,o,r,a,l,h,c=_.regex;if(c.hex.test(e)){if(s=parseInt(t.match(c.hex),16),o=parseInt(e.match(c.hex),16),o>s)return-1;if(s>o)return 1}for(i=t.replace(c.chunk,"\\0$1\\0").replace(c.chunks,"").split("\\0"),n=e.replace(c.chunk,"\\0$1\\0").replace(c.chunks,"").split("\\0"),h=Math.max(i.length,n.length),l=0;h>l;l++){if(r=isNaN(i[l])?i[l]||0:parseFloat(i[l])||0,a=isNaN(n[l])?n[l]||0:parseFloat(n[l])||0,isNaN(r)!==isNaN(a))return isNaN(r)?1:-1;if(typeof r!=typeof a&&(r+="",a+=""),a>r)return-1;if(r>a)return 1}return 0},_.sortNaturalAsc=function(t,e,i,s,n){if(t===e)return 0;var o=n.string[n.empties[i]||n.emptyTo];return""===t&&0!==o?"boolean"==typeof o?o?-1:1:-o||-1:""===e&&0!==o?"boolean"==typeof o?o?1:-1:o||1:_.sortNatural(t,e)},_.sortNaturalDesc=function(t,e,i,s,n){if(t===e)return 0;var o=n.string[n.empties[i]||n.emptyTo];return""===t&&0!==o?"boolean"==typeof o?o?-1:1:o||1:""===e&&0!==o?"boolean"==typeof o?o?1:-1:-o||-1:_.sortNatural(e,t)},_.sortText=function(t,e){return t>e?1:e>t?-1:0},_.getTextValue=function(t,e,i){if(i){var s,n=t?t.length:0,o=i+e;for(s=0;n>s;s++)o+=t.charCodeAt(s);return e*o}return 0},_.sortNumericAsc=function(t,e,i,s,n,o){if(t===e)return 0;var r=o.config,a=r.string[r.empties[n]||r.emptyTo];return""===t&&0!==a?"boolean"==typeof a?a?-1:1:-a||-1:""===e&&0!==a?"boolean"==typeof a?a?1:-1:a||1:(isNaN(t)&&(t=_.getTextValue(t,i,s)),isNaN(e)&&(e=_.getTextValue(e,i,s)),t-e)},_.sortNumericDesc=function(t,e,i,s,n,o){if(t===e)return 0;var r=o.config,a=r.string[r.empties[n]||r.emptyTo];return""===t&&0!==a?"boolean"==typeof a?a?-1:1:a||1:""===e&&0!==a?"boolean"==typeof a?a?1:-1:-a||-1:(isNaN(t)&&(t=_.getTextValue(t,i,s)),isNaN(e)&&(e=_.getTextValue(e,i,s)),e-t)},_.sortNumeric=function(t,e){return t-e},_.characterEquivalents={a:"\xe1\xe0\xe2\xe3\xe4\u0105\xe5",A:"\xc1\xc0\xc2\xc3\xc4\u0104\xc5",c:"\xe7\u0107\u010d",C:"\xc7\u0106\u010c",e:"\xe9\xe8\xea\xeb\u011b\u0119",E:"\xc9\xc8\xca\xcb\u011a\u0118",i:"\xed\xec\u0130\xee\xef\u0131",I:"\xcd\xcc\u0130\xce\xcf",o:"\xf3\xf2\xf4\xf5\xf6",O:"\xd3\xd2\xd4\xd5\xd6",ss:"\xdf",SS:"\u1e9e",u:"\xfa\xf9\xfb\xfc\u016f",U:"\xda\xd9\xdb\xdc\u016e"},_.replaceAccents=function(t){var e,i="[",s=_.characterEquivalents;if(!_.characterRegex){_.characterRegexArray={};for(e in s)"string"==typeof e&&(i+=s[e],_.characterRegexArray[e]=new RegExp("["+s[e]+"]","g"));_.characterRegex=new RegExp(i+"]")}if(_.characterRegex.test(t))for(e in s)"string"==typeof e&&(t=t.replace(_.characterRegexArray[e],e));return t},_.isValueInArray=function(t,e){var i,s=e.length;for(i=0;s>i;i++)if(e[i][0]===t)return i;return-1},_.addParser=function(t){var e,i=_.parsers.length,s=!0;for(e=0;i>e;e++)_.parsers[e].id.toLowerCase()===t.id.toLowerCase()&&(s=!1);s&&_.parsers.push(t)},_.getParserById=function(t){if("false"==t)return!1;var e,i=_.parsers.length;for(e=0;i>e;e++)if(_.parsers[e].id.toLowerCase()===t.toString().toLowerCase())return _.parsers[e];return!1},_.addWidget=function(t){_.widgets.push(t)},_.hasWidget=function(e,i){return e=t(e),e.length&&e[0].config&&e[0].config.widgetInit[i]||!1},_.getWidgetById=function(t){var e,i,s=_.widgets.length;for(e=0;s>e;e++)if(i=_.widgets[e],i&&i.hasOwnProperty("id")&&i.id.toLowerCase()===t.toLowerCase())return i},_.applyWidget=function(e,s){e=t(e)[0];var n,o,r,a=e.config,l=a.widgetOptions,h=[];s!==!1&&e.hasInitialized&&(e.isApplyingWidgets||e.isUpdating)||(a.debug&&(n=new Date),a.widgets.length&&(e.isApplyingWidgets=!0,a.widgets=t.grep(a.widgets,function(e,i){return t.inArray(e,a.widgets)===i}),t.each(a.widgets||[],function(t,e){r=_.getWidgetById(e),r&&r.id&&(r.priority||(r.priority=10),h[t]=r)}),h.sort(function(t,e){return t.priority<e.priority?-1:t.priority===e.priority?0:1}),t.each(h,function(i,n){n&&((s||!a.widgetInit[n.id])&&(a.widgetInit[n.id]=!0,n.hasOwnProperty("options")&&(l=e.config.widgetOptions=t.extend(!0,{},n.options,l)),n.hasOwnProperty("init")&&n.init(e,n,a,l)),!s&&n.hasOwnProperty("format")&&n.format(e,a,l,!1))})),setTimeout(function(){e.isApplyingWidgets=!1},0),a.debug&&(o=a.widgets.length,i("Completed "+(s===!0?"initializing ":"applying ")+o+" widget"+(1!==o?"s":""),n)))},_.refreshWidgets=function(i,s,n){i=t(i)[0];var o,r=i.config,a=r.widgets,l=_.widgets,h=l.length;for(o=0;h>o;o++)l[o]&&l[o].id&&(s||t.inArray(l[o].id,a)<0)&&(r.debug&&e('Refeshing widgets: Removing "'+l[o].id+'"'),l[o].hasOwnProperty("remove")&&r.widgetInit[l[o].id]&&(l[o].remove(i,r,r.widgetOptions),r.widgetInit[l[o].id]=!1));n!==!0&&_.applyWidget(i,s)},_.getData=function(e,i,s){var n,o,r="",a=t(e);return a.length?(n=t.metadata?a.metadata():!1,o=" "+(a.attr("class")||""),"undefined"!=typeof a.data(s)||"undefined"!=typeof a.data(s.toLowerCase())?r+=a.data(s)||a.data(s.toLowerCase()):n&&"undefined"!=typeof n[s]?r+=n[s]:i&&"undefined"!=typeof i[s]?r+=i[s]:" "!==o&&o.match(" "+s+"-")&&(r=o.match(new RegExp("\\s"+s+"-([\\w-]+)"))[1]||""),t.trim(r)):""},_.formatFloat=function(e,i){if("string"!=typeof e||""===e)return e;var s,n=i&&i.config?i.config.usNumberFormat!==!1:"undefined"!=typeof i?i:!0;return e=n?e.replace(/,/g,""):e.replace(/[\s|\.]/g,"").replace(/,/g,"."),/^\s*\([.\d]+\)/.test(e)&&(e=e.replace(/^\s*\(([.\d]+)\)/,"-$1")),s=parseFloat(e),isNaN(s)?t.trim(e):s},_.isDigit=function(t){return isNaN(t)?/^[\-+(]?\d+[)]?$/.test(t.toString().replace(/[,.'"\s]/g,"")):!0}}});var e=t.tablesorter;t.fn.extend({tablesorter:e.construct}),e.addParser({id:"no-parser",is:function(){return!1},format:function(){return""},type:"text"}),e.addParser({id:"text",is:function(){return!0},format:function(i,s){var n=s.config;return i&&(i=t.trim(n.ignoreCase?i.toLocaleLowerCase():i),i=n.sortLocaleCompare?e.replaceAccents(i):i),i},type:"text"}),e.addParser({id:"digit",is:function(t){return e.isDigit(t)},format:function(i,s){var n=e.formatFloat((i||"").replace(/[^\w,. \-()]/g,""),s);return i&&"number"==typeof n?n:i?t.trim(i&&s.config.ignoreCase?i.toLocaleLowerCase():i):i},type:"numeric"}),e.addParser({id:"currency",is:function(t){return/^\(?\d+[\u00a3$\u20ac\u00a4\u00a5\u00a2?.]|[\u00a3$\u20ac\u00a4\u00a5\u00a2?.]\d+\)?$/.test((t||"").replace(/[+\-,. ]/g,""))},format:function(i,s){var n=e.formatFloat((i||"").replace(/[^\w,. \-()]/g,""),s);return i&&"number"==typeof n?n:i?t.trim(i&&s.config.ignoreCase?i.toLocaleLowerCase():i):i},type:"numeric"}),e.addParser({id:"ipAddress",is:function(t){return/^\d{1,3}[\.]\d{1,3}[\.]\d{1,3}[\.]\d{1,3}$/.test(t)},format:function(t,i){var s,n=t?t.split("."):"",o="",r=n.length;for(s=0;r>s;s++)o+=("00"+n[s]).slice(-3);return t?e.formatFloat(o,i):t},type:"numeric"}),e.addParser({id:"url",is:function(t){return/^(https?|ftp|file):\/\//.test(t)},format:function(e){return e?t.trim(e.replace(/(https?|ftp|file):\/\//,"")):e},type:"text"}),e.addParser({id:"isoDate",is:function(t){return/^\d{4}[\/\-]\d{1,2}[\/\-]\d{1,2}/.test(t)},format:function(t,i){return t?e.formatFloat(""!==t?new Date(t.replace(/-/g,"/")).getTime()||t:"",i):t},type:"numeric"}),e.addParser({id:"percent",is:function(t){return/(\d\s*?%|%\s*?\d)/.test(t)&&t.length<15},format:function(t,i){return t?e.formatFloat(t.replace(/%/g,""),i):t},type:"numeric"}),e.addParser({id:"usLongDate",is:function(t){return/^[A-Z]{3,10}\.?\s+\d{1,2},?\s+(\d{4})(\s+\d{1,2}:\d{2}(:\d{2})?(\s+[AP]M)?)?$/i.test(t)||/^\d{1,2}\s+[A-Z]{3,10}\s+\d{4}/i.test(t)},format:function(t,i){return t?e.formatFloat(new Date(t.replace(/(\S)([AP]M)$/i,"$1 $2")).getTime()||t,i):t},type:"numeric"}),e.addParser({id:"shortDate",is:function(t){return/(^\d{1,2}[\/\s]\d{1,2}[\/\s]\d{4})|(^\d{4}[\/\s]\d{1,2}[\/\s]\d{1,2})/.test((t||"").replace(/\s+/g," ").replace(/[\-.,]/g,"/"))},format:function(t,i,s,n){if(t){var o=i.config,r=o.$headers.filter("[data-column="+n+"]:last"),a=r.length&&r[0].dateFormat||e.getData(r,e.getColumnData(i,o.headers,n),"dateFormat")||o.dateFormat;t=t.replace(/\s+/g," ").replace(/[\-.,]/g,"/"),"mmddyyyy"===a?t=t.replace(/(\d{1,2})[\/\s](\d{1,2})[\/\s](\d{4})/,"$3/$1/$2"):"ddmmyyyy"===a?t=t.replace(/(\d{1,2})[\/\s](\d{1,2})[\/\s](\d{4})/,"$3/$2/$1"):"yyyymmdd"===a&&(t=t.replace(/(\d{4})[\/\s](\d{1,2})[\/\s](\d{1,2})/,"$1/$2/$3"))}return t?e.formatFloat(new Date(t).getTime()||t,i):t},type:"numeric"}),e.addParser({id:"time",is:function(t){return/^(([0-2]?\d:[0-5]\d)|([0-1]?\d:[0-5]\d\s?([AP]M)))$/i.test(t)},format:function(t,i){return t?e.formatFloat(new Date("2000/01/01 "+t.replace(/(\S)([AP]M)$/i,"$1 $2")).getTime()||t,i):t},type:"numeric"}),e.addParser({id:"metadata",is:function(){return!1},format:function(e,i,s){var n=i.config,o=n.parserMetadataName?n.parserMetadataName:"sortValue";return t(s).metadata()[o]},type:"numeric"}),e.addWidget({id:"zebra",priority:90,format:function(i,s,n){var o,r,a,l,h,c,d,u,p=new RegExp(s.cssChildRow,"i"),f=s.$tbodies;for(s.debug&&(c=new Date),d=0;d<f.length;d++)o=f.eq(d),u=o.children("tr").length,u>1&&(l=0,r=o.children("tr:visible").not(s.selectorRemove),r.each(function(){a=t(this),p.test(this.className)||l++,h=l%2===0,a.removeClass(n.zebra[h?1:0]).addClass(n.zebra[h?0:1])}));s.debug&&e.benchmark("Applying Zebra widget",c)},remove:function(e,i,s){var n,o,r=i.$tbodies,a=(s.zebra||["even","odd"]).join(" ");for(n=0;n<r.length;n++)o=t.tablesorter.processTbody(e,r.eq(n),!0),o.children().removeClass(a),t.tablesorter.processTbody(e,o,!1)}})}(jQuery);