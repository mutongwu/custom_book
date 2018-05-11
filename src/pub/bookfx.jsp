
<script>
	
	var bookData = {
		nameStr: 'xiaonanhai',
		zhNameStr: '小男孩',
		opt:{
			sex: 'boy',// 男孩
			v: 'v1'	
		}
	};
		
</script>
<div id="j_bookCnt"></div>
<script type="text/javascript">
$(function function_name(argument) {
	new App.BookFx({
		$cnt: $('#j_bookCnt'),
		data: bookData
	})
})
</script>