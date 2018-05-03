define("modules/photoUpload/index",function(t,n,i){function o(t){this.config=$.extend({$container:null,attachmentId:null},t),this._id=(new Date).getTime(),this.init()}o.prototype={init:function(){this.style(),this.dom(),this.event(),this.config.attachmentId&&this.config.$container.find(".j_photo").attr("src","/book/u/s.do?attachmentId="+this.config.attachmentId)},getResult:function(){return this.config.$container.find(".attachmentId").val()||this.config.attachmentId},event:function(){var t=this.config.$container;this.$fileupload=t.find(".j_fileupload").fileupload({url:"/book/u/f.do",formData:{call:"attachment.upload"},dataType:"json",done:function(n,i){var o=i.result;o.data&&"string"==typeof o.data?(t.find(".j_photo").attr("src","/book/u/s.do?attachmentId="+o.data),t.find(".attachmentId").val(o.data)):App.tip(o.message||"图片上传失败.","error"),t.find(".progress-bar").hide()},progress:function(){t.find(".progress-bar").show().html("正在上传中，请稍后...")}})},dom:function(){var t='<h3>上传一张孩子或家庭的照片</h3>\r\n<p>照片精度要高，此照片将印到绘本的扉页上</p>\r\n<div class="module-photoBox j_photoBox">\r\n	<div class="photoPreview">\r\n		<img src="//www.sy111.com/book/static/images/user-L.jpg" class="photo j_photo" />\r\n        <span class="progress-bar"></span>\r\n	</div>\r\n	<div class="fieldItem">\r\n		<div class="fileBox clearfix">\r\n			<span class="fl fakeInput"></span>\r\n			<a class="ui-button ui-button-green ui-button-L" >上传照片</a>\r\n			<input type="file" name="bytes" class="uploadfile j_fileupload" />\r\n            <input type="hidden" name="attachmentId" class="attachmentId" />\r\n		</div>\r\n	</div>\r\n</div>';this.domId=this._id+"_dom",this.config.$container.append('<div id="'+this.domId+'">'+t+"</div>")},style:function(){var t=".module-photoBox .photo {\n  width: 100px;\n  height: 100px;\n  border: 1px solid #a5a5a5;\n}\n\n.module-photoBox .fileBox {\n  position: relative;\n  margin: 10px 0;\n}\n\n.module-photoBox .fakeInput {\n  display: inline-block;\n  width: 270px;\n  height: 40px;\n  border: 1px solid #a5a5a5;\n  border-radius: 5px;\n  margin-right: 10px;\n}\n\n.module-photoBox .uploadfile {\n  position: absolute;\n  top: 0;\n  left: 0;\n  width: 100%;\n  height: 100%;\n  z-index: 1;\n  opacity: 0;\n}\n";this.styleId=this._id+"_style",this.config.$container.append('<style id="'+this.styleId+'">'+t+"</style>")},destroy:function(){this.$fileupload.fileupload("destroy"),this.config.$container.empty()}},i.exports=o});
$(function(){function t(t){return(t/100).toFixed(2)}function i(t){$.each(t,function(t,i){m+=i.price,x+=i.originalPrice-i.price,v+=i.statementPrice})}function e(){var i=u.find(".j_priceTotal");i.find(".j_total").text(t(m)),i.find(".j_discount").text(t(x)),i.find(".j_price").text(t(v))}function r(){switch(h.length){case 1:return"10%";case 2:return"15%";case 3:return"20%";default:return"20%"}}function n(t){t=t||{};for(var i in t){var e=l.find('[name="'+i+'"]');t[i]&&e.length&&e.val(t[i])}$("#j_distpicker").distpicker({province:t.province,city:t.city,district:t.county})}function o(){App.ajax({data:{call:"address.getDefaultAddressByUserId"}}).always(function(t){n(t)})}function a(){App.ajax({data:{call:"shopCart.list"}}).done(function(t){t&&t.length?(h=t,u.find("#j_cartList").html(template("itemTpl",t)),u.find(".j_discount").text(r()),u.find(".adviceBox,.addressBox,.priceBox,.btnBox").removeClass("none"),o(),i(t),e()):u.find("#j_cartList").html('<p class="tc">购物车空空如也~</p>')}).fail(function(t){App.tip(t&&t.message,"error")})}function d(){var t=[];return $.each(h,function(i,e){t.push(e.orderGoodsId)}),t.join(",")}function s(){var t=f.validate(),i={call:"order.submitOrder"};if(!t.FAILED){if(!t.addressId)return void App.tip("请先添加收货地址信息.","error");i.addressId=t.addressId,i.orderGoodsIds=d(),App.onceAjax({method:"POST",data:i}).done(function(t){App.tip("订单提交成功，正在前往支付"),setTimeout(function(){App.linkTo("/alipay/pay.do",{orderId:t.orderId})},1e3)}).fail(function(t){App.tip(t&&t.message,"error")})}}function c(t){var i=h[t];App.onceAjax({method:"POST",data:{call:"shopCart.remove",orderGoodsId:i.orderGoodsId}}).done(function(){App.tip("删除成功！"),setTimeout(function(){location.reload(!0)},500)}).fail(function(t){App.tip(t&&t.message,"error")})}var p=require("modules/photoUpload/index"),u=$(".cartCnt"),l=u.find(".j_addressForm"),f=new App.FormValidator({$form:l}),h=null;template.helper("priceFormat",t);var m=0,x=0,v=0;u.on("click","#j_submit",function(){s()}).on("click",".j_delItem",function(){var t=$(this).data("idx");App.confirm("确定从购物车删除该绘本吗？",function(){c(t)})}).on("click",".j_cartItemEdit",function(){var t=$(this).data("idx");I.isEditing(t)?App.tip("请先保存其它编辑未完成的绘本信息。","error"):I.init()}).on("click",".j_saveAddress",function(){var t=f.validate();t.FAILED?App.tip("请填写收货地址","error"):(t.call=t.addressId?"address.modifyAddress":"address.saveAddress",App.onceAjax({method:"POST",data:t}).done(function(t){l.find('[name="addressId"]').val(t.addressId),App.tip("收货地址保存成功")}).fail(function(){App.tip("收货地址保存失败","error")}))}),a();var I={currIdx:null,currUpload:null,currBookFx:null,isEditing:function(t){return null!==this.currIdx&&this.currIdx!=t?!0:(this.currIdx=t,!1)},init:function(){var t=$(".j_cartItem").eq(this.currIdx).find(".j_editItemCnt");this.$box=t;var i=h[this.currIdx];t.html(template("editItemTpl")).show(),this.currUpload=new p({$container:t.find(".j_photoUploadDiv"),attachmentId:i.attachmentId}),this.currBookFx=new App.BookFx({$cnt:$("#j_bookCnt"),data:{nameStr:i.pinyinName,opt:{sex:1==i.gender?"boy":"girl",v:i.storyId},list:JSON.parse(i.nameInfo)}}),this.$box.find(".ui-textarea").val(i.message),this.initEvent()},saveItem:function(){var t=this,i=h[this.currIdx];i.attachmentId=this.currUpload.getResult(),i.isPacking=this.$box.find('[name="gift"]:checked').val();var e=this.$box.find(".ui-textarea").val();return e?(i.message=e,i.nameInfo=JSON.stringify(this.currBookFx.getResult()),i.call="shopCart.modify",void App.onceAjax({data:i,method:"POST"}).done(function(i){App.tip(i&&i.message||"商品修改成功！"),t.destroy()}).fail(function(t){App.tip(t&&t.message,"error")})):App.tip("请先填写寄语.","error")},initEvent:function(){var t=this;this.$box.on("click","#j_cancelUpdate",function(){t.destroy()}).on("click","#j_updateCartItem",function(){t.saveItem()})},destroy:function(){this.currBookFx.destroy(),this.currUpload.destroy(),this.currUpload=this.currBookFx=this.currIdx=null,this.$box.off().empty().hide()}}});
