
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
