!function(t){"use strict";var e=t.tablesorter;e.dates=t.extend({},e.dates,{monthCased:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]}),e.dates.monthLower=e.dates.monthCased.join(",").toLocaleLowerCase().split(","),e.addParser({id:"month",is:function(){return!1},format:function(i,s){var n=-1,r=s.config,o=r.ignoreCase?i.toLocaleLowerCase():i;return t.each(e.dates["month"+(r.ignoreCase?"Lower":"Cased")],function(t,e){0>n&&o.match(e)&&(n=t)}),0>n?i:n},type:"numeric"})}(jQuery);