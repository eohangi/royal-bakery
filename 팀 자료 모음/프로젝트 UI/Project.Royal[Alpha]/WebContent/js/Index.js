		
		
		/*브라우저 크기 변화에 따른 이벤트 처리*/
		$(function(){
			// window_width = 현재 브라우저 창의 너비
			var window_width = $(window).width();

			// width 992px - 1100px 일 때,
				if (window_width >= 1085) {

					/*메뉴바 숨기기 이벤트 처리*/
			
					// 헤드바의 리스트를 숨기기
					$(".depth2").hide();
					$("#depth2").hide();


					//마우스를 올리면 펼쳐짐
					$("ul.list-inline > li").hover(function(){
						$(".depth2").slideDown(300);
						$("#depth2").slideDown(300);

						},function(){
						// 모든 서브 메뉴에 대하여 숨김처리
						$(".depth2").slideUp(300);
						$("#depth2").slideUp(300);

						});
				}
				else if (window_width>=768 && window_width <= 1084) {

				/*메뉴바 숨기기 이벤트 처리*/
			
				// 헤드바의 리스트를 숨기기
				$(".depth2").hide();
				$("#depth2").hide();


				//마우스를 올리면 펼쳐짐
				$("ul.list-inline > li").hover(function(){
					$(".depth2").slideDown(300);
					$("#depth2").slideDown(300);

					},function(){
					// 모든 서브 메뉴에 대하여 숨김처리
					$(".depth2").slideUp(300);
					$("#depth2").slideUp(300);

					});


				/*브랜드 이야기 클래스 재설정*/

				// 클래스 제거
				$("#brand").removeClass();
				

				// 클래스 부여
				$("#brand").addClass("col-md-offset-1");
				$("#brand").addClass("col-md-2");

				/*제품 목록 클래스 재설정*/

				// 클래스 제거
				$("#list").removeClass();

				// 클래스 부여
				$("#list").addClass("col-md-2");

				/*주문 제작 클래스 재설정*/

				// 클래스 제거
				$("#order").removeClass();

				// 클래스 부여
				$("#order").addClass("col-md-2");

				/*커뮤니티 클래스 재설정*/

				// 클래스 제거
				$("#community").removeClass();

				// 클래스 부여
				$("#community").addClass("col-md-2");				

			} else if(window_width <= 767){
				// 헤드바의 리스트를 숨기기
				$(".depth2").hide();
				$("#depth2").hide();
				$(".collapse.in").css("min-height","180px !important");
			}

		});

		