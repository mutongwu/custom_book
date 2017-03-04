$(function(){

    var nameForm = {
        $box: $('#j_nameFormBox'),
        init: function(){
            var _this = this;
            var charatorBtns = this.$box.find('.charatorBox > .sex');
            var popLayers = this.$box.find('.charatorBox > .charatorPopBox');
            var activePop = null;

            // hide all
            $(document).on('click',function(event){
                if(!$(event.target).is(charatorBtns) && !$(event.target).is(popLayers)){
                    popLayers.hide();
                }
            });

            // 男女角色选择
            charatorBtns.on('click',function(){
                var el = $(this),
                    popBox = el.siblings('.charatorPopBox');
                if(el.hasClass('ui-button-gray')){
                    el.removeClass('ui-button-gray');
                    charatorBtns.not(el).addClass('ui-button-gray');
                    popLayers.hide();
                    popBox.show();
                    activePop = popBox[0];
                }else{
                    popBox.show();
                    activePop = popBox[0];
                }
            });
            // 角色人物选择
            popLayers.on('click','.picBox',function(){
                $(this).addClass('active').siblings('.picBox').removeClass('active');
                popLayers.hide();
            });
            
        }
    };

    // 编辑绘本页面
    if($('.bookEditCnt').size()){
    	nameForm.init();
    }
});