/*!art-template - Template Engine | http://aui.github.com/artTemplate/*/
!function(){function a(a){return a.replace(t,"").replace(u,",").replace(v,"").replace(w,"").replace(x,"").split(y)}function b(a){return"'"+a.replace(/('|\\)/g,"\\$1").replace(/\r/g,"\\r").replace(/\n/g,"\\n")+"'"}function c(c,d){function e(a){return m+=a.split(/\n/).length-1,k&&(a=a.replace(/\s+/g," ").replace(/<!--[\w\W]*?-->/g,"")),a&&(a=s[1]+b(a)+s[2]+"\n"),a}function f(b){var c=m;if(j?b=j(b,d):g&&(b=b.replace(/\n/g,function(){return m++,"$line="+m+";"})),0===b.indexOf("=")){var e=l&&!/^=[=#]/.test(b);if(b=b.replace(/^=[=#]?|[\s;]*$/g,""),e){var f=b.replace(/\s*\([^\)]+\)/,"");n[f]||/^(include|print)$/.test(f)||(b="$escape("+b+")")}else b="$string("+b+")";b=s[1]+b+s[2]}return g&&(b="$line="+c+";"+b),r(a(b),function(a){if(a&&!p[a]){var b;b="print"===a?u:"include"===a?v:n[a]?"$utils."+a:o[a]?"$helpers."+a:"$data."+a,w+=a+"="+b+",",p[a]=!0}}),b+"\n"}var g=d.debug,h=d.openTag,i=d.closeTag,j=d.parser,k=d.compress,l=d.escape,m=1,p={$data:1,$filename:1,$utils:1,$helpers:1,$out:1,$line:1},q="".trim,s=q?["$out='';","$out+=",";","$out"]:["$out=[];","$out.push(",");","$out.join('')"],t=q?"$out+=text;return $out;":"$out.push(text);",u="function(){var text=''.concat.apply('',arguments);"+t+"}",v="function(filename,data){data=data||$data;var text=$utils.$include(filename,data,$filename);"+t+"}",w="'use strict';var $utils=this,$helpers=$utils.$helpers,"+(g?"$line=0,":""),x=s[0],y="return new String("+s[3]+");";r(c.split(h),function(a){a=a.split(i);var b=a[0],c=a[1];1===a.length?x+=e(b):(x+=f(b),c&&(x+=e(c)))});var z=w+x+y;g&&(z="try{"+z+"}catch(e){throw {filename:$filename,name:'Render Error',message:e.message,line:$line,source:"+b(c)+".split(/\\n/)[$line-1].replace(/^\\s+/,'')};}");try{var A=new Function("$data","$filename",z);return A.prototype=n,A}catch(B){throw B.temp="function anonymous($data,$filename) {"+z+"}",B}}var d=function(a,b){return"string"==typeof b?q(b,{filename:a}):g(a,b)};d.version="3.0.0",d.config=function(a,b){e[a]=b};var e=d.defaults={openTag:"<%",closeTag:"%>",escape:!0,cache:!0,compress:!1,parser:null},f=d.cache={};d.render=function(a,b){return q(a,b)};var g=d.renderFile=function(a,b){var c=d.get(a)||p({filename:a,name:"Render Error",message:"Template not found"});return b?c(b):c};d.get=function(a){var b;if(f[a])b=f[a];else if("object"==typeof document){var c=document.getElementById(a);if(c){var d=(c.value||c.innerHTML).replace(/^\s*|\s*$/g,"");b=q(d,{filename:a})}}return b};var h=function(a,b){return"string"!=typeof a&&(b=typeof a,"number"===b?a+="":a="function"===b?h(a.call(a)):""),a},i={"<":"&#60;",">":"&#62;",'"':"&#34;","'":"&#39;","&":"&#38;"},j=function(a){return i[a]},k=function(a){return h(a).replace(/&(?![\w#]+;)|[<>"']/g,j)},l=Array.isArray||function(a){return"[object Array]"==={}.toString.call(a)},m=function(a,b){var c,d;if(l(a))for(c=0,d=a.length;d>c;c++)b.call(a,a[c],c,a);else for(c in a)b.call(a,a[c],c)},n=d.utils={$helpers:{},$include:g,$string:h,$escape:k,$each:m};d.helper=function(a,b){o[a]=b};var o=d.helpers=n.$helpers;d.onerror=function(a){var b="Template Error\n\n";for(var c in a)b+="<"+c+">\n"+a[c]+"\n\n";"object"==typeof console&&console.error(b)};var p=function(a){return d.onerror(a),function(){return"{Template Error}"}},q=d.compile=function(a,b){function d(c){try{return new i(c,h)+""}catch(d){return b.debug?p(d)():(b.debug=!0,q(a,b)(c))}}b=b||{};for(var g in e)void 0===b[g]&&(b[g]=e[g]);var h=b.filename;try{var i=c(a,b)}catch(j){return j.filename=h||"anonymous",j.name="Syntax Error",p(j)}return d.prototype=i.prototype,d.toString=function(){return i.toString()},h&&b.cache&&(f[h]=d),d},r=n.$each,s="break,case,catch,continue,debugger,default,delete,do,else,false,finally,for,function,if,in,instanceof,new,null,return,switch,this,throw,true,try,typeof,var,void,while,with,abstract,boolean,byte,char,class,const,double,enum,export,extends,final,float,goto,implements,import,int,interface,long,native,package,private,protected,public,short,static,super,synchronized,throws,transient,volatile,arguments,let,yield,undefined",t=/\/\*[\w\W]*?\*\/|\/\/[^\n]*\n|\/\/[^\n]*$|"(?:[^"\\]|\\[\w\W])*"|'(?:[^'\\]|\\[\w\W])*'|\s*\.\s*[$\w\.]+/g,u=/[^\w$]+/g,v=new RegExp(["\\b"+s.replace(/,/g,"\\b|\\b")+"\\b"].join("|"),"g"),w=/^\d[^,]*|,\d[^,]*/g,x=/^,+|,+$/g,y=/^$|,+/;e.openTag="{{",e.closeTag="}}";var z=function(a,b){var c=b.split(":"),d=c.shift(),e=c.join(":")||"";return e&&(e=", "+e),"$helpers."+d+"("+a+e+")"};e.parser=function(a){a=a.replace(/^\s/,"");var b=a.split(" "),c=b.shift(),e=b.join(" ");switch(c){case"if":a="if("+e+"){";break;case"else":b="if"===b.shift()?" if("+b.join(" ")+")":"",a="}else"+b+"{";break;case"/if":a="}";break;case"each":var f=b[0]||"$data",g=b[1]||"as",h=b[2]||"$value",i=b[3]||"$index",j=h+","+i;"as"!==g&&(f="[]"),a="$each("+f+",function("+j+"){";break;case"/each":a="});";break;case"echo":a="print("+e+");";break;case"print":case"include":a=c+"("+b.join(",")+");";break;default:if(/^\s*\|\s*[\w\$]/.test(e)){var k=!0;0===a.indexOf("#")&&(a=a.substr(1),k=!1);for(var l=0,m=a.split("|"),n=m.length,o=m[l++];n>l;l++)o=z(o,m[l]);a=(k?"=":"=#")+o}else a=d.helpers[c]?"=#"+c+"("+b.join(",")+");":"="+a}return a},"function"==typeof define?define(function(){return d}):"undefined"!=typeof exports?module.exports=d:this.template=d}();
/*! JSON v3.3.2 | http://bestiejs.github.io/json3 | Copyright 2012-2014, Kit Cambridge | http://kit.mit-license.org */
(function(){function N(p,r){function q(a){if(q[a]!==w)return q[a];var c;if("bug-string-char-index"==a)c="a"!="a"[0];else if("json"==a)c=q("json-stringify")&&q("json-parse");else{var e;if("json-stringify"==a){c=r.stringify;var b="function"==typeof c&&s;if(b){(e=function(){return 1}).toJSON=e;try{b="0"===c(0)&&"0"===c(new t)&&'""'==c(new A)&&c(u)===w&&c(w)===w&&c()===w&&"1"===c(e)&&"[1]"==c([e])&&"[null]"==c([w])&&"null"==c(null)&&"[null,null,null]"==c([w,u,null])&&'{"a":[1,true,false,null,"\\u0000\\b\\n\\f\\r\\t"]}'==
    c({a:[e,!0,!1,null,"\x00\b\n\f\r\t"]})&&"1"===c(null,e)&&"[\n 1,\n 2\n]"==c([1,2],null,1)&&'"-271821-04-20T00:00:00.000Z"'==c(new C(-864E13))&&'"+275760-09-13T00:00:00.000Z"'==c(new C(864E13))&&'"-000001-01-01T00:00:00.000Z"'==c(new C(-621987552E5))&&'"1969-12-31T23:59:59.999Z"'==c(new C(-1))}catch(f){b=!1}}c=b}if("json-parse"==a){c=r.parse;if("function"==typeof c)try{if(0===c("0")&&!c(!1)){e=c('{"a":[1,true,false,null,"\\u0000\\b\\n\\f\\r\\t"]}');var n=5==e.a.length&&1===e.a[0];if(n){try{n=!c('"\t"')}catch(d){}if(n)try{n=
    1!==c("01")}catch(g){}if(n)try{n=1!==c("1.")}catch(m){}}}}catch(X){n=!1}c=n}}return q[a]=!!c}p||(p=k.Object());r||(r=k.Object());var t=p.Number||k.Number,A=p.String||k.String,H=p.Object||k.Object,C=p.Date||k.Date,G=p.SyntaxError||k.SyntaxError,K=p.TypeError||k.TypeError,L=p.Math||k.Math,I=p.JSON||k.JSON;"object"==typeof I&&I&&(r.stringify=I.stringify,r.parse=I.parse);var H=H.prototype,u=H.toString,v,B,w,s=new C(-0xc782b5b800cec);try{s=-109252==s.getUTCFullYear()&&0===s.getUTCMonth()&&1===s.getUTCDate()&&
    10==s.getUTCHours()&&37==s.getUTCMinutes()&&6==s.getUTCSeconds()&&708==s.getUTCMilliseconds()}catch(Q){}if(!q("json")){var D=q("bug-string-char-index");if(!s)var x=L.floor,M=[0,31,59,90,120,151,181,212,243,273,304,334],E=function(a,c){return M[c]+365*(a-1970)+x((a-1969+(c=+(1<c)))/4)-x((a-1901+c)/100)+x((a-1601+c)/400)};(v=H.hasOwnProperty)||(v=function(a){var c={},e;(c.__proto__=null,c.__proto__={toString:1},c).toString!=u?v=function(a){var c=this.__proto__;a=a in(this.__proto__=null,this);this.__proto__=
    c;return a}:(e=c.constructor,v=function(a){var c=(this.constructor||e).prototype;return a in this&&!(a in c&&this[a]===c[a])});c=null;return v.call(this,a)});B=function(a,c){var e=0,b,f,n;(b=function(){this.valueOf=0}).prototype.valueOf=0;f=new b;for(n in f)v.call(f,n)&&e++;b=f=null;e?B=2==e?function(a,c){var e={},b="[object Function]"==u.call(a),f;for(f in a)b&&"prototype"==f||v.call(e,f)||!(e[f]=1)||!v.call(a,f)||c(f)}:function(a,c){var e="[object Function]"==u.call(a),b,f;for(b in a)e&&"prototype"==
    b||!v.call(a,b)||(f="constructor"===b)||c(b);(f||v.call(a,b="constructor"))&&c(b)}:(f="valueOf toString toLocaleString propertyIsEnumerable isPrototypeOf hasOwnProperty constructor".split(" "),B=function(a,c){var e="[object Function]"==u.call(a),b,h=!e&&"function"!=typeof a.constructor&&F[typeof a.hasOwnProperty]&&a.hasOwnProperty||v;for(b in a)e&&"prototype"==b||!h.call(a,b)||c(b);for(e=f.length;b=f[--e];h.call(a,b)&&c(b));});return B(a,c)};if(!q("json-stringify")){var U={92:"\\\\",34:'\\"',8:"\\b",
    12:"\\f",10:"\\n",13:"\\r",9:"\\t"},y=function(a,c){return("000000"+(c||0)).slice(-a)},R=function(a){for(var c='"',b=0,h=a.length,f=!D||10<h,n=f&&(D?a.split(""):a);b<h;b++){var d=a.charCodeAt(b);switch(d){case 8:case 9:case 10:case 12:case 13:case 34:case 92:c+=U[d];break;default:if(32>d){c+="\\u00"+y(2,d.toString(16));break}c+=f?n[b]:a.charAt(b)}}return c+'"'},O=function(a,c,b,h,f,n,d){var g,m,k,l,p,r,s,t,q;try{g=c[a]}catch(z){}if("object"==typeof g&&g)if(m=u.call(g),"[object Date]"!=m||v.call(g,
    "toJSON"))"function"==typeof g.toJSON&&("[object Number]"!=m&&"[object String]"!=m&&"[object Array]"!=m||v.call(g,"toJSON"))&&(g=g.toJSON(a));else if(g>-1/0&&g<1/0){if(E){l=x(g/864E5);for(m=x(l/365.2425)+1970-1;E(m+1,0)<=l;m++);for(k=x((l-E(m,0))/30.42);E(m,k+1)<=l;k++);l=1+l-E(m,k);p=(g%864E5+864E5)%864E5;r=x(p/36E5)%24;s=x(p/6E4)%60;t=x(p/1E3)%60;p%=1E3}else m=g.getUTCFullYear(),k=g.getUTCMonth(),l=g.getUTCDate(),r=g.getUTCHours(),s=g.getUTCMinutes(),t=g.getUTCSeconds(),p=g.getUTCMilliseconds();
    g=(0>=m||1E4<=m?(0>m?"-":"+")+y(6,0>m?-m:m):y(4,m))+"-"+y(2,k+1)+"-"+y(2,l)+"T"+y(2,r)+":"+y(2,s)+":"+y(2,t)+"."+y(3,p)+"Z"}else g=null;b&&(g=b.call(c,a,g));if(null===g)return"null";m=u.call(g);if("[object Boolean]"==m)return""+g;if("[object Number]"==m)return g>-1/0&&g<1/0?""+g:"null";if("[object String]"==m)return R(""+g);if("object"==typeof g){for(a=d.length;a--;)if(d[a]===g)throw K();d.push(g);q=[];c=n;n+=f;if("[object Array]"==m){k=0;for(a=g.length;k<a;k++)m=O(k,g,b,h,f,n,d),q.push(m===w?"null":
    m);a=q.length?f?"[\n"+n+q.join(",\n"+n)+"\n"+c+"]":"["+q.join(",")+"]":"[]"}else B(h||g,function(a){var c=O(a,g,b,h,f,n,d);c!==w&&q.push(R(a)+":"+(f?" ":"")+c)}),a=q.length?f?"{\n"+n+q.join(",\n"+n)+"\n"+c+"}":"{"+q.join(",")+"}":"{}";d.pop();return a}};r.stringify=function(a,c,b){var h,f,n,d;if(F[typeof c]&&c)if("[object Function]"==(d=u.call(c)))f=c;else if("[object Array]"==d){n={};for(var g=0,k=c.length,l;g<k;l=c[g++],(d=u.call(l),"[object String]"==d||"[object Number]"==d)&&(n[l]=1));}if(b)if("[object Number]"==
    (d=u.call(b))){if(0<(b-=b%1))for(h="",10<b&&(b=10);h.length<b;h+=" ");}else"[object String]"==d&&(h=10>=b.length?b:b.slice(0,10));return O("",(l={},l[""]=a,l),f,n,h,"",[])}}if(!q("json-parse")){var V=A.fromCharCode,W={92:"\\",34:'"',47:"/",98:"\b",116:"\t",110:"\n",102:"\f",114:"\r"},b,J,l=function(){b=J=null;throw G();},z=function(){for(var a=J,c=a.length,e,h,f,k,d;b<c;)switch(d=a.charCodeAt(b),d){case 9:case 10:case 13:case 32:b++;break;case 123:case 125:case 91:case 93:case 58:case 44:return e=
    D?a.charAt(b):a[b],b++,e;case 34:e="@";for(b++;b<c;)if(d=a.charCodeAt(b),32>d)l();else if(92==d)switch(d=a.charCodeAt(++b),d){case 92:case 34:case 47:case 98:case 116:case 110:case 102:case 114:e+=W[d];b++;break;case 117:h=++b;for(f=b+4;b<f;b++)d=a.charCodeAt(b),48<=d&&57>=d||97<=d&&102>=d||65<=d&&70>=d||l();e+=V("0x"+a.slice(h,b));break;default:l()}else{if(34==d)break;d=a.charCodeAt(b);for(h=b;32<=d&&92!=d&&34!=d;)d=a.charCodeAt(++b);e+=a.slice(h,b)}if(34==a.charCodeAt(b))return b++,e;l();default:h=
    b;45==d&&(k=!0,d=a.charCodeAt(++b));if(48<=d&&57>=d){for(48==d&&(d=a.charCodeAt(b+1),48<=d&&57>=d)&&l();b<c&&(d=a.charCodeAt(b),48<=d&&57>=d);b++);if(46==a.charCodeAt(b)){for(f=++b;f<c&&(d=a.charCodeAt(f),48<=d&&57>=d);f++);f==b&&l();b=f}d=a.charCodeAt(b);if(101==d||69==d){d=a.charCodeAt(++b);43!=d&&45!=d||b++;for(f=b;f<c&&(d=a.charCodeAt(f),48<=d&&57>=d);f++);f==b&&l();b=f}return+a.slice(h,b)}k&&l();if("true"==a.slice(b,b+4))return b+=4,!0;if("false"==a.slice(b,b+5))return b+=5,!1;if("null"==a.slice(b,
        b+4))return b+=4,null;l()}return"$"},P=function(a){var c,b;"$"==a&&l();if("string"==typeof a){if("@"==(D?a.charAt(0):a[0]))return a.slice(1);if("["==a){for(c=[];;b||(b=!0)){a=z();if("]"==a)break;b&&(","==a?(a=z(),"]"==a&&l()):l());","==a&&l();c.push(P(a))}return c}if("{"==a){for(c={};;b||(b=!0)){a=z();if("}"==a)break;b&&(","==a?(a=z(),"}"==a&&l()):l());","!=a&&"string"==typeof a&&"@"==(D?a.charAt(0):a[0])&&":"==z()||l();c[a.slice(1)]=P(z())}return c}l()}return a},T=function(a,b,e){e=S(a,b,e);e===
w?delete a[b]:a[b]=e},S=function(a,b,e){var h=a[b],f;if("object"==typeof h&&h)if("[object Array]"==u.call(h))for(f=h.length;f--;)T(h,f,e);else B(h,function(a){T(h,a,e)});return e.call(a,b,h)};r.parse=function(a,c){var e,h;b=0;J=""+a;e=P(z());"$"!=z()&&l();b=J=null;return c&&"[object Function]"==u.call(c)?S((h={},h[""]=e,h),"",c):e}}}r.runInContext=N;return r}var K=typeof define==="function"&&define.amd,F={"function":!0,object:!0},G=F[typeof exports]&&exports&&!exports.nodeType&&exports,k=F[typeof window]&&
    window||this,t=G&&F[typeof module]&&module&&!module.nodeType&&"object"==typeof global&&global;!t||t.global!==t&&t.window!==t&&t.self!==t||(k=t);if(G&&!K)N(k,G);else{var L=k.JSON,Q=k.JSON3,M=!1,A=N(k,k.JSON3={noConflict:function(){M||(M=!0,k.JSON=L,k.JSON3=Q,L=Q=null);return A}});k.JSON={parse:A.parse,stringify:A.stringify}}K&&define(function(){return A})}).call(this);

if(!window.App){
    window.App = {};
}

App.BomHelper = {
    "isNative": function(nd,p){
        return p in document.createElement(nd) ? true: false;
    },
    "getParam": function(p){
        var params = {},
            decodeFn = decodeURIComponent,
            arr = null,
            tmp = null,
            str = document.location.search;
        if(str){
            str = str.substring(1);
            arr = str.split("&");
            for(var i=0,len = arr.length; i< len; i++){
                tmp = arr[i].split('=');
                params[tmp[0]] = decodeFn(tmp[1]);
            }
            if(p){
                return params[p];
            }else{
                return params;
            }
        }
        return null;
    },
    "docSize": {"width":document.documentElement.scrollWidth,"height":document.documentElement.scrollHeight},
    "viewSize": {"width":document.documentElement.clientWidth,"height":document.documentElement.clientHeight}
};

/**
 基本的格式化工具集。
 */
App.Format = {
    /**
     * Truncate a string and add an ellipsis ('...') to the end if it exceeds the specified length
     * @param {String} value The string to truncate
     * @param {Number} length The maximum length to allow before truncating
     * @return {String} The converted text
     */
    ellipsis : function(value, len){
        if(value && value.length > len){
            return value.substr(0, len-3)+"...";
        }
        return value;
    },


    /**
     * Convert certain characters (&, <, >, and ') to their HTML character equivalents for literal display in web pages.
     * @param {String} value The string to encode
     * @return {String} The encoded text
     */
    htmlEncode : function(value){
        return !value ? value : String(value).replace(/&/g, "&amp;").replace(/>/g, "&gt;").replace(/</g, "&lt;").replace(/"/g, "&quot;");
    },

    /**
     * Convert certain characters (&, <, >, and ') from their HTML character equivalents.
     * @param {String} value The string to decode
     * @return {String} The decoded text
     */
    htmlDecode : function(value){
        return !value ? value : String(value).replace(/&gt;/g, ">").replace(/&lt;/g, "<").replace(/&quot;/g, '"').replace(/&amp;/g, "&");
    },


    /**
     * Converts the first character only of a string to upper case
     * @param {String} value The text to convert
     * @return {String} The converted text
     */
    capitalize : function(value){
        return !value ? value : value.charAt(0).toUpperCase() + value.substr(1).toLowerCase();
    },

    // private
    call : function(value, fn){
        if(arguments.length > 2){
            var args = Array.prototype.slice.call(arguments, 2);
            args.unshift(value);
            return eval(fn).apply(window, args);
        }else{
            return eval(fn).call(window, value);
        }
    },


    // private
    stripTagsRE : /<\/?[^>]+>/gi,

    /**
     * Strips all HTML tags
     * @param {Mixed} value The text from which to strip tags
     * @return {String} The stripped text
     */
    stripTags : function(v){
        return !v ? v : String(v).replace(this.stripTagsRE, "");
    },

    // private
    stripScriptsRe : /(?:<script.*?>)((\n|\r|.)*?)(?:<\/script>)/ig,

    /**
     * Strips all script tags
     * @param {Mixed} value The text from which to strip script tags
     * @return {String} The stripped text
     */
    stripScripts : function(v){
        return !v ? v : String(v).replace(this.stripScriptsRe, "");
    },

    /**
     * Simple format for a file size (xxx bytes, xxx KB, xxx MB)
     * @param {Number/String} size The numeric value to format
     * @return {String} The formatted file size
     */
    fileSize : function(size){
        if(size < 1024) {
            return size + " bytes";
        } else if(size < 1048576) {
            return (Math.round(((size*10) / 1024))/10) + " KB";
        } else {
            return (Math.round(((size*10) / 1048576))/10) + " MB";
        }
    },


    /**
     * Converts newline characters to the HTML tag &lt;br/>
     * @param {String} The string value to format.
     * @return {String} The string with embedded &lt;br/> tags in place of newlines.
     */
    nl2br : function(v){
        return v === undefined || v === null ? '' : v.replace(/\n/g, '<br/>');
    },


    isDate: function(dt){
        return dt && typeof dt.getFullYear === 'function';
    },
    isLeapYear: function(dt){
        var year = dt.getFullYear ? dt.getFullYear() : parseInt(dt,100);
        if(year%400 === 0 ||
            year%4 === 0 && year%100 !== 0){
            return true;
        }
        return false;
    },
    fmDate:function(dt,format){
        if(!dt || dt instanceof Date === false){
            dt = new Date();
        }else if(!isNaN(dt)){
            dt = new Date(+dt);
        }
        if(!format){
            format = 'yyyy-MM-dd';
        }
        function padZero(n){
            return n > 9 ? n : '0' + n;
        }
        return format.replace(/yyyy/,dt.getFullYear()).
            replace(/MM/,padZero(dt.getMonth()+1)).replace(/dd/,padZero(dt.getDate())).
            replace(/hh/,padZero(dt.getHours())).replace(/mm/,padZero(dt.getMinutes())).
            replace(/ss/,padZero(dt.getSeconds()));
    },
    parseDate: function(str,fm){
        var start = 0,ch1 = null,ch2 = null;
        var chReg = /^[yMdhms]$/,
            nReg = /^\d$/;
        str = str.replace(/^\s+/g,'').replace(/\s+$/,'');
        fm = (fm || 'yyyy-MM-dd').replace(/^\s+/g,'').replace(/\s+$/,'');
        if(str.length !== fm.length){
            return null;
        }

        var dtArr = [];
        function convert(start,end){
            var tmp = parseInt(str.substring(start,end),10);
            switch(ch1){
                case 'y' : dtArr[0] = tmp;break;
                case 'M' : dtArr[1] = tmp - 1;break;
                case 'd' : dtArr[2] = tmp;break;
                case 'h' : dtArr[3] = tmp;break;
                case 'm' : dtArr[4] = tmp;break;
                case 's' : dtArr[5] = tmp;break;
                default:  throw new Error("Invalid Date.");
            }
        }

        ch1 = fm.charAt(i);
        var flag = true;//有效字符开始标志
        try{
            for(var i = 0,len = fm.length; i < len; i++){
                ch2 = fm.charAt(i);
                if(chReg.test(ch2) && nReg.test(str.charAt(i))){//有效日期字符
                    if(ch2 === ch1){
                        continue;
                    }else{//新的时间
                        ch1 = ch2;
                        if(flag){
                            convert(start,i);
                        }
                        flag = true;
                        start  = i;
                    }
                }else if(ch2 === str.charAt(i)){
                    if(flag){
                        convert(start,i);
                    }else{
                        start  = i;
                    }
                    flag = false;
                }else{
                    throw new Error('format no match.');
                }
            }
            convert(start,i);
        }catch(e){
            console.error(e);
            return null;
        }

        return new Date(dtArr[0],dtArr[1],dtArr[2],dtArr[3]||0,dtArr[4]||0,dtArr[5]||0,0);
    }

};


/**
 * form表单验证
 */
App.FormValidator = function(cfg){
    this.init(cfg);
};
App.FormValidator.prototype = {
    defaultCfg: {

        //jquery的form元素
        $form: null,

        //jquery支持的selector
        selector: '.ui-input,.ui-select,input[type="hidden"]',

        //清除错误样式函数
        clearInvalidFn: null,

        //设置错误提示函数
        setInvalidFn: null,

        //定位label提示的函数
        getLabelFn: null,

        //错误样式
        invalidCls: 'ui-input-error',

        //错误提示
        errorTxt : '请填写正确的',
        numTxt : '请填写数字的',
        reqTxt : '不能为空',
        vTxt: 	 '请填写{0}位的',
        minTxt : '不能少于{0}位',
        maxTxt : '不能大于{0}位'
    },

    PHONE: /^1[3578]\d{9}$/,
    NUM: /^\d+$/,
    BLANK: /^\s*$/,
    EMAIL: /^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]+$/,
    POSTCODE:  /^[1-9][0-9]{5}$/,
    IDCARD:/^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\d{4}((19\d{2}(0[13-9]|1[012])(0[1-9]|[12]\d|30))|(19\d{2}(0[13578]|1[02])31)|(19\d{2}02(0[1-9]|1\d|2[0-8]))|(19([13579][26]|[2468][048]|0[48])0229))\d{3}(\d|X|x)?$/,
    PASSPORT: /^1[45][0-9]{7}|G[0-9]{8}|P[0-9]{7}|S[0-9]{7,8}|D[0-9]+$/,
    setConfig: function(args){
        this.config = $.extend({},this.defaultCfg,args);
    },
    init: function(cfg){
        var _this = this;
        this.setConfig(cfg);
        this.config.$form.on('focus',this.config.selector,function(){
            _this.clearInvalid(this);
        }).on('blur',this.config.selector,function(){
            var result = _this.validateField(this);
            if( result !== true){
                _this.setInvalid(this,result);
            }else{
                _this.clearInvalid(this);
            }
        });
    },
    _getLabel: function(el){
        if(this.config.getLabelFn){
            return  this.config.getLabelFn(el);
        }
        return el.attr("label") || el.closest('.ui-form-item').children(".ui-form-label").text();
    },

    _tmpl: function(tpl){
        if(arguments.length !== 1){
            for(var i = arguments.length - 1; i>0 ; i--){
                tpl = tpl.replace('{'+(i-1)+'}',arguments[i]);
            }
        }
        return tpl;
    },

    validateField: function(item){
        if(!item.name || item.disabled){
            return true;
        }
        var _this = this,
            el = $(item),
            val = item.value,
            msg = _this._getLabel(el);
        msg = msg.replace(/^\*/,'').replace(/[:：]$/,'');
        vtype = el.attr("vtype");
        if(el.attr("novalidate")){
            return true;
        }
        if(el.attr("required") && _this.BLANK.test(val)){
            return msg += _this.config.reqTxt;
        }else if(val){
            var tmp = parseInt(el.attr("minlength")||0, 10);
            if(tmp && val.length < tmp){
                return msg += _this._tmpl(_this.config.minTxt,tmp);
            }
            tmp = parseInt(el.attr("maxlength")|| 0,10);
            if(tmp > 0 && val.length > tmp){
                return msg += _this._tmpl(_this.config.maxTxt,tmp);
            }
            tmp = parseInt(el.attr("vlength")|| 0,10);
            if(tmp > 0 && val.length !== tmp){
                return msg = _this._tmpl(_this.config.vTxt,tmp) + msg;
            }

            if(vtype === "phone" && !_this.PHONE.test(val)){
                return msg = _this.config.errorTxt + msg;
            }
            if(vtype === "num" && !_this.NUM.test(val)){
                return msg = _this.config.numTxt + msg;
            }
            if(vtype === "email" && !_this.EMAIL.test(val)){
                return msg = _this.config.errorTxt + msg;
            }
            if(vtype === "postcode" && !_this.POSTCODE.test(val)){
                return msg = _this.config.errorTxt + msg;
            }
            if(vtype === "idcard" && !_this.IDCARD.test(val)){
                return msg = _this.config.errorTxt + msg;
            }
            if(vtype === "passport" && !_this.PASSPORT.test(val)){
                return msg = _this.config.errorTxt + msg;
            }
        }
        return true;
    },

    clearInvalid: function(item){
        item = item ? $(item) : this.config.$form;
        if(this.config.clearInvalidFn){
            this.config.clearInvalidFn(item);
        }else if(item.is("FORM")){
            item.find(this.config.selector).removeClass(this.config.invalidCls).siblings('.ui-field-error').hide();
        }else{
            item.removeClass(this.config.invalidCls).siblings('.ui-field-error').hide();
        }

    },

    setInvalid: function(item,msg){
        if (this.config.setInvalidFn){
            this.config.setInvalidFn($(item));
        }else{
            $(item).addClass(this.config.invalidCls).siblings('.ui-field-error').html(msg).show();
        }
    },


    validate: function(){
        var _this = this,
            el = null,
            val = null,
            msg = true,
            rs = {};

        var fields = this.config.$form.find(this.config.selector);

        fields.each(function(i,item){
            if(!item.name || msg !== true){
                return;
            }

            el = $(item);
            msg = _this.validateField(item);
            if ( msg === true ){
                _this.clearInvalid(item);

                val = item.value;
                if(item.type && item.type.toLowerCase() === 'radio'){
                    if(item.checked){
                        rs[item.name] = val;
                    }
                }else if(item.type && item.type.toLowerCase() === 'checkbox'){
                    if(item.checked){
                        rs[item.name] = typeof rs[item.name] === "undefined" ?  val : rs[item.name] + "," + val;
                    }
                }else{
                    rs[item.name] = val;
                }
            }else{
                _this.setInvalid(item,msg);
            }

        });
        if(msg !== true){
            return {
                el: el,
                msg: msg
            };
        }
        return rs;
    },



    isEmail: function(val){
        return this.EMAIL.test(val);
    },
    isPhone: function(val){
        return this.PHONE.test(val);
    },
    isBankCard: function(bankAccount){
        if(bankAccount == null || bankAccount == ""){
            return false;
        }
        if(bankAccount.length < 11){
            return false;
        }
        // 是否为纯数字
        if(/^\d+$/.test(bankAccount) == false){
            return false;
        }
        var val = 0;
        var total = 0;
        var flag = 0;
        var i;
        for(i=bankAccount.length - 2;i >= 0;i = i -2){
            val = parseInt(bankAccount.charAt(i)) * 2;
            flag = val % 10;
            total = total + flag;
            val = val - flag;
            total = total + (val / 10);
        }
        for(i=bankAccount.length - 3;i >= 0;i = i -2){
            val = parseInt(bankAccount.charAt(i));
            total = total + val;
        }
        val = total % 10;
        if(val != 0){
            val = 10 - val;
        }
        return (val == parseInt(bankAccount.charAt(bankAccount.length - 1)));
    }
};

/*
 * 简单弹层
 * */
App.LightBox = function(cfg){
    this.init(cfg);
    return this;
};
App.LightBox.prototype = {

    defaultCfg: {
        title: "提示",
        msg: '',

        cls: '',

        //alert/confirm/none/tip
        type: "alert",

        //question/warn/success/error/none
        msgType: 'warn',

        //右上角显示关闭图标。
        closable: true,

        renderFn: null,
        confirmFn: null,
        cancelFn: null,
        timeout: 1500

    },
    init: function(cfg){
        this.config = $.extend({},this.defaultCfg,cfg);
        this._initDom();
        this._initEvent();
    },
    hide: function(){
        this.domEl.remove();
    },
    show: function(){
        var _this = this;

        //修正遮盖层的层级问题。
        var num = $(".ui-lightbox-mask").size(),
            zIndex = +this.domEl.find(".ui-lightbox-mask").css("zIndex");
        this.domEl.find(".ui-lightbox-mask").css("zIndex",zIndex + num -1);
        this.domEl.find(".ui-lightbox").css("zIndex",zIndex + num);

        this.domEl.show();
        this.fixPos();
        if(this.config["type"] === "tip"){
            setTimeout(function(){
                _this.hide();
            },this.config.timeout);
        }
        return this;
    },
    fixPos: function(){
        var lightBox = this.domEl.find('.ui-lightbox');
        var w = lightBox.width(),
            h = lightBox.height();
        lightBox.css({
            marginLeft: -w/2,
            marginTop: -h/2,
            top:'50%',
            left:'50%'
        });
    },
    _getHd: function(){
        return (this.config["type"] === "tip" || !this.config["title"] ) ? "" :
            '<div class="ui-lightbox-hd">'+
            (this.config["closable"] === true ? '<a href="#" class="close">&times;</a>' : "") +
            this.config["title"]+'</div>';
    },
    _getBd: function(){
        var cls = '';
        switch(this.config.msgType){
            case "question":
                cls = "ui-lightbox-question" ;break;
            case "warn":
                cls = "ui-lightbox-warn";break;
            case "success":
                cls = "ui-lightbox-success";break;
            case "error":
                cls = "ui-lightbox-error";break;
            default:
                cls = "ui-lightbox-none";
        }
        return '<div class="ui-lightbox-bd '+cls+'"><i class="ui-lightbox-icon"></i><div class="ui-lightbox-msg">'+this.config["msg"]+'</div></div>';
    },
    _getFt: function(){
        var ft = '';
        if(this.config.type === "alert" || this.config.type === "confirm"){
            ft = '<input type="button" class="ui-button" id="J_lightbox_confirm" value="确定"/>';
        }
        if(this.config.type === "confirm"){
            ft += '<input type="button" class="ui-button ui-button-gray" id="J_lightbox_cancel" value="取消"/>';
        }
        if(this.config.type === "none"){
            ft = "";
        }
        return this.config.type === "tip" ? "" : '<div class="ui-lightbox-ft">' + ft + '</div>';
    },
    _initDom: function(){

        var _html = ['<div class="J_lightbox '+ this.config.cls + '">',
            '<table class="ui-lightbox"><tbody><tr><td>',
            '<div class="ui-lightbox-inner">',
            this._getHd(),
            this._getBd(),
            this._getFt(),
            '</div>',
            '</td></tr></tbody></table>',
            '</div>'
        ].join("");
        this.domEl = $(_html);
        if(this.config["type"] === "tip"){
            this.domEl.find('.ui-lightbox').addClass("ui-lightbox-tip");
        }else{
            this.domEl.prepend('<div class="ui-lightbox-mask"></div>');
        }
        this.domEl.appendTo("body");
        if(typeof this.config.renderFn === "function"){
            this.config.renderFn(this);
        }
    },
    _initEvent: function(){
        var _this = this;
        this.domEl.on('click','.close',function(e){
            e.preventDefault();
            _this.hide();
        }).on('click','#J_lightbox_confirm',function(){
            if(typeof _this.config.confirmFn === "function"){
                _this.config.confirmFn(_this);
            }
            _this.hide();
        }).on('click','#J_lightbox_cancel',function(){
            if(typeof _this.config.cancelFn === "function"){
                _this.config.cancelFn(_this);
            }
            _this.hide();
        });
    }
};


//定义几个基本的弹窗快捷方法
$.extend(App,{
    confirm : function(msg,fn){
        new App.LightBox({
            msg: msg,
            msgType: 'question',
            type: "confirm",
            confirmFn: fn
        }).show();
    },

    alert : function(msg,fn,msgType){
        if(arguments.length === 2){
            if(typeof fn === "string"){
                msgType = fn;
                fn = null;
            }
        }
        new App.LightBox({
            msg: msg,
            msgType: msgType || 'warn',
            type: 'alert',
            confirmFn: fn
        }).show();
    },

    tip : function(msg,msgType){
        new App.LightBox({
            msg: msg,
            msgType: msgType || 'success',
            type: 'tip'
        }).show();
    }
});



/**
 * @author shawn.
 * @example
 *
 * var dtPicker = new DatePicker({
          el: $('#box')
//        hasTime: true,
//        format: "YYYY-MM-DD hh:mm:ss",
//        val: 2010-10-10,
//        minVal:'2012-10-05',
//        maxVal:'2013-01-01'
    });
 */
function DatePicker(cfg){
    $.extend(this,{
        config: {},
        minTime: null,
        maxTime: null,
        todayDt: null,
        val: null,

        elWidth: 0,           //控件的宽度
        elHeight: 0,          //控件的高度

        domEl: null

    });
    this.init(cfg);
}

$.extend(DatePicker.prototype,{


    defaultCfg: {
        id: null,
        el: null,
        val: null,

        zIndex: 100,

        //显示时分秒选项。
        hasTime: false,

        //当前只支持 util/Format里面的日期格式.带时分秒的日期默认格式为 YYYY-MM-DD hh:mm:ss
        format: "yyyy-MM-dd",

        //日期最小值
        minVal: '1000-01-01',

        //日期最大值
        maxVal:'9999-01-01',

        //关联小于值元素.则控件日期将小于该元素值。
        beforeEl: null,

        //关联大于值元素。则控件日期将大于该元素值。
        afterEl: null
    },


    init: function(cfg){
        $.extend(this.config,this.defaultCfg);
        $.extend(this.config,cfg);

        this.config.el.attr("readOnly",true);
        this.initVal();

        var _this = this;
        this.config.el.click(function(ev){
            ev.stopPropagation();
            $('.ui_datePicker_box').hide();
            _this.show();

        });
    },
    days:[31,28,31,30,31,30,31,31,30,31,30,31,30],
    dayNames:["日","一","二","三","四","五","六"],

    _setRange: function(){
        var beforeVal = "",
            afterVal = "";
        if(this.config.beforeEl){
            beforeVal = this.config.beforeEl.val();
            if(beforeVal){
                this.maxTime = beforeVal < this.config.maxVal  ? beforeVal: this.config.maxVal;
            }else{
                this.maxTime = this.config.maxVal;
            }
        }

        if(this.config.afterEl){
            afterVal = this.config.afterEl.val();
            if(afterVal){
                this.minTime =  afterVal > this.config.minVal? afterVal : this.config.minVal;
            }else{
                this.minTime = this.config.minVal;
            }
        }
    },
    initVal: function(){

        this.minTime = this.config.minVal;
        this.maxTime = this.config.maxVal;

        if(typeof this.minTime === "object" && this.minTime instanceof Date){
            this.minTime = App.Format.fmDate(this.minTime,this.config.format);
        }

        if(typeof this.maxTime === "object" && this.maxTime instanceof Date){
            this.maxTime = App.Format.fmDate(this.maxTime,this.config.format);
        }

        this.todayDt = new Date();

        var val = this.config.el.val() || this.config.val;
        if(!val){
            val = new Date();
        }else if(typeof val === "string"){
            this.config.el.val(val);
            val = App.Format.parseDate(val);
        }
        this.val = val;
        this.config.el.val(App.Format.fmDate(val,this.config.format));
        this.config.id = this.config.id ? this.config.id: 'dt_' + String(Math.random()).substr(2);
    },
    createDay: function(curr,i,date,aCls){
        curr.setDate(i);
        var cls = [];
        if(curr.getDay() === 0 || curr.getDay() === 6){
            cls.push("weeken");
        }
        if( i === date){
            cls.push("curr");
        }
        if(aCls){
            cls.push(aCls);
        }
        var currTime = App.Format.fmDate(curr,this.config.format);//curr.getTime();
        if( currTime <  this.minTime || currTime > this.maxTime){
            cls.push("inValid");
        }
        return '<td class="ui_datePicker_td '+cls.join(" ")+'">'+i+'</td>';
    },

    createDays: function(year,mon,date){
        var days =  this.days[mon] + (mon=== 1 && App.Format.isLeapYear(year) ? 1:0),
            curr = new Date(year,mon,date,0,0,0);
        var preMon = (mon+11)%12,
            preYear = (mon === 0 ? year-1: year),
            preDays = this.days[preMon] + (preMon === 1 && App.Format.isLeapYear(year) ? 1:0),
            nextMon = (mon+1)%12,
            nextYear = (mon === 11 ? year+1:year);

        curr.setDate(1);
        var beginDay = curr.getDay();
        var _html = ['<tbody><tr class="ui_datePicker_tr">'];
        var j = 0;

        //输出前一个月日期
        curr.setFullYear(preYear);
        curr.setDate(1);
        curr.setMonth(preMon);
        for(var i=preDays - beginDay + 1; i <= preDays;i++){
            _html.push(this.createDay(curr,i,null,"preMDay"));
        }

        //输出当前月份日期
        curr.setDate(1);
        curr.setMonth(mon);
        for(var i=1; i <= days; i++){
            _html.push(this.createDay(curr,i,date));
            if((i+beginDay)%7 === 0){
                _html.push("</tr>");
                _html.push('<tr class="ui_datePicker_tr">');
            }
        }

        //输出下一月份的日期
        curr.setFullYear(nextYear);
        curr.setDate(1);
        curr.setMonth(nextMon);
        // 42 = 6行*7列
        j = 42 - beginDay - days;
        var tmp = beginDay + days;
        for(var i=1; i <= j;i++){
            _html.push(this.createDay(curr,i,null,"nextMDay"));
            if((i+tmp)%7 === 0){
                _html.push("</tr>");
                _html.push('<tr class="ui_datePicker_tr">');
            }
        }
        _html.push("</tr></tbody>");
        return _html.join('');
    },

    createHd: function(){
        var names = "";
        for(var i=0;i<this.dayNames.length;i++){
            names +="<th>" + this.dayNames[i] + "</th>";
        }
        return '<thead class="ui_datePicker_hd"><tr class="ui_datePicker_title"><th class="ui_datePicker_preYear">&lt;&lt;</th><th class="ui_datePicker_preMonth">&lt;</th>' +
            '<th class="ui_datePicker_curr" colspan="3">'+
            '<span class="ui_datePicker_currYear">' + this.val.getFullYear() + '年</span>' +
            '<span  class="ui_datePicker_currMonth">' + (this.val.getMonth()+1) + '月</span>' +
            '</th><th class="ui_datePicker_nextMonth">&gt;</th><th class="ui_datePicker_nextYear">&gt;&gt;</th></tr>' +
            '<tr class="ui_datePicker_names">'+names+'</tr>'+
            '</thead>';

    },
    createFt: function(){
        return '<tfoot class="ui_datePicker_ft"><tr><td colspan="2"><span class="set_clear">清空</span></td><td colspan="3"><span class="set_today">今天</span></td><td colspan="2"><span class="set_ok">确定</span></td></tr></tfoot>';
    },

    createSelectDom: function(st,end,cls,val){
        var _html = ['<select class="'+cls+'">'];
        for(var i=st;i<end;i++){
            if(val === i){
                _html.push('<option value="'+i+'" selected>' + (i<10 ? "0"+i: i) + '</option>');
            }else{
                _html.push('<option value="'+i+'">' + (i<10 ? "0"+i: i) + '</option>');
            }
        }
        _html.push('</select>');
        return _html.join('');
    },
    createTimeBd: function(){
        return '<tbody class="ui_datePicker_timeBd"><tr><td colspan="7">'+
            this.createSelectDom(0,24,'sel_hour',this.val.getHours()) +
            '<span class="time_sep">:</span>' +
            this.createSelectDom(0,60,'sel_min',this.val.getMinutes()) +
            '<span class="time_sep">:</span>' +
            this.createSelectDom(0,60,'sel_sec',this.val.getSeconds()) +
            '</tr></tbody>';
    },

    initDom: function(){
        var val = this.val;

        this._setRange();

        var hd = this.createHd();
        var ft = this.createFt();
        var bd = this.createDays(val.getFullYear(),val.getMonth(),val.getDate());
        var timeBd = this.config.hasTime ? this.createTimeBd(): '';

        var _html = [
                '<div class="ui_datePicker_box" id="'+this.config.id+'"><table>',
            hd,
            bd,
            timeBd,
            ft,
            '</table></div>'
        ].join('');
        $(document.body).append(_html);

        this.domEl = $("#" + this.config.id);
    },

    update: function(){
        var year = this.val.getFullYear(),
            month = this.val.getMonth();

        this._setRange();

        var bd = this.createDays(year,month,this.val.getDate());
        this.domEl.find('tbody').eq(0).replaceWith(bd);
        this.domEl.find('.ui_datePicker_currMonth').html(month+1 +"月");
        this.domEl.find('.ui_datePicker_currYear').html(year +"年");

        if(this.config.hasTime){
            this.domEl.find('.sel_hour').val(this.val.getHours());
            this.domEl.find('.sel_min').val(this.val.getMinutes());
            this.domEl.find('.sel_sec').val(this.val.getSeconds());
        }
    },

    updateValue: function(val){
        this.val = val ? val:new Date();
        if(this.config.hasTime){
            this.val.setHours(this.domEl.find('.sel_hour').val());
            this.val.setMinutes(this.domEl.find('.sel_min').val());
            this.val.setSeconds(this.domEl.find('.sel_sec').val());
        }
        if(!val){
            this.config.el.val("");
        }else{
            var t = App.Format.fmDate(this.val,this.config.format);
            if(this.minTime < t && t < this.maxTime){
                this.config.el.val(App.Format.fmDate(val,this.config.format));
            }
        }
    },

    calPosition: function(){
        var pos = null ,
            winSize = {
                w: Math.max(App.BomHelper.docSize.width,App.BomHelper.viewSize.width),
                h: Math.max(App.BomHelper.docSize.height,App.BomHelper.viewSize.height)
            },
            width = this.elWidth ? this.elWidth: this.domEl.outerHeight(),
            height = this.elHeight ? this.elHeight: this.domEl.outerWidth(),
            top = 0,
            left = 0;

        pos = this.config.el.offset();
        if(pos.top + height > winSize.h){
            top = pos.top - height - this.config.el.outerHeight() - 2;
        }else{
            top = pos.top + this.config.el.outerHeight() + 2;
        }
        if(pos.left + width > winSize.w){
            left = winSize.w - width - 10;
        }else{
            left = pos.left;
        }
        this.elWidth  = width;
        this.elHeight = height;
        return {"top":top,"left":left};
    },

    show: function(){
        var pos = null;
        // 延迟初始化
        if(!this.domEl){
            this.initDom();
            this.initEvent();

            pos = this.calPosition();
            this.domEl.css({"visibility":"visible","zIndex":this.config.zIndex,"top":pos.top,"left":pos.left});
        }else{
            this.update();
            pos = this.calPosition();
            this.domEl.css({"display":"block","top":pos.top,"left":pos.left});
        }
    },

    onClickFn: function(t){
        if(t.hasClass("inValid")){
            return;
        }else if(t.hasClass("ui_datePicker_td")){
            this.val.setDate(t.html());
            if(t.hasClass("preMDay")){
                this.val.setMonth(this.val.getMonth() - 1);
            }else if(t.hasClass("nextMDay")){
                this.val.setMonth(this.val.getMonth() + 1);
            }

            this.updateValue(this.val);
            if(this.config.hasTime){
                t.closest("tbody").find('td').removeClass('curr');
                t.addClass('curr');
            }else{
                this.domEl.hide();
            }
        }else{
            var cls = t.get(0).className;
            switch(cls){
                case "ui_datePicker_preYear":
                    this.val.setFullYear(this.val.getFullYear()-1);
                    this.update();
                    break;
                case "ui_datePicker_preMonth":
                    this.val.setMonth(this.val.getMonth()-1);
                    this.update();
                    break;
                case "ui_datePicker_nextYear":
                    this.val.setFullYear(this.val.getFullYear()+1);
                    this.update();
                    break;
                case "ui_datePicker_nextMonth":
                    this.val.setMonth(this.val.getMonth()+1);
                    this.update();
                    break;
                case "set_clear":
                    this.updateValue(null);
                    this.domEl.hide();
                    break;
                case "set_today":
                    this.updateValue(this.todayDt);
                    this.domEl.hide();
                    break;
                case "set_ok":
                    this.updateValue(this.val);
                    this.domEl.hide();
                    break;
            }
        }
    },
    initEvent: function(){
        var _this = this;

        $(document.body).click(function(ev){
            if(!$.contains(_this.domEl[0], ev.target)){
                _this.domEl.hide();
            }
        });

        this.domEl.click(function(event){
            var t = $(event.target);
            _this.onClickFn(t);
        });
    }

});


function PageBar(cfg){
    $.extend(this,{
        config:{},

        val: 0, //当前页码

        domEl: null
    });
    this.init(cfg);
}

$.extend(PageBar.prototype, {

    defaultCfg: {
        el : null,

        //对齐方式：tc tl tr
        align:'tc',

        //分页个数
        total: -1,

        //数据总条数
        totalNum:-1,

        //分页大小。如果配置了total，则不再利用该配置项重新计算total的值。
        pageSize: 10,

        //分页码个数
        maxPage : 10,

        //初始页码
        page : 1,

        //单击页面的回调函数
        onPage: null    ,

        //提供快速跳转输入
        jumpTo: true,

        //自定义每页大小控制
        psCustom: false,

        //自定义每页大小可选项
        psList:[10,20,50,100],

        //自定义pageSize回调函数
        onCust: null
    },
    tplFn:template.compile('<a href="#"  class="ui_pageBar_item {{cls}}">{{n}}</a>'),
    dotStr: '<span>...</span>',

    init: function(cfg){
        $.extend(this.config,this.defaultCfg);
        $.extend(true,this.config,cfg);

        if(this.config.total < 0 && this.config.pageSize > 0){
            this.config.total = Math.ceil(this.config.totalNum/this.config.pageSize);
        }
        if(typeof this.config.el == 'string'){
            this.config.el = $("#" + this.config.el);
        }

        this.config.el.html('<div class="ui_pageBar"></div>');
        this.domEl = this.config.el.find('.ui_pageBar').addClass(this.config.align);

        this.setList(this.config.page);

        this.bindEvent();

    },
    addTotalItems: function(num){
        var cfg = this.config;
        cfg.totalNum += num;
        cfg.total = Math.ceil(cfg.totalNum/cfg.pageSize);
    },
    delTotalItems: function(num){
        var cfg = this.config;
        cfg.totalNum -= num;
        cfg.total = Math.ceil(cfg.totalNum/cfg.pageSize);
    },
    setList : function(page){

        this.val = page;
        var _this = this,
            tplFn = this.tplFn;
        var ah=[],i,j,count,

            total = this.config.total,    //分页个数
            maxPage = this.config.maxPage; //显示项个数

        ah.push('<a href="#" class="ui_pageBar_previous" style="visibility:' +
            (page > 1?'visible':'hidden')+'">上一页</a>');
        if(total <= maxPage){
            for(i=1; i<=total;i++){
                if(i == page){
                    ah.push(tplFn({cls:"current",n:i}));
                }else{
                    ah.push(tplFn({n:i}));
                }
            }
        }else{
            var side = Math.ceil((maxPage-2)/2);
            if(page - side <= 2){
                for(i=1; i < page; i++){
                    ah.push(tplFn({n:i}));
                }
                ah.push(tplFn({cls:"current",n:page}));
                for(i++;i < maxPage;i++){
                    ah.push(tplFn({n:i}));
                }
                if(maxPage != total){
                    ah.push(this.dotStr);
                }
                ah.push(tplFn({n:total}));
            }else if(page+side+1 > total){
                ah.push(tplFn({n:1}));
                ah.push(this.dotStr);
                for(i=total-maxPage+2;i<=total;i++){
                    ah.push(tplFn({cls:(i == page?'current':'') , n:i}));
                }
            }else{
                ah.push(tplFn({n:1}));
                ah.push(this.dotStr);
                count = 1;
                for(i=page-side+1;i<page;i++){
                    ah.push(tplFn({n:i}));
                    count++;
                }
                ah.push(tplFn({cls:"current",n:page}));
                var right = Math.min(maxPage-count-2,side);
                i=page+1;
                for(j=0;j<right;j++){
                    ah.push(tplFn({n:i}));
                    i++;
                }
                if(maxPage != total){
                    ah.push(this.dotStr);
                }
                ah.push(tplFn({n:total}));
            }
        }
        ah.push('<a href="#" class="ui_pageBar_next" style="visibility:' +
            (page < total?'visible':'hidden')+'">下一页</a>');


        var infoTpl = '<ins><form><span>共' + this.config.totalNum + '条记录</span>';
        if(this.config.jumpTo){
            infoTpl += [
                '<span>,跳到第</span>',
                '<input type="text" class="ui_pageBar_jumpto" >',
                    '<span>/' + total + '页</span>',
                '<button type="button" class="ui_pageBar_jump">确定</button>'
            ].join('');
        }
        infoTpl += '</form></ins>';
        ah.push(infoTpl);

        if(this.config.psCustom){
            var tmp = '' ,
                cusTpl = '<dd class="{{cls}}">{{num}}{{unit}}</dd>';
            if(this.config.psList){
                $.each(this.config.psList,function(i,item){
                    tmp +=  cusTpl
                        .replace('{{cls}}',item === _this.config.pageSize ? "curr": "")
                        .replace('{{num}}',item)
                        .replace('{{unit}}',"条");
                });
            }
            ah.unshift('<a class="fr ui_pageBar_psCust"><span class="custTip">每页显示...</span><dl>'+ tmp +'</dl></a>');
        }
        this.domEl.html(ah.join(''));
    },

    updatePage: function(page){
        if(!isNaN(page) && page !== this.val){
            page = Math.min(page,this.config.total);
            page = Math.max(page,1);
            this.setList(page);
            if(typeof this.config.onPage === "function"){
                this.config.onPage.call(this,page);
            }
        }
    },
    bindEvent: function(){
        var _this = this,
            page = this.val;
        this.domEl.on('click','.ui_pageBar_jump',function(){
            var jumpVal = $(this).siblings(".ui_pageBar_jumpto").val();
            jumpVal && _this.updatePage(jumpVal);
        }).on('keypress','.ui_pageBar_jumpto',function(e){
            if(e.keyCode === 13){
                _this.updatePage($(this).val());
            }
        }).on('click','a',function(e){
            var target = $(e.target);
            e.preventDefault();
            if(target.hasClass("ui_pageBar_previous")){
                page = _this.val - 1;
            }else if(target.hasClass("ui_pageBar_next")){
                page = _this.val + 1;
            }else if(target.hasClass("ui_pageBar_item")){
                page = parseInt(target.html(),10);
            }else if(target.is("dd")){
                var ps = parseInt(target.html(),10);
                if(typeof _this.config.psCust === "function"){
                    _this.config.psCust(ps);
                }
                return;
            }else{
                return;
            }
            _this.updatePage(page);
        });
    },
    destroy: function(){
        this.domEl.off();
        this.domEl.remove();
    }
});
