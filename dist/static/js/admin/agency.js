$(function(){function e(e,n){p||(p=new App.PageBar({el:$("#j_pageBox"),cls:"ui_pageBar_L",totalNum:e.count,jumpTo:!1,onPage:function(e){n.p=e,t(n)}}))}function n(){p&&(p.destroy(),p=null)}function t(n){App.ajax({data:n}).done(function(t){t&&t.list?(d.find(".j_tbdBox").html(template("itemTpl",t)),e(t,n)):d.find(".j_tbdBox").html('<tr><td colspan="'+d.find("thead th").length+'"><p class="tc">暂无代理~</p></td></tr>')}).fail(function(e){App.tip(e&&e.message,"error")})}function i(){var e="";$.each(r,function(n,t){e+='<option value="'+n+'">'+t+"</option>"}),d.find(".j_agencyStatus").append(e)}function a(){var e=d.find(".j_beginTime"),n=d.find(".j_endTime"),t=new Date,i=new Date;t.setDate(t.getDate()-7);new App.DatePicker({el:e,val:t,hasTime:!0,format:"yyyy-MM-dd hh:mm:ss",beforeEl:n}),new App.DatePicker({el:n,val:i,hasTime:!0,format:"yyyy-MM-dd hh:mm:ss",afterEl:e})}function o(e){var n={};for(var t in e)""!==e[t]&&(n[t]=e[t]);return n}var r={"-2":"停止合作","-1":"不通过",0:"待审核",1:"审核通过"},d=$(".adminAgencyCnt"),l=new App.FormValidator({$form:d.find(".queryForm")}),m={call:"admin.listPartnerInfo",pageNo:1,pageSize:10},p=null;d.on("click",".j_queryBtn",function(){var e=l.validate();e.beginTime&&(e.beginTime=new Date(e.beginTime).getTime()),e.endTime&&(e.endTime=new Date(e.endTime).getTime()),t($.extend({},m,o(e))),n()}),a(),i(),$(".j_distinctSelect").distpicker()});