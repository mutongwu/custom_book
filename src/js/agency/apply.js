$(function(){
	var $page = $('.applyCnt');
	var $applyBox = $page.find('.j_applyLevelBox');
	var $contactForm = $page.find('.j_contactBox');
	var params = App.params();
	var currentLevel = 1;
	var pValidators = {
		"1": new App.FormValidator({$form: $applyBox.eq(0)}),
		"2": new App.FormValidator({$form: $applyBox.eq(1)}),
		"3": new App.FormValidator({$form: $applyBox.eq(2)})
	};
	var contactValidator = new App.FormValidator({$form: $contactForm});

	function levelName(level){
		switch(+level){
			case 1: return '个人代理';
			case 2: return '网店代理';
			case 3: return '实体店代理';
		}
	}
	function switchBox(level){
		$applyBox.addClass('none');
		$applyBox.filter('[level="'+level+'"]').removeClass('none');
		$page.find('.j_typeName').text(levelName(level));
		currentValidator = pValidators[level+""];
	}

	function submitForm(){
		var result = currentValidator.validate();
		var contact = null;
		if(result.FAILED){
			return;
		}
		contact = contactValidator.validate();
		if(contact.FAILED){
			return;
		}
		var data = $.extend({
			'level': $page.find('.j_typeRadio:checked').val(),
			'call': 'agent.applyAgent'
		},result,contact);
		
		if(data.pic1 && data.pic2 && data.pic3){
			data.attachmentIds = [data.pic1, data.pic2, data.pic3].join(',');
		}
		if(data.level != '1' && !data.attachmentIds){
			return App.tip('请先上传3张店铺(网店)图片资料','error');
		}
		App.onceAjax({
			data: data,
			method:'POST'
		}).done(function(json){
			App.tip('申请成功，请等待审核');
			$('#j_submit').addClass('disable');
		}).fail(function(res){
			App.tip(res && res.message,'error');
		});
	}	

	function loadApplyInfo(){
		return App.ajax({
			data:{
				call: 'agent.getApplyAgentInfo'
			}
		})
	}
	
	function initUpload(){
		var $upload = $page.find('.uploadInput');
		$upload.fileupload({
            url: '@ROOT_PATH/u/f.do',
            formData:{
                "call": 'attachment.upload'
            },
            dataType: 'json',
            done: function (e, data) {
                var $file = $(e.target);
				var result = data.result;
                $file.siblings('.pic').attr('src','@ROOT_PATH/u/s.do?attachmentId=' + result.data);
                $file.siblings('.attachmentId').val(result.data);
            }
        });
		
	}
	function fillForm(res){
		var data = res.partnerInfoVo;
		var level = Number(data.level);
		$page.find('.j_typeRadio[value="'+level+'"]').click();
		for(var p in data){
			$contactForm.find('[name="'+ p +'"]').val(data[p]);
		}
		$contactForm.find('.j_distSelect').distpicker({
			province:data.contactProvince,
			city:data.contactCity,
			district:data.contactCounty
		});
		var $box = $applyBox.eq(level - 1);
		for(var p in data){
			$box.find('[name="'+ p +'"]').val(data[p]);
		}
		$box.find('.j_distSelect').distpicker({
			province:data.province,
			city:data.city,
			district:data.county
		});
		$applyBox.not(level - 1).find('.j_distSelect').distpicker();
		if(level > 1){
			$.each(res.picInfoVoList, function(i, item){
				$box.find('.attachmentId').filter('[name="' + (i+1) + '"]').val(item)
				.siblings('.pic').attr('src','@ROOT_PATH/u/s.do?attachmentId=' + item);
			});
		}
	}
	function initInfo(){
		loadApplyInfo().done(function(applyInfo){
			if(applyInfo){
				fillForm(applyInfo);
			}else{
				$page.find('.j_typeRadio[value="'+currentLevel+'"]').click();
				$('.j_distSelect').distpicker();
			}
		});
	}
	$page.on('change', '.j_typeRadio',function(){
		var val = $(this).val();
		if(this.checked){
			currentLevel = val;
			switchBox(val);
		}
	}).on('click','#j_submit', function(){
		if(!$(this).hasClass('disable')){
			submitForm();	
		}
		
	});

	if(/^([123])$/.test(params['level'])){
		currentLevel = RegExp.$1;
	}

	initInfo();
	initUpload();
})