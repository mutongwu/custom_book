
<div class="ui-tab mb30">
    <ul class="cf j_agencyTab">
        <li class="tabItem"><a href="./coupon.jsp">优惠码</a></li>
        <li class="tabItem"><a href="./agency.jsp">代理资料</a></li>
        <li class="tabItem"><a href="./record.jsp">返利记录</a></li>
        <li class="tabItem"><a href="./statement.jsp">结算记录</a></li>
        <li class="tabItem"><a href="./mybank.jsp">结算银行</a></li>
    </ul>
</div>
<script type="text/javascript">
	$(function(){
		if(/\/(\w+)\.jsp/.test(location.href)){
			var p = RegExp.$1;
			$('.j_agencyTab').find('a[href*="' + p + '"]').closest('.tabItem').addClass('active');
		}
	})
</script>