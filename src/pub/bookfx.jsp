
<script>
	var globalAllData = {
		'A':[{
			id: 'a1',
			thumb: 'a.jpg',
			pic:['A_Angel_s_Page_1.jpg','A_Angel_s_Page_2.jpg'],
			name: '大虾4'
		},{
			id: 'a2',
			thumb: 'b.jpg',
			pic:['A_Aardvark_s_Page_1.jpg','A_Aardvark_s_Page_2.jpg'],
			name: '大虾3'
		}],
		'Z':[{
			id: 'z1',
			thumb: 'a.jpg',
			pic: ['S_Squid_s_Page_1.jpg','S_Squid_s_Page_2.jpg'],
			name: '大虾1'
		}],
		'H':[{
			id: 'h2',
			thumb: 'a.jpg',
			pic: ['F_Frog_s_Page_1.jpg','F_Frog_s_Page_2.jpg'],
			name: '大虾2'
		}],
		'N':[{
			id: 'n1',
			thumb: 'b.jpg',
			pic: ['S_Squid_s_Page_1.jpg','S_Squid_s_Page_2.jpg'],
			name: '大虾5'
		}],
		'G':[{
			id: 'g1',
			thumb: 'a.jpg',
			pic: ['F_Frog_s_Page_1.jpg','F_Frog_s_Page_2.jpg'],
			name: '大虾6'
		}]
	}
	var bookData = {
		nameStr: 'zhang',
		sex: 1,// 男孩
		list:[
			{id: 'z1',ch:'Z'},{id: 'h2',ch:'H'},{id: 'a1',ch:'A'},
			{id: 'n1',ch:'N'},{id: 'g1',ch:'G'}
		]
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