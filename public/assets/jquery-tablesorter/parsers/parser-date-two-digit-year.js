!function(t){"use strict";var e=t.tablesorter,i=50;e.dates=t.extend({},e.dates,{regxxxxyy:/(\d{1,2})[\/\s](\d{1,2})[\/\s](\d{2})/,regyyxxxx:/(\d{2})[\/\s](\d{1,2})[\/\s](\d{1,2})/}),e.formatDate=function(t,e,s,n){for(var r=t.replace(/\s+/g," ").replace(/[-.,]/g,"/").replace(e,s),o=new Date(r),a=o.getFullYear(),l=n&&n.config.dateRange||i,h=(new Date).getFullYear();h-a>l;)a+=100;return o.setFullYear(a)||t},t.tablesorter.addParser({id:"ddmmyy",is:function(){return!1},format:function(t,i){return e.formatDate(t,e.dates.regxxxxyy,"$2/$1/19$3",i)},type:"numeric"}),t.tablesorter.addParser({id:"mmddyy",is:function(){return!1},format:function(t,i){return e.formatDate(t,e.dates.regxxxxyy,"$1/$2/19$3",i)},type:"numeric"}),t.tablesorter.addParser({id:"yymmdd",is:function(){return!1},format:function(t,i){return e.formatDate(t,e.dates.regyyxxxx,"$2/$3/19$1",i)},type:"numeric"})}(jQuery);