
var pinyin = ["aoxia", "baozi", "changjinglu", "daishu", "tiane", "fengniao", "gezi", "haitun", "yilong", "ji", "kongque", "luotuo", "mifeng", "nainiu", "haiou", "pangxie", "qie", "rongshu", "shizi", "tuzi", "wugui", "lv", "woniu", "xiongmao", "yingwu", "zhizhu"];
var hanzi = ["螯虾", "豹子", "长颈鹿", "袋鼠", "天鹅", "蜂鸟", "鸽子", "海豚", "翼龙", "鸡", "孔雀", "骆驼", "蜜蜂", "奶牛", "海鸥", "螃蟹", "企鹅", "榕树", "狮子", "兔子", "乌龟", "驴", "蜗牛", "熊猫", "鹦鹉", "蜘蛛"];
var pinyin2 = ["anchun", "banma", "ciwei", "daxiang", "eyu", "fenghuang", "gou", "houzi", "yipinhong", "jingyu", "kaola", "lu", "maotouying", "ningmeng", "lianou", "panyang", "qingwa", "rougui", "songshu", "tuoniao", "wuya", "lvluo", "wandou", "xiyi", "yingtao", "zhangyu"];
var hanzi2 =  ["鹌鹑", "斑马", "刺猬", "大象", "鳄鱼", "凤凰", "狗", "猴子", "一品红", "鲸鱼", "考拉", "鹿", "猫头鹰", "柠檬", "莲藕", "盘羊", "青蛙", "肉桂", "松鼠", "鸵鸟", "乌鸦", "绿箩", "豌豆", "蜥蜴", "樱桃", "章鱼"];

var roles = {};
var alphabet = 'abcdefghijklmnopqrstuvwxyz';
var pingyin = [];
var hanzi = [];
for(var i = 0;i < 26; i++){
	roles[alphabet.chatAt(i)] = [
	{
		'zh': hanzi[i],
		'py':pinyin[i]
	},{
		'zh': hanzi2[i],
		'py':pinyin2[i]
	}
	]
}
var tyRoles = [{
	'zh':'白云',
	'py': 'baiyun',
	'idx':1
},{
	'zh':'宝贝',
	'py': 'baobei',
	'idx':2
},{
	'zh':'地洞',
	'py': 'didong',
	'idx':3
},{
	'zh':'龙卷风',
	'py': 'longjuanfen',
	'idx':4
}];

var getNextTy = (function(){
	var currMap = {};
	return function(ch){
		var result = null;
		var curr = currMap[ch];
		if(!curr){
			curr = 0;
		}
		if(curr < tyRoles.length){
			var item = tyRoles[curr];
			$.extend({
				thumb: '/cn/img_s/' +  ['ty','0'+item.idx,item.py,'s'] + '.jpg',
				first:'/ty/' + ['ty','0'+item.idx,item.py,1].join('_') + '.jpg',
				second:'/ty/' + ['ty','0'+item.idx,item.py,ch].join('_') + '.jpg',
			},item);
			currMap[ch] += 1;
		}
		return result;
	};
})();

var getNextRole = (function(){
	var currMap = {};
	return function(ch){
		var result = null;
		var curr = currMap[ch];
		if(!curr){
			curr = 0;
		}
		if(curr < roles[ch].length){
			var item = roles[ch][curr];
			$.extend({
				thumb: '/cn/img_s/' +  [ch,'0'+(curr+1),item.py,'s'] + '.jpg',
				first:'/role/' + [ch,'0'+(curr+1),item.py,1].join('_') + '.jpg',
				second:'/role/' + [ch,'0'+(curr+1),item.py,2].join('_') + '.jpg',
			},item);
			currMap[ch] += 1;
		}
		return result;
	};
})();

var getFrontEnd = function(){
	return {
		cover: '/name/fengmian_1.jpg',
		kaishi:['/gushi/kaishi_1,jpg','/gushi/kaishi_2,jpg'],
		jiewei:['/name/jiewei_1,jpg','/gushi/jiewei_2,jpg'],
		end: '/gushi/fengdi_2.jpg';
	};
};
var getBase = function(opt){
	opt = $.extend({
		'sex':'boy',
		'type':'type_1',
		'v':'v1'
	},opt);
	return ['//www.sy111.com/book/samples/cn',opt.v,opt.type,opt.sex].join('/');
};

window.GlobalData = {
	getNextTy: getNextTy,
	getNextRole: getNextRole,
	getBase:getBase,
	getFrontEnd:getFrontEnd
};
// function 