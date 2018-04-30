$(function(){
    var $page = $('.adminBalanceDetailCnt');
    var $form = $page.find('.balanceForm');
    var params = App.params();
    var validator = new App.FormValidator({
    	'$form': $form
    });

    function initDatePicker(){
        new App.DatePicker({
          	el: $('.j_date'),
			hasTime: true,
			format: "yyyy-MM-dd hh:mm:ss"
		});
    }
    function submitData(){
        var result = validator.validate();
        if(result.FAILED){
            return;
        }
        App.onceAjax({
            method:'POST',
            data: $.extend(result,{
                'call': 'admin.aaa'
            })
        }).done(function(){
            App.tip('新增成功');
        }).fail(function(res){
            App.tip(res && res.message,'error');
        });
    }
    $page.on('click', '#j_submit',function(){
        submitData();
    });
    initDatePicker();
});