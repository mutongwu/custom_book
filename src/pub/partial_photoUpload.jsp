<h3>上传一张孩子或家庭的照片</h3>
<p>照片精度要高，此照片将印到绘本的扉页上</p>
<div class="photoBox" id="j_phoneBox">
	<div class="photoPreview">
		<img src="/images/user-L.jpg" class="photo j_phone" />
        <span class="progress-bar"></span>
	</div>
	<div class="fieldItem">
		<div class="fileBox clearfix">
			<span class="fl fakeInput"></span>
			<a class="ui-button ui-button-green ui-button-L" >上传照片</a>
			<input type="file" name="bytes" class="uploadfile" id="fileupload" />
            <input type="hidden" name="attachmentId" class="attachmentId" />
		</div>
	</div>
</div>
<style type="text/css">
	.photoBox .photo{width:100px;height:100px;border:1px solid #a5a5a5;}
	.photoBox .fileBox{position: relative;margin:10px 0;}
	.photoBox .fakeInput{display:inline-block;width:270px;height:40px;border:1px solid #a5a5a5;border-radius: 5px;margin-right:10px;}
	.photoBox .uploadfile{position: absolute;top:0;left: 0;width: 100%;height: 100%;z-index: 1;opacity: 0;}
</style>
<script type="text/javascript">
	$('#fileupload').fileupload({
        url: '@ROOT_PATH/u/f.do',
        formData:{
        	"call": 'attachment.upload'
        },
        dataType: 'json',
        done: function (e, data) {
        	var result = data.result;
            $('#j_phoneBox .j_phone').attr('src','@ROOT_PATH/u/s.do?attachmentId=' + result.data);
            $('#j_phoneBox .progress-bar').hide();
            $('#j_phoneBox .attachmentId').val(result.data);
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#j_phoneBox .progress-bar').show().html('正在上传' + progress + '%');
        }
    });
</script>