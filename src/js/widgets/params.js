/**
 * @require common.js
 */
(function(){
    var regex = /([^&=]+)=?([^&]*)/g;
    var match, store = {};

    var haystack = window.location.search || window.location.hash;
    haystack = haystack.substring(haystack.indexOf('?') + 1, haystack.length);

    while ((match = regex.exec(haystack))) {
        var key = match[1];
        var val = match[2];
        store[decodeURIComponent(key)] = decodeURIComponent(val.replace(/\+/g,'%20'));
    }

    App.params = function (needle) {
        return needle ? store[needle] : store;
    };
})();