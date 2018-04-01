
$(function () {
	var params = App.params();
	var bookData = {
		nameStr: '',
		opt:{
			sex: 'boy',// 男孩
			v: 'v1'	
		}
	};
	if(/^(boy|girl)$/.test(params['sex'])){
		bookData.opt.sex = RegExp.$1;
	}
	if(/^(v1|v2|v3)$/.test(params['v'])){
		bookData.opt.v = RegExp.$1;	
	}
	bookData.nameStr = params['py'].toLowerCase();
    var instance = new App.BookFx({
        $cnt: $('#j_bookCnt'),
        data: bookData,
        onError: function(){
        	App.tip('对不起，暂不支持您的定制要求','error');
        	$('#j_goMemoEdit').hide();
        }
    });

    $('.container').on('click','#j_goModify', function(){
    	App.linkTo('/book/editname.jsp', params);
    }).on('click','#j_goMemoEdit', function(){
    	App.BookData.setInstance(instance.getResult());
    	App.linkTo('/book/memoedit.jsp', params);
    });
});