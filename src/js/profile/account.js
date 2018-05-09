$(function(){
	var $page = $('.accountCnt');
	var $form = $page.find('.accountForm');
    var validator = new App.FormValidator({
    	'$form': $form
    });
    
	$('#j_fileupload').fileupload({
        url: '@ROOT_PATH/u/f.do',
        formData:{
        	"call": 'attachment.upload'
        },
        dataType: 'json',
        done: function (e, res) {
        	var result = res.result;
        	$form.find('[name="attachmentId"]').val(result.data);
            $form.find('.j_headPic').attr('src', '@ROOT_PATH/u/s.do?attachmentId=' + result.data);
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .progress-bar').css(
                'width',
                progress + '%'
            );
        }
    });
	function initForm(user){
		user.attachmentId && $form.find('.j_headPic').attr('src', '@ROOT_PATH/u/s.do?attachmentId=' + user.attachmentId);
		$form.find('.j_uname').text(GlobalData.userName);
		for(var p in user){
			var el = $form.find('[name="'+p+'"]');
			if(user[p] && el.length){
				el.val(user[p]);
			}
		}

		$('#j_distpicker').distpicker({
			province: user.province,
			city: user.city,
			district: user.county
	  	});
	}


	function submitForm(){
		var result = validator.validate();
		if(!result.FAILED){
			result['call'] = 'user.modifyUserInfo';
			App.onceAjax({
		        data: result,
		        method: 'POST'
		    }).done(function(json){
		        App.tip('用户信息修改成功！');
		    });
		}
	}

	App.ajax({
        data: {
            'call': 'user.getUserInfo'
        }
    }).done(function(json){
        if(json && json.userId){
            initForm(json);
        }
    });

  	$page.on('click', '#j_submit',function(){
  		submitForm();
  	});
});