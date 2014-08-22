/*!
	Copyright (C) 2011 T. Connell & Associates, Inc.

	Dual-licensed under the MIT and GPL licenses

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
	FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

	Resizable scroller widget for the jQuery tablesorter plugin

	Version 2.0 - modified by Rob Garrison 4/12/2013; updated 6/28/2014 (v2.17.3)
	Requires jQuery v1.7+
	Requires the tablesorter plugin, v2.8+, available at http://mottie.github.com/tablesorter/docs/

	Usage:

		$(function() {

			$('table.tablesorter').tablesorter({
				widgets: ['zebra', 'scroller'],
				widgetOptions : {
					scroller_height       : 300,  // height of scroll window
					scroller_barWidth     : 18,   // scroll bar width
					scroller_jumpToHeader : true, // header snap to browser top when scrolling the tbody
					scroller_idPrefix     : 's_'  // cloned thead id prefix (random number added to end)
				}
			});

		});

	Website: www.tconnell.com
*/
!function(t){"use strict";t.fn.hasScrollBar=function(){return this.get(0).scrollHeight>this.height()};var e=t.tablesorter;e.window_resize=function(){this.resize_timer&&clearTimeout(this.resize_timer),this.resize_timer=setTimeout(function(){t(this).trigger("resizeEnd")},250)},t(function(){var e="<style>.tablesorter-scroller-reset { width: auto !important; } .tablesorter-scroller { text-align: left; overflow: hidden;  }.tablesorter-scroller-header { overflow: hidden; }.tablesorter-scroller-header table.tablesorter { margin-bottom: 0; }.tablesorter-scroller-table { overflow-y: scroll; }.tablesorter-scroller-table table.tablesorter { margin-top: 0; overflow: scroll; } .tablesorter-scroller-table .tablesorter-filter-row, .tablesorter-scroller-table tfoot { display: none; }.tablesorter-scroller-table table.tablesorter thead tr.tablesorter-headerRow * {line-height:0;height:0;border:none;background-image:none;padding-top:0;padding-bottom:0;margin-top:0;margin-bottom:0;overflow:hidden;}</style>";t(e).appendTo("body")}),e.addWidget({id:"scroller",priority:60,options:{scroller_height:300,scroller_barWidth:18,scroller_jumpToHeader:!0,scroller_upAfterSort:!0,scroller_idPrefix:"s_"},init:function(i){var s=t(window);s.bind("resize",e.window_resize).bind("resizeEnd",function(){"function"==typeof i.config.widgetOptions.scroller_resizeWidth&&(s.unbind("resize",e.window_resize),i.config.widgetOptions.scroller_resizeWidth(),s.bind("resize",e.window_resize))})},format:function(i,s,n){var r,a,o,l,h,c,d=t(window),u=s.$table;s.isScrolling||(r=n.scroller_height||300,l=u.find("tbody").height(),0!==l&&r>l&&(r=l+10),o=n.scroller_id=n.scroller_idPrefix+Math.floor(1001*Math.random()),a=t('<table class="'+u.attr("class")+'" cellpadding=0 cellspacing=0><thead>'+u.find("thead:first").html()+"</thead></table>"),u.wrap('<div id="'+o+'" class="tablesorter-scroller" />').before(a).find(".tablesorter-filter-row").addClass("hideme"),c=a.wrap('<div class="tablesorter-scroller-header" style="width:'+u.width()+';" />').find("."+e.css.header),u.wrap('<div class="tablesorter-scroller-table" style="height:'+r+"px;width:"+u.width()+';" />'),e.bindEvents(i,c),u.hasClass("hasFilters")&&e.filter.bindSearch(u,a.find("."+e.css.filter)),h=function(){var e,i,s,r,l,h=t('div.scroller[id != "'+o+'"]').hide();u.find("thead").show(),u.addClass("tablesorter-scroller-reset").find("thead").find(".tablesorter-header-inner").addClass("tablesorter-scroller-reset"),e=u.parent(),e.addClass("tablesorter-scroller-reset"),e.parent().trigger("resize"),e.width(e.parent().innerWidth()-(e.parent().hasScrollBar()?n.scroller_barWidth:0)),l=e.innerWidth()-(e.hasScrollBar()?n.scroller_barWidth:0),u.width(l),a.width(l),a.parent().width(l),u.closest(".tablesorter-scroller").find(".tablesorter-scroller-reset").removeClass("tablesorter-scroller-reset"),i=parseInt(u.css("border-left-width"),10)+parseInt(u.css("border-right-width"),10),s=a.find("thead").children().children(),u.find("thead").children().children().each(function(e,n){r=t(n).find(".tablesorter-header-inner"),r.length&&(l=parseInt(r.css("min-width").replace("auto","0").replace(/(px|em)/,""),10),r.width()<l?r.width(l):l=r.width(),s.eq(e).find(".tablesorter-header-inner").width(l-i).parent().width(r.parent().width()-i))}),h.show()},n.scroller_resizeWidth=h,h(),u.find("thead").css("visibility","hidden"),s.isScrolling=!0,l=u.parent().parent().height(),u.parent().bind("scroll",function(){if(n.scroller_jumpToHeader){var e=d.scrollTop()-a.offset().top;0!==t(this).scrollTop()&&l>e&&e>0&&d.scrollTop(a.offset().top)}a.parent().scrollLeft(t(this).scrollLeft())})),n.scroller_upAfterSort&&u.parent().animate({scrollTop:0},"fast")},remove:function(t,e){var i=e.$table;i.closest(".tablesorter-scroller").find(".tablesorter-scroller-header").remove(),i.unwrap().find(".tablesorter-filter-row").removeClass("hideme").end().find("thead").show().css("visibility","visible"),e.isScrolling=!1}})}(jQuery);