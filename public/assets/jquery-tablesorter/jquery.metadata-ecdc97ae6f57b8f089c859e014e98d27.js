/*
 * Metadata - jQuery plugin for parsing metadata from elements
 *
 * Copyright (c) 2006 John Resig, Yehuda Katz, Jörn Zaefferer, Paul McLanahan
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 *
 */
!function($){$.extend({metadata:{defaults:{type:"class",name:"metadata",cre:/(\{.*\})/,single:"metadata"},setType:function(t,e){this.defaults.type=t,this.defaults.name=e},get:function(elem,opts){var data,m,e,attr,settings=$.extend({},this.defaults,opts);if(settings.single.length||(settings.single="metadata"),data=$.data(elem,settings.single))return data;if(data="{}","class"===settings.type)m=settings.cre.exec(elem.className),m&&(data=m[1]);else if("elem"===settings.type){if(!elem.getElementsByTagName)return void 0;e=elem.getElementsByTagName(settings.name),e.length&&(data=$.trim(e[0].innerHTML))}else void 0!==elem.getAttribute&&(attr=elem.getAttribute(settings.name),attr&&(data=attr));return data.indexOf("{")<0&&(data="{"+data+"}"),data=eval("("+data+")"),$.data(elem,settings.single,data),data}}}),$.fn.metadata=function(t){return $.metadata.get(this[0],t)}}(jQuery);