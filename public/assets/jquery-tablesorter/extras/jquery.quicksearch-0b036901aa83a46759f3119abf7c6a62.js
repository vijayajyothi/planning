!function(t,e){t.fn.quicksearch=function(i,s){var n,o,a,r,l="",h=this,c=t.extend({delay:100,selector:null,stripeRows:null,loader:null,noResults:"",childRow:"tablesorter-childRow",matchedResultsCount:0,bind:"keyup",onBefore:function(){},onAfter:function(){},show:function(){this.style.display=""},hide:function(){this.style.display="none"},prepareQuery:function(t){return t.toLowerCase().split(" ")},testQuery:function(t,e){for(var i=0;i<t.length;i+=1)if(-1===e.indexOf(t[i]))return!1;return!0}},s);return this.go=function(){for(var e=0,i=0,s=!0,n=c.prepareQuery(l),r=0===l.replace(" ","").length,e=0,h=a.length;h>e;e++)r||c.testQuery(n,o[e],a[e])||t(a[e]).hasClass(c.childRow)&&t(a[e>1?e-1:0]).is(":visible")?(c.show.apply(a[e]),s=!1,i++):c.hide.apply(a[e]);return s?this.results(!1):(this.results(!0),this.stripe()),this.matchedResultsCount=i,this.loader(!1),c.onAfter(),this},this.search=function(t){l=t,h.trigger()},this.currentMatchedResults=function(){return this.matchedResultsCount},this.stripe=function(){if("object"==typeof c.stripeRows&&null!==c.stripeRows){var e=c.stripeRows.join(" "),i=c.stripeRows.length;r.not(":hidden").each(function(s){t(this).removeClass(e).addClass(c.stripeRows[s%i])})}return this},this.strip_html=function(e){var i=e.replace(new RegExp("<[^<]+>","g"),"");return i=t.trim(i.toLowerCase())},this.results=function(e){return"string"==typeof c.noResults&&""!==c.noResults&&(e?t(c.noResults).hide():t(c.noResults).show()),this},this.loader=function(e){return"string"==typeof c.loader&&""!==c.loader&&(e?t(c.loader).show():t(c.loader).hide()),this},this.cache=function(){r=t(i),"string"==typeof c.noResults&&""!==c.noResults&&(r=r.not(c.noResults));var e="string"==typeof c.selector?r.find(c.selector):t(i).not(c.noResults);return o=e.map(function(){return h.strip_html(this.innerHTML)}),a=r.map(function(){return this}),l=l||this.val()||"",this.go()},this.trigger=function(){return this.loader(!0),c.onBefore(),e.clearTimeout(n),n=e.setTimeout(function(){h.go()},c.delay),this},this.cache(),this.results(!0),this.stripe(),this.loader(!1),this.each(function(){t(this).on(c.bind,function(){l=t(this).val(),h.trigger()})})}}(jQuery,this,document);