/**
 * 	jquery gura 플러그인
 */
// jquery 의 기능을 확장하기 (plugin)
	(function($){
		$.fn.gura=function(options){
			//default 값 정의
			let settings=$.extend({
				msg:"나는 플러그인 이다",
				color:"#ff00ff"
			}, options);
			// this 는 $() 함수를 이용해서 선택된 객체
			this.text(settings.msg).css("color", settings.color);
			// chain 형태로 동작이 가능하도록 this 를 다시 리턴해준다.
			return this;
		};
	})(jQuery);