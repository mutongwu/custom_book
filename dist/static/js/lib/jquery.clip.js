!function(t){function e(t,e){return t.currentStyle&&t.currentStyle[e]||t.style[e]}function r(r){var p=t(r).css("clip")||"";if(!p){var n={top:e(r,"clipTop"),right:e(r,"clipRight"),bottom:e(r,"clipBottom"),left:e(r,"clipLeft")};n.top&&n.right&&n.bottom&&n.left&&(p="rect("+n.top+" "+n.right+" "+n.bottom+" "+n.left+")")}return p.replace(/,/g," ")}t.fx.step.clip=function(t){if(0===t.pos){var e=/rect\(([0-9\.]{1,})(px|em)[,]?\s+([0-9\.]{1,})(px|em)[,]?\s+([0-9\.]{1,})(px|em)[,]?\s+([0-9\.]{1,})(px|em)\)/;t.start=e.exec(r(t.elem)),"string"==typeof t.end&&(t.end=e.exec(t.end.replace(/,/g," ")))}if(t.start&&t.end){for(var p=new Array,n=new Array,s=t.start.length,o=t.end.length,a="em"==t.start[c+1]?1.333*parseInt($(t.elem).css("fontSize"))*parseInt(t.start[c]):1,c=1;s>c;c+=2)p.push(parseInt(a*t.start[c]));for(var l=1;o>l;l+=2)n.push(parseInt(a*t.end[l]));t.elem.style.clip="rect("+parseInt(t.pos*(n[0]-p[0])+p[0])+"px "+parseInt(t.pos*(n[1]-p[1])+p[1])+"px "+parseInt(t.pos*(n[2]-p[2])+p[2])+"px "+parseInt(t.pos*(n[3]-p[3])+p[3])+"px)"}}}(jQuery);