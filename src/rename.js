const fs = require('fs');
// const walk = require('walk');
const path = require('path');

// let  options = {
//     followLinks: false
//     // directories with these keys will be skipped 
//   , filters: ["node_modules", "_Temp"]
//   };
 
// let  walker = walk.walk("./login", options);
// walker.on("file", function (root, fileStats, next) {
// 	if(/\.html$/.test(fileStats.name)){
// 		console.log(fileStats)
// 		// fs.renameSync(fileStats.name, fileStats.name.replace(/html$/,'jsp'));
// 	}
// 	next();
// });

var root = path.resolve(__dirname)  
  

var deep = [];
function readDirSync(filepath){  
    var pa = fs.readdirSync(filepath);  
    pa.forEach(function(ele,index){  
        var info = fs.statSync(filepath+"/"+ele)      
        if(info.isDirectory() && ele !== 'node_modules'){  
            // console.log("dir: "+ele)  
            deep.push(ele);
            readDirSync(filepath+"/"+ele);  
            deep.pop();
        }else{ 
        	
        	if(/\.html$/.test(ele)){
        		let fullpath = path.resolve(...deep, ele);
        		let content = fs.readFileSync(fullpath);
        		content = '<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>\n' + content;
        		fs.writeFileSync(fullpath, content);
     			fs.renameSync(fullpath, fullpath.replace(/html$/,'jsp'));
        	}
            
        }     
    })  
}  

readDirSync(root) ;