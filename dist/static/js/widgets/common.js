function formatRmb(t){return(t/100).toFixed(2)}function dateFormat(t){return App.Format.fmDate(t,"yyyy-MM-dd hh:mm:ss")}window.App||(window.App={}),App.BomHelper={isNative:function(t,i){return i in document.createElement(t)?!0:!1},getParam:function(t){var i={},e=decodeURIComponent,n=null,s=null,a=document.location.search;if(a){a=a.substring(1),n=a.split("&");for(var o=0,r=n.length;r>o;o++)s=n[o].split("="),i[s[0]]=e(s[1]);return t?i[t]:i}return null},docSize:{width:document.documentElement.scrollWidth,height:document.documentElement.scrollHeight},viewSize:{width:document.documentElement.clientWidth,height:document.documentElement.clientHeight}},App.Format={ellipsis:function(t,i){return t&&t.length>i?t.substr(0,i-3)+"...":t},htmlEncode:function(t){return t?String(t).replace(/&/g,"&amp;").replace(/>/g,"&gt;").replace(/</g,"&lt;").replace(/"/g,"&quot;"):t},htmlDecode:function(t){return t?String(t).replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,'"').replace(/&amp;/g,"&"):t},capitalize:function(t){return t?t.charAt(0).toUpperCase()+t.substr(1).toLowerCase():t},call:function(value,fn){if(arguments.length>2){var args=Array.prototype.slice.call(arguments,2);return args.unshift(value),eval(fn).apply(window,args)}return eval(fn).call(window,value)},stripTagsRE:/<\/?[^>]+>/gi,stripTags:function(t){return t?String(t).replace(this.stripTagsRE,""):t},stripScriptsRe:/(?:<script.*?>)((\n|\r|.)*?)(?:<\/script>)/gi,stripScripts:function(t){return t?String(t).replace(this.stripScriptsRe,""):t},fileSize:function(t){return 1024>t?t+" bytes":1048576>t?Math.round(10*t/1024)/10+" KB":Math.round(10*t/1048576)/10+" MB"},nl2br:function(t){return void 0===t||null===t?"":t.replace(/\n/g,"<br/>")},isDate:function(t){return t&&"function"==typeof t.getFullYear},isLeapYear:function(t){var i=t.getFullYear?t.getFullYear():parseInt(t,100);return i%400===0||i%4===0&&i%100!==0?!0:!1},fmDate:function(t,i){function e(t){return t>9?t:"0"+t}return t?isNaN(t)||(t=new Date(+t)):t=new Date,i||(i="yyyy-MM-dd"),i.replace(/yyyy/,t.getFullYear()).replace(/MM/,e(t.getMonth()+1)).replace(/dd/,e(t.getDate())).replace(/hh/,e(t.getHours())).replace(/mm/,e(t.getMinutes())).replace(/ss/,e(t.getSeconds()))},parseDate:function(t,i){function e(i,e){var n=parseInt(t.substring(i,e),10);switch(s){case"y":l[0]=n;break;case"M":l[1]=n-1;break;case"d":l[2]=n;break;case"h":l[3]=n;break;case"m":l[4]=n;break;case"s":l[5]=n;break;default:throw new Error("Invalid Date.")}}var n=0,s=null,a=null,o=/^[yMdhms]$/,r=/^\d$/;if(t=t.replace(/^\s+/g,"").replace(/\s+$/,""),i=(i||"yyyy-MM-dd").replace(/^\s+/g,"").replace(/\s+$/,""),t.length!==i.length)return null;var l=[];s=i.charAt(h);var c=!0;try{for(var h=0,u=i.length;u>h;h++)if(a=i.charAt(h),o.test(a)&&r.test(t.charAt(h))){if(a===s)continue;s=a,c&&e(n,h),c=!0,n=h}else{if(a!==t.charAt(h))throw new Error("format no match.");c?e(n,h):n=h,c=!1}e(n,h)}catch(f){return console.error(f),null}return new Date(l[0],l[1],l[2],l[3]||0,l[4]||0,l[5]||0,0)}},App.FormValidator=function(t){this.init(t)},App.FormValidator.prototype={defaultCfg:{$form:null,selector:'.ui-input,.ui-textarea,.ui-select,input[type="hidden"],.ui-radio',clearInvalidFn:null,setInvalidFn:null,getLabelFn:null,invalidCls:"ui-input-error",errorTxt:"请填写正确的",numTxt:"请填写数字的",reqTxt:"不能为空",vTxt:"请填写{0}位的",minTxt:"不能少于{0}位",maxTxt:"不能大于{0}位"},PHONE:/^1[3578]\d{9}$/,NUM:/^\d+$/,BLANK:/^\s*$/,EMAIL:/^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]+$/,POSTCODE:/^[1-9][0-9]{5}$/,IDCARD:/^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\d{4}((19\d{2}(0[13-9]|1[012])(0[1-9]|[12]\d|30))|(19\d{2}(0[13578]|1[02])31)|(19\d{2}02(0[1-9]|1\d|2[0-8]))|(19([13579][26]|[2468][048]|0[48])0229))\d{3}(\d|X|x)?$/,PASSPORT:/^1[45][0-9]{7}|G[0-9]{8}|P[0-9]{7}|S[0-9]{7,8}|D[0-9]+$/,URL:/^((http|https):\/\/([\w\-]+\.)+[\w\-]+(\/[\w\u4e00-\u9fa5\-\.\/?\@\%\!\&=\+\~\:\#\;\,]*)?)/i,setConfig:function(t){this.config=$.extend({},this.defaultCfg,t)},init:function(t){var i=this;this.setConfig(t),this.config.$form.on("focus",this.config.selector,function(){i.clearInvalid(this)}).on("blur",this.config.selector,function(){var t=i.validateField(this);t!==!0?i.setInvalid(this,t):i.clearInvalid(this)})},destroy:function(){this.config.$form.off(),this.config=null},_getLabel:function(t){return this.config.getLabelFn?this.config.getLabelFn(t):t.attr("label")||t.closest(".ui-form-item").children(".ui-form-label").text()},_tmpl:function(t){if(1!==arguments.length)for(var i=arguments.length-1;i>0;i--)t=t.replace("{"+(i-1)+"}",arguments[i]);return t},validateField:function(t){var i=$(t);if(!t.name||t.disabled||i.hasClass("disable"))return!0;var e=this,n=t.value,s=e._getLabel(i);if(s=s.replace(/^\*/,"").replace(/[:：]$/,""),vtype=i.attr("vtype"),i.attr("novalidate"))return!0;if(i.attr("required")&&e.BLANK.test(n))return s+=e.config.reqTxt;if(n){var a=parseInt(i.attr("minlength")||0,10);if(a&&n.length<a)return s+=e._tmpl(e.config.minTxt,a);if(a=parseInt(i.attr("maxlength")||0,10),a>0&&n.length>a)return s+=e._tmpl(e.config.maxTxt,a);if(a=parseInt(i.attr("vlength")||0,10),a>0&&n.length!==a)return s=e._tmpl(e.config.vTxt,a)+s;if("phone"===vtype&&!e.PHONE.test(n))return s=e.config.errorTxt+s;if("num"===vtype&&!e.NUM.test(n))return s=e.config.numTxt+s;if("email"===vtype&&!e.EMAIL.test(n))return s=e.config.errorTxt+s;if("postcode"===vtype&&!e.POSTCODE.test(n))return s=e.config.errorTxt+s;if("idcard"===vtype&&!e.IDCARD.test(n))return s=e.config.errorTxt+s;if("passport"===vtype&&!e.PASSPORT.test(n))return s=e.config.errorTxt+s;if("url"===vtype&&!e.URL.test(n))return s=e.config.errorTxt+s}return!0},clearInvalid:function(t){t=t?$(t):this.config.$form,this.config.clearInvalidFn?this.config.clearInvalidFn(t):t.is("FORM")?t.find(this.config.selector).removeClass(this.config.invalidCls).siblings(".ui-field-error").hide():t.removeClass(this.config.invalidCls).siblings(".ui-field-error").hide()},setInvalid:function(t,i){this.config.setInvalidFn?this.config.setInvalidFn($(t)):$(t).addClass(this.config.invalidCls).siblings(".ui-field-error").html(i).show()},validate:function(){var t=this,i=null,e=null,n=!0,s={},a=this.config.$form.find(this.config.selector);return a.each(function(a,o){o.name&&n===!0&&(i=$(o),n=t.validateField(o),n===!0?(t.clearInvalid(o),e=o.value,o.type&&"radio"===o.type.toLowerCase()?o.checked&&(s[o.name]=e):o.type&&"checkbox"===o.type.toLowerCase()?o.checked&&(s[o.name]="undefined"==typeof s[o.name]?e:s[o.name]+","+e):s[o.name]=e):t.setInvalid(o,n))}),n!==!0?{FAILED:!0,el:i,msg:n}:s},isEmail:function(t){return this.EMAIL.test(t)},isPhone:function(t){return this.PHONE.test(t)},isBankCard:function(t){if(null==t||""==t)return!1;if(t.length<11)return!1;if(0==/^\d+$/.test(t))return!1;var i,e=0,n=0,s=0;for(i=t.length-2;i>=0;i-=2)e=2*parseInt(t.charAt(i)),s=e%10,n+=s,e-=s,n+=e/10;for(i=t.length-3;i>=0;i-=2)e=parseInt(t.charAt(i)),n+=e;return e=n%10,0!=e&&(e=10-e),e==parseInt(t.charAt(t.length-1))}},App.LightBox=function(t){return this.init(t),this},App.LightBox.prototype={defaultCfg:{title:"提示",msg:"",cls:"",type:"alert",msgType:"warn",closable:!0,renderFn:null,confirmFn:null,cancelFn:null,timeout:1500},init:function(t){this.config=$.extend({},this.defaultCfg,t),this._initDom(),this._initEvent()},hide:function(){this.domEl.remove()},show:function(){var t=this,i=$(".ui-lightbox-mask").size(),e=+this.domEl.find(".ui-lightbox-mask").css("zIndex");return this.domEl.find(".ui-lightbox-mask").css("zIndex",e+i-1),this.domEl.find(".ui-lightbox").css("zIndex",e+i),this.domEl.show(),this.fixPos(),"tip"===this.config.type&&setTimeout(function(){t.hide()},this.config.timeout),this},fixPos:function(){var t=this.domEl.find(".ui-lightbox"),i=t.width(),e=t.height();t.css({marginLeft:-i/2,marginTop:-e/2,top:"50%",left:"50%"})},_getHd:function(){return"tip"!==this.config.type&&this.config.title?'<div class="ui-lightbox-hd">'+(this.config.closable===!0?'<a href="#" class="close">&times;</a>':"")+this.config.title+"</div>":""},_getBd:function(){var t="";switch(this.config.msgType){case"question":t="ui-lightbox-question";break;case"warn":t="ui-lightbox-warn";break;case"success":t="ui-lightbox-success";break;case"error":t="ui-lightbox-error";break;default:t="ui-lightbox-none"}return'<div class="ui-lightbox-bd '+t+'"><i class="ui-lightbox-icon"></i><div class="ui-lightbox-msg">'+this.config.msg+"</div></div>"},_getFt:function(){var t="";return("alert"===this.config.type||"confirm"===this.config.type)&&(t='<input type="button" class="ui-button" id="J_lightbox_confirm" value="确定"/>'),"confirm"===this.config.type&&(t+='<input type="button" class="ui-button ui-button-gray" id="J_lightbox_cancel" value="取消"/>'),"none"===this.config.type&&(t=""),"tip"===this.config.type?"":'<div class="ui-lightbox-ft">'+t+"</div>"},_initDom:function(){var t=['<div class="J_lightbox '+this.config.cls+'">','<table class="ui-lightbox"><tbody><tr><td>','<div class="ui-lightbox-inner">',this._getHd(),this._getBd(),this._getFt(),"</div>","</td></tr></tbody></table>","</div>"].join("");this.domEl=$(t),"tip"===this.config.type?this.domEl.find(".ui-lightbox").addClass("ui-lightbox-tip"):this.domEl.prepend('<div class="ui-lightbox-mask"></div>'),this.domEl.appendTo("body"),"function"==typeof this.config.renderFn&&this.config.renderFn(this)},_initEvent:function(){var t=this;this.domEl.on("click",".close",function(i){i.preventDefault(),t.hide()}).on("click","#J_lightbox_confirm",function(){"function"==typeof t.config.confirmFn&&t.config.confirmFn(t),t.hide()}).on("click","#J_lightbox_cancel",function(){"function"==typeof t.config.cancelFn&&t.config.cancelFn(t),t.hide()})}},$.extend(App,{confirm:function(t,i){new App.LightBox({msg:t,msgType:"question",type:"confirm",confirmFn:i}).show()},alert:function(t,i,e){2===arguments.length&&"string"==typeof i&&(e=i,i=null),new App.LightBox({msg:t,msgType:e||"warn",type:"alert",confirmFn:i}).show()},tip:function(t,i){new App.LightBox({msg:t,msgType:i||"success",type:"tip"}).show()}}),App.DatePicker=function(t){$.extend(this,{config:{},minTime:null,maxTime:null,todayDt:null,val:null,elWidth:0,elHeight:0,domEl:null}),this.init(t)},$.extend(App.DatePicker.prototype,{defaultCfg:{id:null,el:null,val:null,cls:"ui_datePicker_L",zIndex:100,hasTime:!1,format:"yyyy-MM-dd",minVal:"1000-01-01",maxVal:"9999-01-01",beforeEl:null,afterEl:null},init:function(t){$.extend(this.config,this.defaultCfg),$.extend(this.config,t),this.config.el.attr("readOnly",!0),this.initVal();var i=this;this.config.el.click(function(t){t.stopPropagation(),$(".ui_datePicker_box").hide(),i.show()})},days:[31,28,31,30,31,30,31,31,30,31,30,31,30],dayNames:["日","一","二","三","四","五","六"],_setRange:function(){var t="",i="";this.config.beforeEl&&(t=this.config.beforeEl.val(),this.maxTime=t&&t<this.config.maxVal?t:this.config.maxVal),this.config.afterEl&&(i=this.config.afterEl.val(),this.minTime=i&&i>this.config.minVal?i:this.config.minVal)},initVal:function(){this.minTime=this.config.minVal,this.maxTime=this.config.maxVal,"object"==typeof this.minTime&&this.minTime instanceof Date&&(this.minTime=App.Format.fmDate(this.minTime,this.config.format)),"object"==typeof this.maxTime&&this.maxTime instanceof Date&&(this.maxTime=App.Format.fmDate(this.maxTime,this.config.format)),this.todayDt=new Date;var t=this.config.el.val()||this.config.val;t?"string"==typeof t&&(this.config.el.val(t),t=App.Format.parseDate(t)):t=new Date,this.val=t,this.config.el.val(App.Format.fmDate(t,this.config.format)),this.config.id=this.config.id?this.config.id:"dt_"+String(Math.random()).substr(2)},createDay:function(t,i,e,n){t.setDate(i);var s=[],a=t.getFullYear(),o=t.getMonth();(0===t.getDay()||6===t.getDay())&&s.push("weeken"),i===e&&s.push("curr"),n&&s.push(n);var r=App.Format.fmDate(t,this.config.format);return(r<this.minTime||r>this.maxTime)&&s.push("inValid"),'<td class="ui_datePicker_td '+s.join(" ")+'" y="'+a+'" m="'+o+'">'+i+"</td>"},createDays:function(t,i,e){var n=this.days[i]+(1===i&&App.Format.isLeapYear(t)?1:0),s=new Date(t,i,e,0,0,0),a=(i+11)%12,o=0===i?t-1:t,r=this.days[a]+(1===a&&App.Format.isLeapYear(t)?1:0),l=(i+1)%12,c=11===i?t+1:t;s.setDate(1);var h=s.getDay(),u=['<tbody><tr class="ui_datePicker_tr">'],f=0;s.setFullYear(o),s.setDate(1),s.setMonth(a);for(var d=r-h+1;r>=d;d++)u.push(this.createDay(s,d,null,"preMDay"));s.setDate(1),s.setMonth(i);for(var d=1;n>=d;d++)u.push(this.createDay(s,d,e)),(d+h)%7===0&&(u.push("</tr>"),u.push('<tr class="ui_datePicker_tr">'));s.setFullYear(c),s.setDate(1),s.setMonth(l),f=42-h-n;for(var p=h+n,d=1;f>=d;d++)u.push(this.createDay(s,d,null,"nextMDay")),(d+p)%7===0&&(u.push("</tr>"),u.push('<tr class="ui_datePicker_tr">'));return u.push("</tr></tbody>"),u.join("")},createHd:function(){for(var t="",i=0;i<this.dayNames.length;i++)t+="<th>"+this.dayNames[i]+"</th>";return'<thead class="ui_datePicker_hd"><tr class="ui_datePicker_title"><th class="ui_datePicker_preYear">&lt;&lt;</th><th class="ui_datePicker_preMonth">&lt;</th><th class="ui_datePicker_curr" colspan="3"><span class="ui_datePicker_currYear">'+this.val.getFullYear()+'年</span><span  class="ui_datePicker_currMonth">'+(this.val.getMonth()+1)+'月</span></th><th class="ui_datePicker_nextMonth">&gt;</th><th class="ui_datePicker_nextYear">&gt;&gt;</th></tr><tr class="ui_datePicker_names">'+t+"</tr></thead>"},createFt:function(){return'<tfoot class="ui_datePicker_ft"><tr><td colspan="2"><span class="ui_datePicker_btn set_clear">清空</span></td><td colspan="3"><span class="ui_datePicker_btn set_today">今天</span></td><td colspan="2"><span class="ui_datePicker_btn set_ok">确定</span></td></tr></tfoot>'},createSelectDom:function(t,i,e,n){for(var s=['<select class="'+e+'">'],a=t;i>a;a++)s.push(n===a?'<option value="'+a+'" selected>'+(10>a?"0"+a:a)+"</option>":'<option value="'+a+'">'+(10>a?"0"+a:a)+"</option>");return s.push("</select>"),s.join("")},createTimeBd:function(){return'<tbody class="ui_datePicker_timeBd"><tr><td colspan="7">'+this.createSelectDom(0,24,"sel_hour",this.val.getHours())+'<span class="time_sep">:</span>'+this.createSelectDom(0,60,"sel_min",this.val.getMinutes())+'<span class="time_sep">:</span>'+this.createSelectDom(0,60,"sel_sec",this.val.getSeconds())+"</tr></tbody>"},initDom:function(){var t=this.val;this._setRange();var i=this.createHd(),e=this.createFt(),n=this.createDays(t.getFullYear(),t.getMonth(),t.getDate()),s=this.config.hasTime?this.createTimeBd():"",a=['<div class="ui_datePicker_box '+this.config.cls+'" id="'+this.config.id+'"><table>',i,n,s,e,"</table></div>"].join("");$(document.body).append(a),this.domEl=$("#"+this.config.id)},update:function(){var t=this.val.getFullYear(),i=this.val.getMonth();this._setRange();var e=this.createDays(t,i,this.val.getDate());this.domEl.find("tbody").eq(0).replaceWith(e),this.domEl.find(".ui_datePicker_currMonth").html(i+1+"月"),this.domEl.find(".ui_datePicker_currYear").html(t+"年"),this.config.hasTime&&(this.domEl.find(".sel_hour").val(this.val.getHours()),this.domEl.find(".sel_min").val(this.val.getMinutes()),this.domEl.find(".sel_sec").val(this.val.getSeconds()))},updateValue:function(t){if(this.val=t?t:new Date,this.config.hasTime&&(this.val.setHours(this.domEl.find(".sel_hour").val()),this.val.setMinutes(this.domEl.find(".sel_min").val()),this.val.setSeconds(this.domEl.find(".sel_sec").val())),t){var i=App.Format.fmDate(this.val,this.config.format);this.minTime<i&&i<this.maxTime&&this.config.el.val(App.Format.fmDate(t,this.config.format))}else this.config.el.val("")},calPosition:function(){var t=null,i={w:Math.max(App.BomHelper.docSize.width,App.BomHelper.viewSize.width),h:Math.max(App.BomHelper.docSize.height,App.BomHelper.viewSize.height)},e=this.elWidth?this.elWidth:this.domEl.outerHeight(),n=this.elHeight?this.elHeight:this.domEl.outerWidth(),s=0,a=0;return t=this.config.el.offset(),s=t.top+n>i.h?t.top-n-this.config.el.outerHeight()-2:t.top+this.config.el.outerHeight()+2,a=t.left+e>i.w?i.w-e-10:t.left,this.elWidth=e,this.elHeight=n,{top:s,left:a}},show:function(){var t=null;this.domEl?(this.update(),t=this.calPosition(),this.domEl.css({display:"block",top:t.top,left:t.left})):(this.initDom(),this.initEvent(),t=this.calPosition(),this.domEl.css({visibility:"visible",zIndex:this.config.zIndex,top:t.top,left:t.left}))},onClickFn:function(t){if(!t.hasClass("inValid"))if(t.hasClass("ui_datePicker_td"))this.val.setDate(t.html()),(t.hasClass("preMDay")||t.hasClass("nextMDay"))&&(this.val.setFullYear(t.attr("y")),this.val.setMonth(t.attr("m"))),this.updateValue(this.val),this.config.hasTime?(t.closest("tbody").find("td").removeClass("curr"),t.addClass("curr")):this.domEl.hide();else{var i=t.get(0).className;switch(i){case"ui_datePicker_preYear":this.val.setFullYear(this.val.getFullYear()-1),this.update();break;case"ui_datePicker_preMonth":this.val.setMonth(this.val.getMonth()-1),this.update();break;case"ui_datePicker_nextYear":this.val.setFullYear(this.val.getFullYear()+1),this.update();break;case"ui_datePicker_nextMonth":this.val.setMonth(this.val.getMonth()+1),this.update();break;default:if(-1!==i.indexOf("ui_datePicker_btn")){-1!==i.indexOf("set_clear")&&this.updateValue(null),-1!==i.indexOf("set_today")&&this.updateValue(this.todayDt),-1!==i.indexOf("set_ok")&&this.updateValue(this.val),this.domEl.hide();break}}}},initEvent:function(){var t=this;$(document.body).click(function(i){$.contains(t.domEl[0],i.target)||t.domEl.hide()}),this.domEl.click(function(i){var e=$(i.target);t.onClickFn(e)})}}),App.PageBar=function(t){$.extend(this,{config:{},val:0,domEl:null}),this.init(t)},$.extend(App.PageBar.prototype,{defaultCfg:{el:null,cls:"",align:"tc",total:-1,totalNum:-1,pageSize:10,maxPage:10,page:1,onPage:null,jumpTo:!0,psCustom:!1,psList:[10,20,50,100],onCust:null},tplFn:template.compile('<a href="#"  class="ui_pageBar_item {{cls}}">{{n}}</a>'),dotStr:"<span>...</span>",init:function(t){$.extend(this.config,this.defaultCfg),$.extend(!0,this.config,t),this.config.total<0&&this.config.pageSize>0&&(this.config.total=Math.ceil(this.config.totalNum/this.config.pageSize)),"string"==typeof this.config.el&&(this.config.el=$("#"+this.config.el)),this.config.el.html('<div class="ui_pageBar '+this.config.cls+'"></div>'),this.domEl=this.config.el.find(".ui_pageBar").addClass(this.config.align),this.setList(this.config.page),this.bindEvent()},addTotalItems:function(t){var i=this.config;i.totalNum+=t,i.total=Math.ceil(i.totalNum/i.pageSize)},delTotalItems:function(t){var i=this.config;i.totalNum-=t,i.total=Math.ceil(i.totalNum/i.pageSize)},setList:function(t){this.val=t;var i,e,n,s=this,a=this.tplFn,o=[],r=this.config.total,l=this.config.maxPage;if(o.push('<a href="#" class="ui_pageBar_previous" style="visibility:'+(t>1?"visible":"hidden")+'">上一页</a>'),l>=r)for(i=1;r>=i;i++)o.push(i==t?a({cls:"current",n:i}):a({n:i}));else{var c=Math.ceil((l-2)/2);if(2>=t-c){for(i=1;t>i;i++)o.push(a({n:i}));for(o.push(a({cls:"current",n:t})),i++;l>i;i++)o.push(a({n:i}));l!=r&&o.push(this.dotStr),o.push(a({n:r}))}else if(t+c+1>r)for(o.push(a({n:1})),o.push(this.dotStr),i=r-l+2;r>=i;i++)o.push(a({cls:i==t?"current":"",n:i}));else{for(o.push(a({n:1})),o.push(this.dotStr),n=1,i=t-c+1;t>i;i++)o.push(a({n:i})),n++;o.push(a({cls:"current",n:t}));var h=Math.min(l-n-2,c);for(i=t+1,e=0;h>e;e++)o.push(a({n:i})),i++;l!=r&&o.push(this.dotStr),o.push(a({n:r}))}}o.push('<a href="#" class="ui_pageBar_next" style="visibility:'+(r>t?"visible":"hidden")+'">下一页</a>');var u="<ins><form><span>共"+this.config.totalNum+"条记录</span>";if(this.config.jumpTo&&(u+=["<span>,跳到第</span>",'<input type="text" class="ui_pageBar_jumpto" >',"<span>/"+r+"页</span>",'<button type="button" class="ui_pageBar_jump">确定</button>'].join("")),u+="</form></ins>",o.push(u),this.config.psCustom){var f="",d='<dd class="{{cls}}">{{num}}{{unit}}</dd>';this.config.psList&&$.each(this.config.psList,function(t,i){f+=d.replace("{{cls}}",i===s.config.pageSize?"curr":"").replace("{{num}}",i).replace("{{unit}}","条")}),o.unshift('<a class="fr ui_pageBar_psCust"><span class="custTip">每页显示...</span><dl>'+f+"</dl></a>")}this.domEl.html(o.join(""))},updatePage:function(t){isNaN(t)||t===this.val||(t=Math.min(t,this.config.total),t=Math.max(t,1),this.setList(t),"function"==typeof this.config.onPage&&this.config.onPage.call(this,t))},bindEvent:function(){var t=this,i=this.val;this.domEl.on("click",".ui_pageBar_jump",function(){var i=$(this).siblings(".ui_pageBar_jumpto").val();i&&t.updatePage(i)}).on("keypress",".ui_pageBar_jumpto",function(i){13===i.keyCode&&t.updatePage($(this).val())}).on("click","a",function(e){var n=$(e.target);if(e.preventDefault(),n.hasClass("ui_pageBar_previous"))i=t.val-1;else if(n.hasClass("ui_pageBar_next"))i=t.val+1;else{if(!n.hasClass("ui_pageBar_item")){if(n.is("dd")){var s=parseInt(n.html(),10);return void("function"==typeof t.config.psCust&&t.config.psCust(s))}return}i=parseInt(n.html(),10)}t.updatePage(i)})},destroy:function(){this.domEl.off(),this.domEl.remove()}}),App.onceAjax=function(){var t=null;return function(i){return t||(t=App.ajax(i).always(function(){t=null})),t}}(),App.ajax=function(t){var i=new $.Deferred;return $.ajax($.extend({url:"//www.sy111.com/book/a/c.do",method:"GET",dataType:"json",xhrFields:{withCredentials:!0}},t)).done(function(t){t&&1==t.code||null===t.code?i.resolve(t.data):i.reject(t)}).fail(function(t){i.reject(t)}),i},App.linkTo=function(t,i){var e=t;i&&(-1===e.indexOf("?")&&(e+="?"),e+="object"==typeof i?$.param(i):i),/^(https?:|\/\/)/.test(e)||(e="/book"+e),window.location.href=e},template.helper("dateFormat",dateFormat),template.helper("priceFormat",formatRmb),App.isLogin=function(){return!!(GlobalData.userId||App.User&&App.User.userId)};