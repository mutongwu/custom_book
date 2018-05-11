
$(function () {
	var params = App.params();
	var bookData = {
		nameStr: params['py'].toLowerCase(),
		zhNameStr: params['zh'],
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
		if(App.isLogin()){
			App.linkTo('/book/memoedit.jsp', params);
		}else{
			App.confirm('您需要登录才能进行下一步操作。是否前往登录？',function(){
				App.linkTo('/login/login.jsp',{
					returnurl: location.href.replace('preview','memoedit')
				});
			});
		}
    });
});