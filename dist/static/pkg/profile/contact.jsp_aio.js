define("modules/contactForm/index",function(t,i,n){function o(t){this.config=$.extend(!0,{$container:null,data:{formCls:"ui-form-L",submitCls:"ui-button-yellow"}},t),this._id=(new Date).getTime(),this.init()}o.prototype={userInfo:null,init:function(){this.style(),this.dom(),this.event(),this.$formBox=this.config.$container.find(".contactForm"),this.validator=new App.FormValidator({$form:this.$formBox}),this.initData()},initData:function(){var t=this;App.ajax({data:{call:"user.getUserInfo"}}).done(function(i){i&&i.userId&&(t.userInfo=i,t.fillForm(i))})},fillForm:function(t){for(var i in t){var n=this.$formBox.find('[name="'+i+'"]');t[i]&&n.length&&n.val(t[i])}},event:function(){var t=this,i=this.config.$container;i.on("click",".j_submitBtn",function(){t.save()})},check:function(){return this.userInfo.contactEMail||this.userInfo.contactMobile?!0:(App.tip("请先保存联系方式.","error"),!1)},validate:function(){var t=this.validator.validate();return t.FAILED?(App.tip(t.msg,"error"),null):t.contactMobile||t.contactEMail?t:(App.tip("联系电话和电子邮箱不能同时为空","error"),null)},save:function(){var t=this.validate();t&&(delete this.userInfo.updateTime,App.onceAjax({data:$.extend({call:"user.modifyUserInfo"},this.userInfo,t),method:"POST"}).done(function(t){_this.userInfo=t,App.tip("联系方式保存成功！")}).fail(function(t){App.tip(t&&t.message||"联系方式保存失败","error")}))},dom:function(){var t='<div class="ui-form contactForm {{formCls}}">\r\n    <div class="ui-form-item">\r\n        <label class="ui-form-label">联系电话：</label>\r\n        <div class="ui-form-group">\r\n            <input type="text" vtype="phone|tel" maxlength="16"  class="ui-input" name="contactMobile" placeholder="联系电话"/>\r\n            <p class="ui-field-error"></p>\r\n        </div>\r\n    </div>\r\n    \r\n    <div class="ui-form-item">\r\n        <label class="ui-form-label">电子邮箱：</label>\r\n        <div class="ui-form-group">\r\n            <input type="text"  vtype="email"   maxlength="32" class="ui-input" name="contactEMail" placeholder="电子邮箱"/>\r\n            <p class="ui-field-error"></p>\r\n        </div>\r\n    </div>\r\n    <div class="ui-form-item">\r\n        <label class="ui-form-label">&nbsp;</label>\r\n        <div class="ui-form-group">\r\n            <input type="button" class="ui-button ui-button-L j_submitBtn {{submitCls}}" value="保存" />\r\n        </div>\r\n    </div>\r\n</div>';this.domId=this._id+"_dom",t='<div id="'+this.domId+'">'+t+"</div>";var i=template.compile(t);this.config.$container.append(i(this.config.data))},style:function(){var t="";this.styleId=this._id+"_style",this.config.$container.append('<style id="'+this.styleId+'">'+t+"</style>")},destroy:function(){this.validator&&this.validator.destroy(),this.config.$container.empty(),this.config=null}},n.exports=o});
$(function(){var n=$(".contactFormCnt"),o=require("modules/contactForm/index");new o({$container:n.find("#j_concactFormBox"),data:{formCls:""}})});