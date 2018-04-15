$(function(){
	var PhotoUpload = require('/modules/photoUpload/index');

	var $page = $('.cartCnt');
	var $form = $page.find('.j_addressForm');
	var validator = new App.FormValidator({$form: $form});
	var cartData = null;


	function formatRmb(price) {
	    return (price/100).toFixed(2);
	}
	template.helper('priceFormat', formatRmb);

	var totalPrice = 0;
	var totalDiscount = 0;
	function calTotalDiscount(json){
		$.each(json, function(i, item){
			totalPrice += item.price;
			totalDiscount += item.originalPrice - item.price;
		});
	}
	function updatePrice(){
		var $box = $page.find('.j_priceTotal');
		$box.find('.j_total').text(formatRmb(totalPrice));
		$box.find('.j_discount').text(formatRmb(totalDiscount));
		$box.find('.j_price').text(formatRmb(totalPrice - totalDiscount));
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
	    }).done(function(json){
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
			data.addressId = result.addressId;
			data.orderGoodsIds  = getGoodsId();
			App.onceAjax({
				method:'POST',
				data:data
			}).done(function(json){
				App.tip('订单提交成功，正在前往支付');
				setTimeout(function(){

				},1000);
			}).fail(function(res){
				App.tip(res && res.message, 'error');
			});
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
			this.currUpload = new PhotoUpload($editItemCnt.find('.j_photoUploadDiv'));
			this.currBookFx = new App.BookFx({
				$cnt: $('#j_bookCnt'),
				data:  {
					nameStr: currCart.pinyinName,
					opt:{
						sex: currCart.gender == 1 ? 'boy':'girl',
						v:  currCart.storyId	
					},
					list: JSON.parse(currCart.nameInfo)
				}
			});
			this.initEvent();
		},
		destroy: function(){
			this.currBookFx.destroy();
			this.currUpload.destroy();
			this.currUpload = this.currBookFx = this.currIdx = null;
			this.$box.off().empty().hide();
		},
		initEvent: function(){
			var self = this;
			this.$box.on('click', '#j_cancelUpdate', function(){
				self.destroy();
			}).on('click', '#j_updateCartItem', function(){
				self.saveItem();
			});
		}
	}
})