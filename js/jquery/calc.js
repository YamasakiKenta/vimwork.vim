// =============================================================================
// FILE: calc.js
// Creation Date: 2014/07/08 9:40:00
// Last Modified: 2014/07/08 12:55:46
// =============================================================================
(function($){
	// 計算
	$.fn.array_calc = function(callback){
		if(typeof this[0]==typeof {}){
			var rtn = {};
			$.each(this[0], function(key,val){
				var val = ($.isArray(val))?val:[val];
				rtn[key] = callback(val);
			});
		}
		else {
			var rtn = callback(this);
		}
		return $(rtn);
	}
	$.fn.sum = function(){
		return $(this).array_calc(function(list){
			var sum = 0;
			$.each(list, function(key,val){
				sum += val;
			});
			return sum;
		});
	};
	$.fn.ave = function(){
		return $(this).array_calc(function(list){
			return $(list).sum().get(0)/list.length;
		});
	};

	// 計算
	$.fn.calc= function(num,callback){
		var rtn = (typeof this[0]==typeof {})?{}:[];
		var tmp = (typeof this[0]==typeof {})?this[0]:this;
		$.each(tmp, function(key,val){
			rtn[key] = callback(Number(val), Number(num));
		});
		return $(rtn);
	}
	$.fn.plus  = function(num){ return $(this).calc(num, function(a,b){return a+b;}); };
	$.fn.multi = function(num){ return $(this).calc(num, function(a,b){return a*b;}); };
	$.fn.minus = function(num){ return $(this).calc(num, function(a,b){return a-b;}); };
	$.fn.div   = function(num){ return $(this).calc(num, function(a,b){return a/b;}); };
	$.fn.round = function(num){ return $(this).calc(num, function(a,b){return (isNaN(b)||b==0)?Math.round(a):Math.round(a/b)*b;});};
	$.fn.floor = function(num){ return $(this).calc(num, function(a,b){return (isNaN(b)||b==0)?Math.floor(a):Math.floor(a/b)*b;});};
	$.fn.ceil  = function(num){ return $(this).calc(num, function(a,b){return (isNaN(b)||b==0)?Math.ceil(a) :Math.ceil(a/b)*b;});};

})(jQuery);


