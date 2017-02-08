
// fis.hook('relative');

// 让所有文件，都使用相对路径。
// fis.match('**', {
//      relative: true
// });

fis.match('*.bat', {
    release: false
});

fis.match('*.scss', {
    parser: fis.plugin('node-sass'),
    rExt: '.css'
});

fis.media('debug').match('*.{js,css,png}', {
    useHash: false,
    useSprite: false,
    optimizer: null
});