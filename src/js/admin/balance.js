$(function(){
	var pager = {
		init: function(){
			new App.PageBar({
				el: $('#j_pageBox'),
				cls: 'ui_pageBar_L',
				totalNum: 40,
				jumpTo: false
			})
		}
	}

	if($('.adminBalanceCnt').size()){
		pager.init();	
	}
	
});