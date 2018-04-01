$(function(){
	var params = App.params();
	var $box = $('.bookEditCnt');

	$box.find('.j_pyName').text(params['py']);
	$box.find('.j_zhName').text(params['zh']);

	function addToCart(){
		var memo = $box.find('.j_memoInput').val();
		var isGift = $box.find('[name="gift"]:checked').val();
		
	}
	$box.on('click', '.j_goEdit', function(){
		App.linkTo('/book/editname.jsp', params);
	}).on('click','#j_addToCart',function(){
		addToCart();
	});
});