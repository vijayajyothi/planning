!function(){function t(t,e){var i=e?j[oe]:j[ie];return i.test(t)?new s(t,e):null}function e(e,i){var s=t(e,i);return s?s.version:null}function i(e,i){var s=t(e,i);return s?s.version:null}function s(t,e){if(t instanceof s){if(t.loose===e)return t;t=t.version}if(!(this instanceof s))return new s(t,e);W("SemVer",t,e),this.loose=e;var i=t.trim().match(e?j[oe]:j[ie]);if(!i)throw new TypeError("Invalid Version: "+t);this.raw=t,this.major=+i[1],this.minor=+i[2],this.patch=+i[3],this.prerelease=i[4]?i[4].split(".").map(function(t){return/^[0-9]+$/.test(t)?+t:t}):[],this.build=i[5]?i[5].split("."):[],this.format()}function n(t,e,i){try{return new s(t,i).inc(e).version}catch(n){return null}}function o(t,e){var i=Ie.test(t),s=Ie.test(e);return i&&s&&(t=+t,e=+e),i&&!s?-1:s&&!i?1:e>t?-1:t>e?1:0}function r(t,e){return o(e,t)}function a(t,e,i){return new s(t,i).compare(e)}function l(t,e){return a(t,e,!0)}function h(t,e,i){return a(e,t,i)}function c(t,e){return t.sort(function(t,i){return $.compare(t,i,e)})}function d(t,e){return t.sort(function(t,i){return $.rcompare(t,i,e)})}function u(t,e,i){return a(t,e,i)>0}function p(t,e,i){return a(t,e,i)<0}function f(t,e,i){return 0===a(t,e,i)}function g(t,e,i){return 0!==a(t,e,i)}function m(t,e,i){return a(t,e,i)>=0}function v(t,e,i){return a(t,e,i)<=0}function b(t,e,i,s){var n;switch(e){case"===":n=t===i;break;case"!==":n=t!==i;break;case"":case"=":case"==":n=f(t,i,s);break;case"!=":n=g(t,i,s);break;case">":n=u(t,i,s);break;case">=":n=m(t,i,s);break;case"<":n=p(t,i,s);break;case"<=":n=v(t,i,s);break;default:throw new TypeError("Invalid operator: "+e)}return n}function y(t,e){if(t instanceof y){if(t.loose===e)return t;t=t.value}return this instanceof y?(W("comparator",t,e),this.loose=e,this.parse(t),void(this.value=this.semver===Ee?"":this.operator+this.semver.version)):new y(t,e)}function x(t,e){if(t instanceof x&&t.loose===e)return t;if(!(this instanceof x))return new x(t,e);if(this.loose=e,this.raw=t,this.set=t.split(/\s*\|\|\s*/).map(function(t){return this.parseRange(t.trim())},this).filter(function(t){return t.length}),!this.set.length)throw new TypeError("Invalid SemVer Range: "+t);this.format()}function w(t,e){return new x(t,e).set.map(function(t){return t.map(function(t){return t.value}).join(" ").trim().split(" ")})}function _(t,e){return W("comp",t),t=D(t,e),W("caret",t),t=C(t,e),W("tildes",t),t=P(t,e),W("xrange",t),t=A(t,e),W("stars",t),t}function k(t){return!t||"x"===t.toLowerCase()||"*"===t}function C(t,e){return t.trim().split(/\s+/).map(function(t){return T(t,e)}).join(" ")}function T(t,e){var i=e?j[ve]:j[me];return t.replace(i,function(e,i,s,n,o){W("tilde",t,e,i,s,n,o);var r;return k(i)?r="":k(s)?r=">="+i+".0.0-0 <"+(+i+1)+".0.0-0":k(n)?r=">="+i+"."+s+".0-0 <"+i+"."+(+s+1)+".0-0":o?(W("replaceTilde pr",o),"-"!==o.charAt(0)&&(o="-"+o),r=">="+i+"."+s+"."+n+o+" <"+i+"."+(+s+1)+".0-0"):r=">="+i+"."+s+"."+n+"-0 <"+i+"."+(+s+1)+".0-0",W("tilde return",r),r})}function D(t,e){return t.trim().split(/\s+/).map(function(t){return S(t,e)}).join(" ")}function S(t,e){var i=e?j[_e]:j[we];return t.replace(i,function(e,i,s,n,o){W("caret",t,e,i,s,n,o);var r;return k(i)?r="":k(s)?r=">="+i+".0.0-0 <"+(+i+1)+".0.0-0":k(n)?r="0"===i?">="+i+"."+s+".0-0 <"+i+"."+(+s+1)+".0-0":">="+i+"."+s+".0-0 <"+(+i+1)+".0.0-0":o?(W("replaceCaret pr",o),"-"!==o.charAt(0)&&(o="-"+o),r="0"===i?"0"===s?"="+i+"."+s+"."+n+o:">="+i+"."+s+"."+n+o+" <"+i+"."+(+s+1)+".0-0":">="+i+"."+s+"."+n+o+" <"+(+i+1)+".0.0-0"):r="0"===i?"0"===s?"="+i+"."+s+"."+n:">="+i+"."+s+"."+n+"-0 <"+i+"."+(+s+1)+".0-0":">="+i+"."+s+"."+n+"-0 <"+(+i+1)+".0.0-0",W("caret return",r),r})}function P(t,e){return W("replaceXRanges",t,e),t.split(/\s+/).map(function(t){return M(t,e)}).join(" ")}function M(t,e){t=t.trim();var i=e?j[ue]:j[de];return t.replace(i,function(e,i,s,n,o,r){W("xRange",t,e,i,s,n,o,r);var a=k(s),l=a||k(n),h=l||k(o),c=h;return"="===i&&c&&(i=""),i&&c?(a&&(s=0),l&&(n=0),h&&(o=0),">"===i&&(i=">=",a||(l?(s=+s+1,n=0,o=0):h&&(n=+n+1,o=0))),e=i+s+"."+n+"."+o+"-0"):a?e="*":l?e=">="+s+".0.0-0 <"+(+s+1)+".0.0-0":h&&(e=">="+s+"."+n+".0-0 <"+s+"."+(+n+1)+".0-0"),W("xRange return",e),e})}function A(t,e){return W("replaceStars",t,e),t.trim().replace(j[Me],"")}function I(t,e,i,s,n,o,r,a,l,h,c,d){return e=k(i)?"":k(s)?">="+i+".0.0-0":k(n)?">="+i+"."+s+".0-0":">="+e,a=k(l)?"":k(h)?"<"+(+l+1)+".0.0-0":k(c)?"<"+l+"."+(+h+1)+".0-0":d?"<="+l+"."+h+"."+c+"-"+d:"<="+a,(e+" "+a).trim()}function E(t,e){for(var i=0;i<t.length;i++)if(!t[i].test(e))return!1;return!0}function z(t,e,i){try{e=new x(e,i)}catch(s){return!1}return e.test(t)}function L(t,e,i){return t.filter(function(t){return z(t,e,i)}).sort(function(t,e){return h(t,e,i)})[0]||null}function N(t,e){try{return new x(t,e).range||"*"}catch(i){return null}}function H(t,e,i){return O(t,e,"<",i)}function R(t,e,i){return O(t,e,">",i)}function O(t,e,i,n){t=new s(t,n),e=new x(e,n);var o,r,a,l,h;switch(i){case">":o=u,r=v,a=p,l=">",h=">=";break;case"<":o=p,r=m,a=u,l="<",h="<=";break;default:throw new TypeError('Must provide a hilo val of "<" or ">"')}if(z(t,e,n))return!1;for(var c=0;c<e.set.length;++c){var d=e.set[c],f=null,g=null;if(d.forEach(function(t){f=f||t,g=g||t,o(t.semver,f.semver,n)?f=t:a(t.semver,g.semver,n)&&(g=t)}),f.operator===l||f.operator===h)return!1;if((!g.operator||g.operator===l)&&r(t,g.semver))return!1;if(g.operator===h&&a(t,g.semver))return!1}return!0}var W,F={exports:{}},$=F.exports=s;W="object"==typeof process&&process.env&&process.env.NODE_DEBUG&&/\bsemver\b/i.test(process.env.NODE_DEBUG)?function(){var t=Array.prototype.slice.call(arguments,0);t.unshift("SEMVER"),console.log.apply(console,t)}:function(){},$.SEMVER_SPEC_VERSION="2.0.0";var j=$.re=[],B=$.src=[],Y=0,V=Y++;B[V]="0|[1-9]\\d*";var X=Y++;B[X]="[0-9]+";var q=Y++;B[q]="\\d*[a-zA-Z-][a-zA-Z0-9-]*";var G=Y++;B[G]="("+B[V]+")\\.("+B[V]+")\\.("+B[V]+")";var U=Y++;B[U]="("+B[X]+")\\.("+B[X]+")\\.("+B[X]+")";var K=Y++;B[K]="(?:"+B[V]+"|"+B[q]+")";var Q=Y++;B[Q]="(?:"+B[X]+"|"+B[q]+")";var Z=Y++;B[Z]="(?:-("+B[K]+"(?:\\."+B[K]+")*))";var J=Y++;B[J]="(?:-?("+B[Q]+"(?:\\."+B[Q]+")*))";var te=Y++;B[te]="[0-9A-Za-z-]+";var ee=Y++;B[ee]="(?:\\+("+B[te]+"(?:\\."+B[te]+")*))";var ie=Y++,se="v?"+B[G]+B[Z]+"?"+B[ee]+"?";B[ie]="^"+se+"$";var ne="[v=\\s]*"+B[U]+B[J]+"?"+B[ee]+"?",oe=Y++;B[oe]="^"+ne+"$";var re=Y++;B[re]="((?:<|>)?=?)";var ae=Y++;B[ae]=B[X]+"|x|X|\\*";var le=Y++;B[le]=B[V]+"|x|X|\\*";var he=Y++;B[he]="[v=\\s]*("+B[le]+")(?:\\.("+B[le]+")(?:\\.("+B[le]+")(?:("+B[Z]+"))?)?)?";var ce=Y++;B[ce]="[v=\\s]*("+B[ae]+")(?:\\.("+B[ae]+")(?:\\.("+B[ae]+")(?:("+B[J]+"))?)?)?";var de=Y++;B[de]="^"+B[re]+"\\s*"+B[he]+"$";var ue=Y++;B[ue]="^"+B[re]+"\\s*"+B[ce]+"$";var pe=Y++;B[pe]="(?:~>?)";var fe=Y++;B[fe]="(\\s*)"+B[pe]+"\\s+",j[fe]=new RegExp(B[fe],"g");var ge="$1~",me=Y++;B[me]="^"+B[pe]+B[he]+"$";var ve=Y++;B[ve]="^"+B[pe]+B[ce]+"$";var be=Y++;B[be]="(?:\\^)";var ye=Y++;B[ye]="(\\s*)"+B[be]+"\\s+",j[ye]=new RegExp(B[ye],"g");var xe="$1^",we=Y++;B[we]="^"+B[be]+B[he]+"$";var _e=Y++;B[_e]="^"+B[be]+B[ce]+"$";var ke=Y++;B[ke]="^"+B[re]+"\\s*("+ne+")$|^$";var Ce=Y++;B[Ce]="^"+B[re]+"\\s*("+se+")$|^$";var Te=Y++;B[Te]="(\\s*)"+B[re]+"\\s*("+ne+"|"+B[he]+")",j[Te]=new RegExp(B[Te],"g");var De="$1$2$3",Se=Y++;B[Se]="^\\s*("+B[he]+")\\s+-\\s+("+B[he]+")\\s*$";var Pe=Y++;B[Pe]="^\\s*("+B[ce]+")\\s+-\\s+("+B[ce]+")\\s*$";var Me=Y++;B[Me]="(<|>)?=?\\s*\\*";for(var Ae=0;Y>Ae;Ae++)W(Ae,B[Ae]),j[Ae]||(j[Ae]=new RegExp(B[Ae]));$.parse=t,$.valid=e,$.clean=i,window.semver=$.SemVer=s,s.prototype.format=function(){return this.version=this.major+"."+this.minor+"."+this.patch,this.prerelease.length&&(this.version+="-"+this.prerelease.join(".")),this.version},s.prototype.inspect=function(){return'<SemVer "'+this+'">'},s.prototype.toString=function(){return this.version},s.prototype.compare=function(t){return W("SemVer.compare",this.version,this.loose,t),t instanceof s||(t=new s(t,this.loose)),this.compareMain(t)||this.comparePre(t)},s.prototype.compareMain=function(t){return t instanceof s||(t=new s(t,this.loose)),o(this.major,t.major)||o(this.minor,t.minor)||o(this.patch,t.patch)},s.prototype.comparePre=function(t){if(t instanceof s||(t=new s(t,this.loose)),this.prerelease.length&&!t.prerelease.length)return-1;if(!this.prerelease.length&&t.prerelease.length)return 1;if(!this.prerelease.lenth&&!t.prerelease.length)return 0;var e=0;do{var i=this.prerelease[e],n=t.prerelease[e];if(W("prerelease compare",e,i,n),void 0===i&&void 0===n)return 0;if(void 0===n)return 1;if(void 0===i)return-1;if(i!==n)return o(i,n)}while(++e)},s.prototype.inc=function(t){switch(t){case"major":this.major++,this.minor=-1;case"minor":this.minor++,this.patch=-1;case"patch":this.patch++,this.prerelease=[];break;case"prerelease":if(0===this.prerelease.length)this.prerelease=[0];else{for(var e=this.prerelease.length;--e>=0;)"number"==typeof this.prerelease[e]&&(this.prerelease[e]++,e=-2);-1===e&&this.prerelease.push(0)}break;default:throw new Error("invalid increment argument: "+t)}return this.format(),this},$.inc=n,$.compareIdentifiers=o;var Ie=/^[0-9]+$/;$.rcompareIdentifiers=r,$.compare=a,$.compareLoose=l,$.rcompare=h,$.sort=c,$.rsort=d,$.gt=u,$.lt=p,$.eq=f,$.neq=g,$.gte=m,$.lte=v,$.cmp=b,$.Comparator=y;var Ee={};y.prototype.parse=function(t){var e=this.loose?j[ke]:j[Ce],i=t.match(e);if(!i)throw new TypeError("Invalid comparator: "+t);this.operator=i[1],i[2]?(this.semver=new s(i[2],this.loose),"<"!==this.operator||this.semver.prerelease.length||(this.semver.prerelease=["0"],this.semver.format())):this.semver=Ee},y.prototype.inspect=function(){return'<SemVer Comparator "'+this+'">'},y.prototype.toString=function(){return this.value},y.prototype.test=function(t){return W("Comparator.test",t,this.loose),this.semver===Ee?!0:b(t,this.operator,this.semver,this.loose)},$.Range=x,x.prototype.inspect=function(){return'<SemVer Range "'+this.range+'">'},x.prototype.format=function(){return this.range=this.set.map(function(t){return t.join(" ").trim()}).join("||").trim(),this.range},x.prototype.toString=function(){return this.range},x.prototype.parseRange=function(t){var e=this.loose;t=t.trim(),W("range",t,e);var i=e?j[Pe]:j[Se];t=t.replace(i,I),W("hyphen replace",t),t=t.replace(j[Te],De),W("comparator trim",t,j[Te]),t=t.replace(j[fe],ge),t=t.replace(j[ye],xe),t=t.split(/\s+/).join(" ");var s=e?j[ke]:j[Ce],n=t.split(" ").map(function(t){return _(t,e)}).join(" ").split(/\s+/);return this.loose&&(n=n.filter(function(t){return!!t.match(s)})),n=n.map(function(t){return new y(t,e)})},$.toComparators=w,x.prototype.test=function(t){if(!t)return!1;for(var e=0;e<this.set.length;e++)if(E(this.set[e],t))return!0;return!1},$.satisfies=z,$.maxSatisfying=L,$.validRange=N,$.ltr=H,$.gtr=R,$.outside=O,"function"==typeof define&&define.amd&&define($)}();