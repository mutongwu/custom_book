define("modules/photoUpload/index",function(t,n,i){function o(t){this.config=$.extend({$container:null,attachmentId:null},t),this._id=(new Date).getTime(),this.init()}o.prototype={init:function(){this.style(),this.dom(),this.event(),this.config.attachmentId&&this.config.$container.find(".j_photo").attr("src","/book/u/s.do?attachmentId="+this.config.attachmentId)},getResult:function(){return this.config.$container.find(".attachmentId").val()||this.config.attachmentId},event:function(){var t=this.config.$container;this.$fileupload=t.find(".j_fileupload").fileupload({url:"/book/u/f.do",formData:{call:"attachment.upload"},dataType:"json",done:function(n,i){var o=i.result;t.find(".j_photo").attr("src","/book/u/s.do?attachmentId="+o.data),t.find(".progress-bar").hide(),t.find(".attachmentId").val(o.data)},progressall:function(t,n){var i=parseInt(n.loaded/n.total*100,10);$(".progress-bar").show().html("正在上传"+i+"%")}})},dom:function(){var t='<h3>上传一张孩子或家庭的照片</h3>\r\n<p>照片精度要高，此照片将印到绘本的扉页上</p>\r\n<div class="module-photoBox j_photoBox">\r\n	<div class="photoPreview">\r\n		<img src="//www.sy111.com/book/static/images/user-L.jpg" class="photo j_photo" />\r\n        <span class="progress-bar"></span>\r\n	</div>\r\n	<div class="fieldItem">\r\n		<div class="fileBox clearfix">\r\n			<span class="fl fakeInput"></span>\r\n			<a class="ui-button ui-button-green ui-button-L" >上传照片</a>\r\n			<input type="file" name="bytes" class="uploadfile j_fileupload" />\r\n            <input type="hidden" name="attachmentId" class="attachmentId" />\r\n		</div>\r\n	</div>\r\n</div>';this.domId=this._id+"_dom",this.config.$container.append('<div id="'+this.domId+'">'+t+"</div>")},style:function(){var t=".module-photoBox .photo {\n  width: 100px;\n  height: 100px;\n  border: 1px solid #a5a5a5;\n}\n\n.module-photoBox .fileBox {\n  position: relative;\n  margin: 10px 0;\n}\n\n.module-photoBox .fakeInput {\n  display: inline-block;\n  width: 270px;\n  height: 40px;\n  border: 1px solid #a5a5a5;\n  border-radius: 5px;\n  margin-right: 10px;\n}\n\n.module-photoBox .uploadfile {\n  position: absolute;\n  top: 0;\n  left: 0;\n  width: 100%;\n  height: 100%;\n  z-index: 1;\n  opacity: 0;\n}\n";this.styleId=this._id+"_style",this.config.$container.append('<style id="'+this.styleId+'">'+t+"</style>")},destroy:function(){this.$fileupload.fileupload("destroy"),this.config.$container.empty()}},i.exports=o});