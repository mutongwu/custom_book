$(function(){function e(e){var i=l.validate();if(!i.FAILED){if(i.userPwd!==i.userPwd2)return void App.tip("密码输入不一致","error");i.call=o[e].api,"phone"===e?delete i.email:delete i.mobile,App.ajax({data:i,method:"POST"}).done(function(){App.alert("您的账号已注册成功，请前往登陆页面登陆！",function(){App.linkTo("/login/login.jsp")},"success")}).fail(function(e){App.tip(e&&e.message,"error")})}}function i(e){function i(){t>1?(e.html("请等待"+t+"秒再获取"),t-=1):a(n,e)}var t="phone"===s?60:30,n=setInterval(i,1e3);return i(),n}function a(e,i){clearInterval(e),i.html("获取").removeClass("disable")}function t(e){var t=n.find(o[s].el),r=l.validateField(t[0]);if(r===!0){e.addClass("disable");var p=i(e),d={call:o[s].codeApi};d[t.attr("name")]=t.val(),App.ajax({data:d,method:"POST"}).done(function(e){App.tip(o[s].tip),n.find(".j_verificationId").val(e.verificationId)}).fail(function(i){App.tip(i&&i.message,"error"),a(p,e)})}else l.setInvalid(t[0],r)}var n=$(".registerForm"),l=new App.FormValidator({$form:n}),o={phone:{api:"user.mobileRegiste",codeApi:"user.getSmsCode",tip:"验证码已发送，请留意您的手机短信",el:".j_phone"},email:{api:"user.emailRegiste",codeApi:"user.getEmailCode",tip:"验证码已发送，请前往您的邮箱查阅",el:".j_email"}},s="phone";n.on("click",".ui-tab .tabItem",function(){var e=$(this);s=e.attr("type"),e.addClass("active").siblings().removeClass("active"),n.find(".j_email,.j_phone").toggleClass("disable"),n.find(".phoneRegister, .emailRegister").toggleClass("none")}).on("click","#j_submit",function(){s=$(".ui-tab .tabItem.active").attr("type"),e(s)}).on("click",".j_getCode",function(){var e=$(this);e.hasClass("disable")||t(e)})});