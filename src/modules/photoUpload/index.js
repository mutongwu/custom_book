
function PhotoUpload($container){
    
    this._id = new Date().getTime();
    this.init($container);
}
PhotoUpload.prototype = {
    init: function($container){
        this.$container = $container;
        this.style();
        this.dom();
        this.event();
    },
    event: function(){
        var $box = this.$container;
        this.$fileupload = $box.find('.j_fileupload').fileupload({
            url: '@ROOT_PATH/u/f.do',
            formData:{
                "call": 'attachment.upload'
            },
            dataType: 'json',
            done: function (e, data) {
                var result = data.result;
                $box.find('.j_photo').attr('src','@ROOT_PATH/u/s.do?attachmentId=' + result.data);
                $box.find('.progress-bar').hide();
                $box.find('.attachmentId').val(result.data);
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('.progress-bar').show().html('正在上传' + progress + '%');
            }
        });
    },
    dom: function(){
        var dom = __inline('./dom.html');
        this.domId = this._id + '_dom';
        this.$container.append('<div id="' + this.domId + '">' + dom + '</div>');
    },
    style: function(){
        var css = __inline('./style.scss');
        this.styleId = this._id + '_style';
        this.$container.append('<style id="' + this.styleId + '">'+css+'</style>');
    },
    destroy: function(){
        this.$fileupload.fileupload('destroy');
        this.$container.empty();
    }
}

module.exports = PhotoUpload;