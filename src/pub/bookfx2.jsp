

<!-- <script type="text/javascript" src="./js/widgets/flipbook.js"></script> -->
<input type="button" name="" id="left" value="pre">
<input type="button" name="" id="right" value="next">
<script type="text/javascript">
$(function(){
	// var curr = 0;
	// var $flipBook = $('.flipBook');
	// var $flipItem j_flipItems = $flipBook.find('.flipItem j_flipItem');
	// var w0 = $flipItem j_flipItems.eq(curr).width(),
	// 		h0 = $flipItem j_flipItems.eq(curr).height();

	// // $flipItem j_flipItems.height(h0).find('.picBox').height(h0)
	// $flipItem j_flipItems.css({
	// 	'clip': 'rect(0,500px,400px,0)'
	// }).filter(function(idx){
	// 	return idx % 2 !== 0
	// }).addClass('evenItem');

	// $('#left').click(function(){
	// 	var $flipEl = $flipItem j_flipItems.eq(curr - 1);
	// 	$flipEl.css({
	// 		width: 0,
	// 		left: 0
	// 	}).addClass('fliping');

	// 	var $nextEl = $flipItem j_flipItems.eq(curr - 2);
	// 	$nextEl.addClass('next').css({
	// 		clip: 'rect(0px 0px 400px 0px)'
	// 	});
	// 	$nextEl.animate({
	// 		clip: 'rect(0px 500px 400px 0px)'
	// 	}, 1000,function(){
	// 		$flipItem j_flipItems.not(function(idx){
	// 			return (idx === curr - 1)  || (idx === curr - 2)
	// 		}).removeClass('active');
	// 		$(this).removeClass('next').addClass('active')
	// 	});
	// 	$flipEl.animate({
	// 		width: w0,
	// 		left: '50%'
	// 	}, 1000,function(){
	// 		curr -= 2;
	// 		$(this).removeClass('fliping').addClass('active')
	// 	});
	// });

	// $('#right').click(function(){
		
	// 	var $flipEl = $flipItem j_flipItems.eq(curr + 2);
	// 	$flipEl.css({
	// 		width: 0,
	// 		left: '100%'
	// 	}).addClass('fliping');

	// 	var $nextEl = $flipItem j_flipItems.eq(curr + 2 + 1);
	// 	$nextEl.addClass('next').css({
	// 		clip: 'rect(0px 500px 400px 500px)'
	// 	});
	// 	$nextEl.animate({
	// 		clip: 'rect(0px 500px 400px 0px)'
	// 	}, 1000,function(){
	// 		$flipItem j_flipItems.not(function(idx){
	// 			return (idx === curr + 2)  || (idx === curr + 2 + 1)
	// 		}).removeClass('active');
	// 		$(this).removeClass('next').addClass('active')
	// 	});
	// 	$flipEl.animate({
	// 		width: w0,
	// 		left: 0
	// 	}, 1000,function(){
	// 		curr += 2;
	// 		$(this).removeClass('fliping').addClass('active')
	// 	});
	// })
	

})	
</script>
<div class="cccc" style="width: 1000px;min-height: 360px;margin: 50px auto;position: relative;overflow: hidden;">
	

<div class="flipBook j_flipBook">
	<div class="flipItem j_flipItem">
		<div class="picBox">
			<img src='../images/sample/Front.jpg' class="pic" />
		</div>
	</div>
	<div class="flipItem j_flipItem">
		<div class="picBox">
			<img src='../images/sample/A_Angel_s_Page_1.jpg' class="pic" />
		</div>
	</div>
	<div class="flipItem j_flipItem">
		<div class="picBox">
			<img src='../images/sample/A_Angel_s_Page_2.jpg' class="pic" />
		</div>
	</div>
	<div class="flipItem j_flipItem">
		<div class="picBox">
			<img src='../images/sample/S_Squid_s_Page_1.jpg' class="pic" />
		</div>
	</div>
	<div class="flipItem j_flipItem">
		<div class="picBox">
			<img src='../images/sample/S_Squid_s_Page_2.jpg' class="pic" />
		</div>
	</div>
	<div class="flipItem j_flipItem">
		<div class="picBox">
			<img src='../images/sample/Back.jpg' class="pic" />
		</div>
	</div>
</div>

</div>
<script type="text/javascript">
	$(function function_name(argument) {
			var p = 1;
			var instance = new App.FlipBook({
				$el: $('.j_flipBook')
			});
			$('#left').click(function(){
				p -= 1;
				instance.turnPage(p);
			});
			$('#right').click(function(){
				p += 1;
				instance.turnPage(p);
			})
	})
</script>