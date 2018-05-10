$(function(){
	var PhotoUpload = require('/modules/photoUpload/index');
	var params = App.params();
	var $page = $('.bookEditCnt');
	var $priceBox = $page.find('.j_goodsPriceBox');

	var validator = new App.FormValidator({
		$form: $page.find('.bookEdit')
	});

	$page.find('.j_pyName').text(params['py']);
	$page.find('.j_zhName').text(params['zh']);

	function getPrice(){
		var isPacking = +$page.find('.j_isPacking:checked').val();
		if(isPacking){
			$page.find('.j_isPackingTxt').removeClass('none');
		}else{
			$page.find('.j_isPackingTxt').addClass('none');
		}
		App.onceAjax({
			data:{
				'call': 'shopCart.calcOrderGoodsVoPrice',
				'isPacking': isPacking,
				'goodsId': 1
			}
		}).done(function(json){
			$priceBox.find('.j_originalPrice').text(App.formatRmb(json.originalPrice));
			$priceBox.find('.j_statementPrice').text(App.formatRmb(json.statementPrice) + '元');
		}).fail(function(res){
			App.tip(res && res.message,"error");
		});
	}

	function addToCart(){
		var result = validator.validate();
		if(result.FAILED){
			App.tip(result.msg, 'error');
			return false;
		}
		result.isPacking = $page.find('[name="gift"]:checked').val();
		var data = $.extend({
			goodsId: 1,
			storyId: params['v'],
			chineseName: params['zh'],
			pinyinName : params['py'],
			gender: params['sex'] === 'boy'? 1: 0,
			lead: params['v'],
			nameInfo: JSON.stringify(App.BookData.getInstance()),
			call: 'shopCart.add'
		},result);
		
		App.onceAjax({
			method: 'POST',
			data: data
		}).done(function(){
			App.tip('加入购物车成功~');
			setTimeout(function(){App.linkTo('/cart/cart.jsp')},1000);
		})
		.fail(function(res){
			App.tip(res && res.message, 'error');
		});
	}

	new PhotoUpload({
		$container:$('.j_photoUploadDiv')
	});
	$page.on('click', '.j_goEdit', function(){
		App.linkTo('/book/editname.jsp', params);
	}).on('click','#j_addToCart',function(){
		addToCart();
	}).on('click','.j_isPacking', function(){
		getPrice();
	});

	getPrice();
});