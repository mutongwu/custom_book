$(function(){function n(){var n=i.validate();n.FAILED||(n.source=n.source||n.other,n.call=c?"agent.updateAccountVo":"agent.addAccountVo",App.onceAjax({data:n,method:"POST"}).done(function(){c=!0,App.tip(c?"银行账号更新成功。":"银行账号添加成功。")}).fail(function(n){App.tip(n&&n.message,"error")}))}function a(n){if(n){c=!0;var a=n.source,e=!1;$(".j_bankSelect option").each(function(n,o){return o.value===a?(e=!0,!1):void 0}),e||(n.other=a);for(var o in n){var i=t.find('[name="'+o+'"]');n[o]&&i.length&&i.val(n[o])}$(".j_bankSelect").val(e?a:"").trigger("change")}}function e(){App.ajax({data:{call:"agent.getAccountVo"}}).done(function(n){a(n)}).fail(function(n){App.tip(n&&n.message,"error")})}var o=$(".myBankCnt"),t=o.find(".bankForm"),i=new App.FormValidator({$form:t}),c=!1;o.on("click","#j_submit",function(){n()}).on("change",".j_bankSelect",function(){var n=$(this),a=n.val();a?(n.removeClass("disable"),o.find(".j_otherBank").addClass("none").find(".ui-input").addClass("disable")):(o.find(".j_otherBank").removeClass("none").find(".ui-input").removeClass("disable"),n.addClass("disable"))}),e()});