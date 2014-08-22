/* ========================================================
 * bootstrap-tab.js v2.3.2
 * http://twitter.github.com/bootstrap/javascript.html#tabs
 * ========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ======================================================== */
!function(t){"use strict";var e=function(e){this.element=t(e)};e.prototype={constructor:e,show:function(){var e,i,n,s=this.element,r=s.closest("ul:not(.dropdown-menu)"),o=s.attr("data-target");o||(o=s.attr("href"),o=o&&o.replace(/.*(?=#[^\s]*$)/,"")),s.parent("li").hasClass("active")||(e=r.find(".active:last a")[0],n=t.Event("show",{relatedTarget:e}),s.trigger(n),n.isDefaultPrevented()||(i=t(o),this.activate(s.parent("li"),r),this.activate(i,i.parent(),function(){s.trigger({type:"shown",relatedTarget:e})})))},activate:function(e,i,n){function s(){r.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),e.addClass("active"),o?(e[0].offsetWidth,e.addClass("in")):e.removeClass("fade"),e.parent(".dropdown-menu")&&e.closest("li.dropdown").addClass("active"),n&&n()}var r=i.find("> .active"),o=n&&t.support.transition&&r.hasClass("fade");o?r.one(t.support.transition.end,s):s(),r.removeClass("in")}};var i=t.fn.tab;t.fn.tab=function(i){return this.each(function(){var n=t(this),s=n.data("tab");s||n.data("tab",s=new e(this)),"string"==typeof i&&s[i]()})},t.fn.tab.Constructor=e,t.fn.tab.noConflict=function(){return t.fn.tab=i,this},t(document).on("click.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(e){e.preventDefault(),t(this).tab("show")})}(window.jQuery);