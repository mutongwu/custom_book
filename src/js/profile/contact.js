$(function(){
    var $page = $('.contactFormCnt');
	var ContactForm = require('/modules/contactForm/index');

    new ContactForm({
        $container: $page.find('#j_concactFormBox'),
        data:{
            formCls: ''
        }
    });
})