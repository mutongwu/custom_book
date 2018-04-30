$(function(){
	var $page = $('.addressCnt');
	var $form = $page.find('.addressForm');
    var validator = new App.FormValidator({
    	'$form': $form
    });

	function initForm(json){
		json = json || {};
		for(var p in json){
			var el = $form.find('[name="'+p+'"]');
			if(json[p] && el.length){
				el.val(json[p]);
			}
		}

		$('#j_distpicker').distpicker({
			province: json.province,
			city: json.city,
			district: json.county
	  	});
	}


	function submitForm(){
		var result = validator.validate();
		if(!result.FAILED){
			result['call'] = result.addressId ? 'address.modifyAddress' : 'address.saveAddress';
			App.onceAjax({
		        data: result,
		        method: 'POST'
		    }).done(function(json){
		        App.tip( result.addressId ?'用户地址修改成功！': '用户地址添加成功！');
                $form.find('[name="addressId"]').val(json.addressId);
		    });
		}
	}

    App.ajax({
        data: {
            'call': 'address.getDefaultAddressByUserId'
        }
    }).always(function(res){
        initForm(res.data);
    });

  	$page.on('click', '#j_submit',function(){
  		submitForm();
  	});
});