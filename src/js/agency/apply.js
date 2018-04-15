$(function(){
	var $page = $('.applyCnt');
	var $applyBox = $page.find('.j_applyLevelBox');
	var params = App.params();
	var currentLevel = 1;
	var pValidators = {
		"1": new App.FormValidator({$form: $applyBox.eq(0)}),
		"2": new App.FormValidator({$form: $applyBox.eq(1)}),
		"3": new App.FormValidator({$form: $applyBox.eq(2)})
	};
	var contactValidator = new App.FormValidator({$form: $page.find('.j_contactBox')});

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
			'call': 'agent.applyAgent'
		},result,contact);

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
	function loadParterInfo(){
		return App.ajax({
			data:{
				call: 'agent.getPartnerInfo'
			}
		})
	}
	function initInfo(){
		$.when(loadApplyInfo(), loadParterInfo()).done(function(applyInfo , partnerInfo){
			console.log(applyInfo , partnerInfo);
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
	$page.find('.j_typeRadio[value="'+currentLevel+'"]').click();

	$('.j_distSelect').distpicker();

	initInfo();
})