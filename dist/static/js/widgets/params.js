!function(){var n,o=/([^&=]+)=?([^&]*)/g,e={},a=window.location.search||window.location.hash;for(a=a.substring(a.indexOf("?")+1,a.length);n=o.exec(a);){var c=n[1],r=n[2];e[decodeURIComponent(c)]=decodeURIComponent(r.replace(/\+/g,"%20"))}App.params=function(n){return n?e[n]:e}}();