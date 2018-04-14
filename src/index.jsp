
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="./pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="./pub/top.html?__inline" />
    <div class="container indexCnt">
        <div class="infoBox">
            <h1 class="tc">为孩子定制独一无二、珍藏一生的礼物</h1>
            <h2 class="tc">激发儿童阅读兴趣、培养情商的启蒙绘本</h2>
        </div>
        <div class="bookSample">
            <link rel="import" href="./pub/bookfx.jsp?__inline">
        </div>
        <div class="nameFormBox" id="j_nameFormBox">
            <h3>输入小朋友的名字，开启神奇之旅</h3>
            <form class="nameForm tc"  target="_self">
                <div class="fieldBox cf">
                    <input type="text" name="zh" placeholder="中文名字"  class="fl item tc ui-input j_zhInput" maxlength="16" required="required" label="中文名字"/>
                    <input type="text" name="py" placeholder="名字拼音"  class="fl item tc ui-input j_pyInput" maxlength="16" required="required" label="名字拼音"/>
                    <link rel="import" href="./pub/partial_boyPop.html?__inline">
                    <link rel="import" href="./pub/partial_girlPop.html?__inline">
                    <a  class="fl ui-button ui-button-yellow ui-button-XL submit_btn" id="j_submitBtn">马上定制绘本</a>
                </div>
            </form>
        </div>
        <div class="featureBox">
            <ul class="pure-g">
                <li class="pure-u-1-3 item"><h3 class="tc">个性化定制</h3>
                    <p>输入孩子的名字拼音，我们即可为您的孩子制作一本个性化定制的故事书，有小朋友的名字，为小朋友定制的小故事，专为0-8岁的孩子定制。</p>
                </li>
                <li class="pure-u-1-3 item"><h3 class="tc">AR增强现实互动</h3>
                    <p>这本绘本特别采用了增强现实技术，用手机扫一扫绘本上的动物，即可看到3D的动物动画，有动物的真实音效果，还有丰富的解说。小朋友还可以与这些动物互动哦，很神奇吧。</p>
                </li>
                <li class="pure-u-1-3 item"><h3 class="tc">贴心服务</h3>
                    <p>全国范围内，我们都免费配送。输入优惠码，您可以获得特别的优惠。如果是当成礼物送人，我们还特别给您提供精美礼品包装服务。</p>
                </li>
            </ul>
        </div>
        <!-- 轮播图  -->
        <div class="sliderBox j_introSliderBox">
            <ul class="slider cf">
                <li class="sliderItem"><a href="#"><img  class="pic" src="images/slider1.jpg"/>
                    <img class="s-text" src="images/s1_text.png" />
                </a></li>
                <li class="sliderItem"><a href="#"><img  class="pic" src="images/slider2.jpg"/>
                    <img class="s-text" src="images/s2_text.png" />
                </a></li>
                <li class="sliderItem"><a href="#"><img  class="pic" src="images/slider3.jpg"/>
                    <img class="s-text" src="images/s3_text.png" />
                </a></li>
                <li class="sliderItem"><a href="#"><img  class="pic" src="images/slider4.jpg"/>
                    <img class="s-text" src="images/s4_text.png" />
                </a></li>
            </ul>
            <div class="sliderNav">
                <dl>
                <dd class="sliderNavItem active"></dd>
                <dd class="sliderNavItem"></dd>
                <dd class="sliderNavItem"></dd>
                <dd class="sliderNavItem"></dd>
                </dl>
                <div class="sliderNavLeft"></div>
                <div class="sliderNavRight"></div>
            </div>
        </div>
        <!-- END:轮播图 -->


        <div class="userCommentBox">
            <h3 class="title tc">顾客的评价</h3>
            <div class="sliderBox j_commentSliderBox">
                <ul class="slider cf">
                    <li class="sliderItem">
                        <div class="commentItem tc">
                            <img src="./images/core/girl1.jpg" class="uPic" />
                            <p class="name">Linda</p>
                            <p class="text">
                            1.儿子很喜欢这本书，天天看，还能看这书 上的图讲出故事 来。儿童阅读是一个积累和探究的过程，犹如成长一样。陪读和伴读，并不是要代替孩子阅读。选书方面也一样，帮孩子把关，而不是父母做主。
                            </p>
                        </div>
                        <div class="commentItem tc">
                            <img src="./images/core/girl1.jpg" class="uPic" />
                            <p class="name">Linda</p>
                            <p class="text">
                            2.儿子很喜欢这本书，天天看，还能看这书 上的图讲出故事 来。儿童阅读是一个积累和探究的过程，犹如成长一样。陪读和伴读，并不是要代替孩子阅读。选书方面也一样，帮孩子把关，而不是父母做主。
                            </p>
                        </div>
                    </li>
                    <li class="sliderItem">
                        <div class="commentItem tc">
                            <img src="./images/core/girl2.jpg" class="uPic" />
                            <p class="name">Linda</p>
                            <p class="text">
                            3.儿子很喜欢这本书，天天看，还能看这书 上的图讲出故事 来。儿童阅读是一个积累和探究的过程，犹如成长一样。陪读和伴读，并不是要代替孩子阅读。选书方面也一样，帮孩子把关，而不是父母做主。
                            </p>
                        </div>
                        <div class="commentItem tc">
                            <img src="./images/core/girl2.jpg" class="uPic" />
                            <p class="name">Linda</p>
                            <p class="text">
                            4.儿子很喜欢这本书，天天看，还能看这书 上的图讲出故事 来。儿童阅读是一个积累和探究的过程，犹如成长一样。陪读和伴读，并不是要代替孩子阅读。选书方面也一样，帮孩子把关，而不是父母做主。
                            </p>
                        </div>
                    </li>
                </ul>
                <div class="sliderNav">
                    <dl>
                    <dd class="sliderNavItem active"></dd>
                    <dd class="sliderNavItem"></dd>
                    </dl>
                </div>
            </div>
        </div>
    </div><!-- END container-->

    <link rel="import" href="./pub/copyright.jsp?__inline">
</div>
<script src="./js/index.js"></script>
</body>
</html>