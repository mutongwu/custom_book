
<!-- 公共顶部 -->
<div class="topNav">
    <div class="userInfo ">
        <div class="bd cf">
            <h1 class="fl logo">书友</h1>
        </div>
    </div>
    <div class="navMenu">
        <div class="bd">
            <ul class="cf">
                <!-- <li class="fl active"><a href="./admin/order.html">首页</a></li> -->
                <li class="fl active"><a href="./order.jsp" class="link">订单管理</a></li>
                <li class="fl"><a href="./member.jsp"  class="link">会员管理</a></li>
                <li class="fl"><a href="./agency.jsp"  class="link">合作伙伴管理</a></li>
                <li class="fl last"><a href="./balance.jsp" class="link">结算列表</a></li>
                 <!--<li class="fr quickBtn">
                    <a href="./addBook.jsp">退出登陆</a>
                </li> -->
            </ul>
        </div>
    </div>
</div>
<!-- END:公共顶部 -->
<script>
    $(function(){
        var url = document.location.href;
        var page = null;
        if(/\/(\w+)\.jsp/.test(url)){
            page = RegExp.$1;
        }
        $('.topNav .link').filter('[href*='+page+']').closest('li').addClass('active').siblings().removeClass('active');
    });
</script>