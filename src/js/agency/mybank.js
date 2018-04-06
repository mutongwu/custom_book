$(function(){
	var $page = $('.myBankCnt');
	var $form = $page.find('.bankForm');
	var validator = new App.FormValidator({$form: $form});
	var isUpdate = false;
	function submitForm(){
		var result = validator.validate();
		if(!result.FAILED){
			result.source  = result.source || result.other;
			result['call'] = isUpdate ? 'agent.updateAccountVo' :  'agent.addAccountVo';
			App.onceAjax({
				data:result,
				method:'POST'
			}).done(function(){
				isUpdate = true;
				App.tip(isUpdate?'银行账号更新成功。':'银行账号添加成功。');
			}).fail(function(res){
				App.tip(res && res.message,'error');
			});
		}
	}
	function fillForm(json){
		if(json){
			isUpdate = true;
			
			var source = json['source'];
			var flag = false;
			$('.j_bankSelect option').each(function(i, item){
				if(item.value === source){
					flag = true;
					return false;
				}
			});
			if(!flag){
				json.other = source;
			}
			for (var p in json){
				var el = $form.find('[name="'+p+'"]');
				if(json[p] && el.length){
					el.val(json[p]);
				}
			}
			$('.j_bankSelect').val( flag ? source: '').trigger('change');
		}
	}
	
	function loadData(){
		App.ajax({
			data:{
				'call': 'agent.getAccountVo'
			}
		}).done(function(json){
			fillForm(json);
		}).fail(function(res){
			App.tip(res && res.message,'error');
		});
	}

	$page.on('click','#j_submit', function(){
		submitForm();
	}).on('change','.j_bankSelect', function(){
		var el = $(this), 
			val = el.val();
		if(!val){
			$page.find('.j_otherBank').removeClass('none').find('.ui-input').removeClass('disable');
			el.addClass('disable');
		}else{
			el.removeClass('disable');
			$page.find('.j_otherBank').addClass('none').find('.ui-input').addClass('disable');
		}
	});
	loadData();
});
