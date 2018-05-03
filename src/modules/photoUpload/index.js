
function PhotoUpload(config){
    this.config = $.extend({
        $container:null,
        attachmentId:null
    },config);
    this._id = new Date().getTime();
    this.init();
}
PhotoUpload.prototype = {
    init: function(){
        
        this.style();
        this.dom();
        this.event();
        if(this.config.attachmentId){
            this.config.$container.find('.j_photo').attr('src','@ROOT_PATH/u/s.do?attachmentId=' +this.config.attachmentId);
        }
    },
    getResult: function(){
        return this.config.$container.find('.attachmentId').val() || this.config.attachmentId;
    },
    event: function(){
        var $box = this.config.$container;
        this.$fileupload = $box.find('.j_fileupload').fileupload({
            url: '@ROOT_PATH/u/f.do',
            formData:{
                "call": 'attachment.upload'
            },
            dataType: 'json',
            done: function (e, data) {
                var result = data.result;
                if(result.data && typeof result.data === 'string'){
                    $box.find('.j_photo').attr('src','@ROOT_PATH/u/s.do?attachmentId=' + result.data);
                    $box.find('.attachmentId').val(result.data);
                }else{
                    App.tip(result.message || '图片上传失败.','error');
                }
                $box.find('.progress-bar').hide();
            },
            progress: function (e, data) {
                // var progress = parseInt(data.loaded / data.total * 100, 10);
                $box.find('.progress-bar').show().html('正在上传中，请稍候...');
            }
        });
    },
    dom: function(){
        var dom = __inline('./dom.html');
        this.domId = this._id + '_dom';
        this.config.$container.append('<div id="' + this.domId + '">' + dom + '</div>');
    },
    style: function(){
        var css = __inline('./style.scss');
        this.styleId = this._id + '_style';
        this.config.$container.append('<style id="' + this.styleId + '">'+css+'</style>');
    },
    destroy: function(){
        this.$fileupload.fileupload('destroy');
        this.config.$container.empty();
    }
}

module.exports = PhotoUpload;