
// fis.hook('relative');


fis.match('*.scss', {
    parser: fis.plugin('node-sass'),
    rExt: '.css'
});

fis.match('package*.json', {
  release: false
});


fis.media('prod').match('*.js', {
  optimizer: fis.plugin('uglify-js')
}).match('*.{js,css,png,jpeg,jpg}', {
  useHash: true
}).match('*', {
    domain: 'http://cdn.baidu.com/dist'
}).match('::package', {
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