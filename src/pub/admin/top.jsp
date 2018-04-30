
<!-- 公共顶部 -->
<div class="topNav" id="j_topNav">
    <div class="userInfo j_userInfo">
        <div class="bd cf">
            <h1 class="fl logo">书友</h1>
            <div class="fr userEntry">
                <div class="userBox fl">
                    <img src="/images/user.jpg" class="pic j_headPic" />
                    <span class="userName j_userName"></span>
                </div>
                <a  class="j_logout">退出</a>
            </div>
        </div>
    </div>
    <div class="navMenu">
        <div class="bd">
            <ul class="cf">
                <li class="fl"><a href="./order.jsp" class="link">订单管理</a></li>
                <li class="fl"><a href="./member.jsp"  class="link">会员管理</a></li>
                <li class="fl"><a href="./agency.jsp"  class="link">合作伙伴管理</a></li>
                <li class="fl"><a href="./rebate.jsp" class="link">返利列表</a></li>
                <li class="fl"><a href="./balance.jsp" class="link">结算列表</a></li>
                 <li class="fr quickBtn">
                    <a href="@ROOT_PATH/index.jsp">定制书首页</a>
                </li> 
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
<script type="text/javascript">
    $(function(){
        App.ajax({
            data: {
                'call': 'user.getUserInfo'
            }
        }).done(function(json){
            if(json && json.userId){
                App.User = json;
                var $box = $('#j_topNav .j_userInfo');
                $box.find('.j_userName').text(json.nickname || '书友管理员');
                json.attachmentId && $box.find('.j_headPic').attr('src', '@ROOT_PATH/u/s.do?attachmentId=' + json.attachmentId);
            }
        });
        $('.j_logout').on('click',function(){
            Cookies.remove('onlineId',{path:'/',domain:'.sy111.com'});
            Cookies.remove('user',{path:'/',domain:'.sy111.com'});
            App.linkTo('/index.jsp');
        });
    });
</script>