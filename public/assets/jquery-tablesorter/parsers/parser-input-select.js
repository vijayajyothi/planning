!function(t){"use strict";var e=!0,i=function(){};t.tablesorter.addParser({id:"inputs",is:function(){return!1},format:function(e,i,s){return t(s).find("input").val()||e},parsed:!0,type:"text"}),t.tablesorter.addParser({id:"checkbox",is:function(){return!1},format:function(e,i,s,n){var r=t(s),a=r.find('input[type="checkbox"]'),o=a.length?a[0].checked:"";return r.closest("tr").toggleClass("checked-"+n,o),a.length?o?"checked":"unchecked":e},parsed:!0,type:"text"}),t.tablesorter.addParser({id:"select",is:function(){return!1},format:function(e,i,s){return t(s).find("select").val()||e},parsed:!0,type:"text"}),t.tablesorter.addParser({id:"select-text",is:function(){return!1},format:function(e,i,s){var n=t(s).find("select");return n.length?n.find("option:selected").text()||"":e},parsed:!0,type:"text"}),t.tablesorter.addParser({id:"textarea",is:function(){return!1},format:function(e,i,s){return t(s).find("textarea").val()||e},parsed:!0,type:"text"}),t(function(){t("table").on("tablesorter-initialized",function(){var s=!1,n=function(){t(":focus").blur()};t(this).children("tbody").on("mouseleave",function(){n()}).on("focus","select, input, textarea",function(){s=!0,t(this).data("ts-original-value",this.value)}).on("blur","input, textarea",function(){this.value=t(this).data("ts-original-value")}).on("change keyup","select, input, textarea",function(r){if(27===r.which)return void(this.value=t(this).data("ts-original-value"));if("change"===r.type&&s||"keyup"===r.type&&13===r.which&&("INPUT"===r.target.tagName||"TEXTAREA"===r.target.tagName&&r.altKey)){var a=t(r.target),o=a.closest("td"),l=o.closest("table"),h=o[0].cellIndex,c=l[0].config||!1,d=c&&c.$headers&&c.$headers.eq(h);if(!c||d&&d.length&&(d.hasClass("parser-false")||d.hasClass("sorter-false")&&d.hasClass("filter-false")))return n();a.val()!==a.data("ts-original-value")&&(a.data("ts-original-value",a.val()),l.trigger("updateCell",[a.closest("td"),e,function(){i(r,l,a),setTimeout(function(){s=!1},10)}]))}})})})}(jQuery);