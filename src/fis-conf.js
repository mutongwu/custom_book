
fis.match('*.scss', {
    parser: fis.plugin('node-sass'),
    rExt: '.css'
});

fis.match('package*.json', {
  release: false
});

fis.match('*.{png,js,css,jpeg,jpg,gif}', {
  release: '/static/$0'
});

/*打包配置*/
fis.match('::package', {
  postpackager: fis.plugin('loader', {
    allInOne: true
  })
}).match('lib/*.js', {
  packTo: '/pkg/aio.js',
  packOrder: -50
}).match('widgets/*.js', {
  packTo: '/pkg/aio.js'
}).match('jquery-1.11.3.min.js', {
  packOrder: -100
}).match('common.js', {
  packOrder: -10
}).match('css/{common.css,style.scss,bookfx.css}', {
  packTo: '/pkg/aio.css'
}).match('common.css', {
  packOrder: -100
});

fis.match('**', {
    deploy: [
        fis.plugin('local-deliver')
    ]
});

/*页面访问的根路径(替换a标签页面 href属性)*/
fis.match('*.html', {
    deploy: [
        fis.plugin('replace', {
            from: '@ROOT_PATH',
            to: ''
        }),
        fis.plugin('local-deliver')
    ]
});

/*===================发布配置====================*/
fis.media('prod').match('*.js', {
  optimizer: fis.plugin('uglify-js')
}).match('*.css', {
  optimizer: fis.plugin('clean-css')
}).match('*.{js,css,png,jpeg,jpg,gif}', {
  useHash: true
}).match('*', {
    // domain: '//www.sy111.com/book'
}).match('*.html', {
    deploy: [
        fis.plugin('replace', {
            from: '@ROOT_PATH',
            to: ''
        }),
        fis.plugin('local-deliver') //must add a deliver, such as http-push, local-deliver
    ]
});