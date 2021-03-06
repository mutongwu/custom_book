$(function(){
	var PhotoUpload = require('/modules/photoUpload/index');
	var ContactForm = require('/modules/contactForm/index');

	var $page = $('.cartCnt');
	var $form = $page.find('.j_addressForm');
	var $box = $page.find('.j_priceTotal');
	var validator = new App.FormValidator({$form: $form});
	var cartData = null;

	var contactForm = new ContactForm({
		$container: $page.find('#j_contactFormBox'),
		data:{
			formCls: 'ui-form-L',
			submitCls: 'ui-button-XL ui-button-green'
		}
	});

	function formatRmb(price) {
	    return (price/100).toFixed(2);
	}
	// template.helper('priceFormat', formatRmb);

	var totalPrice = 0;
	var totalDiscount = 0;
	var payTotal = 0;
	function calTotalDiscount(json){
		$.each(json, function(i, item){
			totalPrice += item.statementPrice;
			totalDiscount += item.originalPrice - item.statementPrice;
			payTotal += item.statementPrice;
		});
	}
	function updatePrice(){
		
		$box.find('.j_total').text(formatRmb(totalPrice));
		$box.find('.j_discount').text(formatRmb(totalDiscount));
		$box.find('.j_price').text(formatRmb(payTotal));
	}

	function nextDiscount(){
		switch(cartData.length){
			case 1: return '10%';
			case 2: return '15%';
			case 3: return '20%';
			default:  return '20%'; 
		}
	}
	function initAddress(json){
		json = json || {};
		for(var p in json){
			var el = $form.find('[name="'+p+'"]');
			if(json[p] && el.length){
				el.val(json[p]);
			}
		}
		$('#j_distpicker').distpicker({
			province: json.province,
			city: json.city,
			district: json.county
	  	});
	}
	function loadAddress(){
	    App.ajax({
	        data: {
	            'call': 'address.getDefaultAddressByUserId'
	        }
	    }).always(function(json){
	        initAddress(json);
	    });
	}
	function loadData(){
		App.ajax({
			data:{
				'call': 'shopCart.list'
			}
		}).done(function(json){
			if(json && json.length){
				cartData = json;
				$page.find('#j_cartList').html(template('itemTpl', json));
				$page.find('.j_discount').text(nextDiscount());
				$page.find('.adviceBox,.addressBox,.priceBox,.btnBox').removeClass('none');
				loadAddress();
				calTotalDiscount(json);
				updatePrice();
			}else{
				$page.find('#j_cartList').html('<p class="tc">购物车空空如也~</p>');
			}
		}).fail(function(res){
			App.tip(res && res.message, 'error');
		});
	}
	function updateCouponPrice($el, coupon){
		App.onceAjax({
			method:'POST',
			data:{
				couponNo:coupon,
				call:'shopCart.calcShopCartPrice'
			}
		}).done(function(json){
			if(json && json.couponNo){
				App.tip('优惠码使用成功,总价已更新');
				
				$box.find('.j_discount').text(formatRmb(json.originalPrice - json.statementPrice));
				$box.find('.j_price').text(formatRmb(json.statementPrice));
			}else{
				App.tip('无效的优惠码','error');
				$el.addClass('ui-input-error');
			}
		}).fail(function(res){
			$el.addClass('ui-input-error');
			App.tip(res && res.message, 'error');
		});
	}
	function getGoodsId(){
		var str = [];
		$.each(cartData, function(i,item){
			str.push(item.orderGoodsId);
		});
		return str.join(',');
	}
	function submitOrder(){
		var result = validator.validate();
		var data = {'call': 'order.submitOrder'};
		if(!result.FAILED){
			if(!result.addressId){
				App.tip('请先添加收货地址信息.','error');
				return;
			}
			if(!contactForm.check()){
				return;
			}
			data.addressId = result.addressId;
			data.orderGoodsIds  = getGoodsId();
			data.couponNo = $.trim($('.j_couponInput').val());
			App.onceAjax({
				method:'POST',
				data:data
			}).done(function(json){
				App.tip('订单提交成功，正在前往支付');
				setTimeout(function(){
					App.linkTo('/alipay/pay.do',{
						orderId: json.orderId
					});
				},1000);
			}).fail(function(res){
				App.tip(res && res.message, 'error');
			});
		}else{
			App.tip('请先添加收货地址信息.','error');
		}
	}

	function deleteItem(idx){
		var item = cartData[idx];
		App.onceAjax({
			method:'POST',
			data:{
				'call': 'shopCart.remove',
				'orderGoodsId': item.orderGoodsId
			}
		}).done(function(json){
			App.tip('删除成功！');
			setTimeout(function(){
				location.reload(true);
			},500);
		}).fail(function(res){
			App.tip(res && res.message, 'error');
		});
	}

	$page.on('click','#j_submit', function(){
		submitOrder();
	}).on('click','.j_delItem', function(){
		var idx = $(this).data('idx');
		App.confirm('确定从购物车删除该绘本吗？', function(){
			deleteItem(idx);
		});
	}).on('click', '.j_cartItemEdit', function(){
		var idx = $(this).data('idx')
		if(EditCartItem.isEditing(idx)){
			App.tip('请先保存其它编辑未完成的绘本信息。','error');
		}else{
			EditCartItem.init()
		}
	}).on('click','.j_saveAddress', function(){
		var result = validator.validate();
		if(!result.FAILED){
			result.call = result.addressId ? 'address.modifyAddress' : 'address.saveAddress';
			App.onceAjax({
				method:'POST',
				data: result
			}).done(function(json){
				$form.find('[name="addressId"]').val(json.addressId);
				App.tip('收货地址保存成功');
			}).fail(function(res){
				App.tip('收货地址保存失败','error');
			});
		}else{
			App.tip('请填写收货地址','error');
		}
	}).on('click','.j_showCouponTip',function(){
		new App.LightBox({
			type:'alert',
			title: '优惠码说明',
			msg: template('couponTipTpl',{}),
			msgType:'none',
			timeout:null
		}).show();
	}).on('blur','.j_couponInput',function(){
		var coupon = $.trim(this.value);
		if(coupon){
			updateCouponPrice($(this), coupon);
		}
	}).on('focus','.j_couponInput',function(){
		$(this).removeClass('ui-input-error');
	});

	loadData();

	// ------------------------------------------//
	var EditCartItem = {
		currIdx: null,
		currUpload: null,
		currBookFx: null,
		isEditing: function(idx){
			if(this.currIdx !== null && this.currIdx != idx){
				return true;
			}
			this.currIdx = idx;
			return false;
		},
		init: function(){
			var $editItemCnt = $('.j_cartItem').eq(this.currIdx).find('.j_editItemCnt');
			this.$box = $editItemCnt;
			var currCart = cartData[this.currIdx];

			$editItemCnt.html(template('editItemTpl')).show();
			this.currUpload = new PhotoUpload({
				$container:$editItemCnt.find('.j_photoUploadDiv'),
				attachmentId: currCart.attachmentId
			});
			this.currBookFx = new App.BookFx({
				$cnt: $('#j_bookCnt'),
				data:  {
					nameStr: currCart.pinyinName,
					zhNameStr: currCart.chineseName,
					opt:{
						sex: currCart.gender == 1 ? 'boy':'girl',
						v:  currCart.storyId	
					},
					list: JSON.parse(currCart.nameInfo)
				}
			});
			// this.currNameRoleForm = new NameRoleForm({
			// 	$container: $editItemCnt.find('#j_nameRoleDiv'),
			// 	py:currCart.pinyinName,
			// 	zh: currCart.chineseName,
			// 	sex: currCart.gender == 1 ?'boy':'girl',
			// 	v:  currCart.storyId
			// });
			this.$box.find('.ui-textarea').val(currCart.message);
			this.$box.find('.j_isPacking').filter('[value="'+ currCart.isPacking +'"]').click();
			this.initEvent();
		},
		saveItem:function(){
			var self = this;
			var currCart = cartData[this.currIdx];
			currCart.attachmentId = this.currUpload.getResult();
			currCart.isPacking = this.$box.find('[name="gift"]:checked').val();
			var message = this.$box.find('.ui-textarea').val();
			if(!message){
				return App.tip('请先填写寄语.','error');
			}
			currCart.message = message;
			currCart.nameInfo = JSON.stringify(this.currBookFx.getResult());
			currCart['call'] = 'shopCart.modify';
			App.onceAjax({
				data: currCart,
				method:'POST'
			}).done(function(res){
				App.tip(res && res.message || '商品修改成功！');
				self.destroy();
				setTimeout(function(){
					location.reload();
				},200);
			}).fail(function(res){
				App.tip(res && res.message, 'error');
			});
		},
		initEvent: function(){
			var self = this;
			this.$box.on('click', '#j_cancelUpdate', function(){
				self.destroy();
			}).on('click', '#j_updateCartItem', function(){
				self.saveItem();
			});
		},
		destroy: function(){
			this.currBookFx.destroy();
			this.currUpload.destroy();
			this.currUpload = this.currBookFx = this.currIdx = null;
			this.$box.off().empty().hide();
		}
	}
})