		function showSubMenu() {
			setTimeout(function() {
				$(".depth2").slideDown(300);
				$("#depth2").slideDown(300);
			}, 1000);
		}

		function hideSubMenu() {
			// 모든 서브 메뉴에 대하여 숨김처리
			$(".depth2").slideUp(300);
			$("#depth2").slideUp(300);
		}
		
		/*브라우저 크기 변화에 따른 이벤트 처리*/
		$(function(){

			$("ul.list-inline").bind({
				mouseenter: showSubMenu,
				mouseleave: hideSubMenu
			});

			$(window).resize(function() {
				// window_width = 현재 브라우저 창의 너비
				var window_width = $(window).width();
				console.log(window_width);

				// width 992px - 1100px 일 때,
					if (window_width >= 1085) {

						/*메뉴바 숨기기 이벤트 처리*/
				
						// 헤드바의 리스트를 숨기기
						$(".depth2").hide();
						$("#depth2").hide();

					// 클래스 부여
					$("#order").addClass("col-md-1");
					$("#order").removeClass("col-md-2");


						//마우스를 올리면 펼쳐짐
						$("ul.list-inline").bind({
							mouseenter: showSubMenu,
							mouseleave: hideSubMenu
						});
					}
					else if (window_width>=768 && window_width <= 1084) {

					/*메뉴바 숨기기 이벤트 처리*/
				
					// 헤드바의 리스트를 숨기기
					$(".depth2").hide();
					$("#depth2").hide();

					// 이벤트 삭제
						$("ul.list-inline").unbind("mouseenter");
						$("ul.list-inline").unbind("mouseleave");


					/*브랜드 이야기 클래스 재설정*/

					// 클래스 제거
					$("#brand").removeClass();
					

					// 클래스 부여
					$("#brand").addClass("col-md-offset-1 col-md-2");

					/*제품 목록 클래스 재설정*/

					// 클래스 제거
					$("#list").removeClass();

					// 클래스 부여
					$("#list").addClass("col-md-2");

					/*주문 제작 클래스 재설정*/

					// 클래스 제거
					$("#order").removeClass();

					// 클래스 부여
					$("#order").addClass(".col-md-2");

					/*커뮤니티 클래스 재설정*/

					// 클래스 제거
					$("#community").removeClass();

					// 클래스 부여
					$("#community").addClass("col-md-2");				

				} else if(window_width <= 767){
					// 헤드바의 리스트를 숨기기
					$(".depth2").hide();
					$("#depth2").hide();
					// 이벤트 삭제
						$("ul.list-inline").unbind("mouseenter");
						$("ul.list-inline").unbind("mouseleave");
					$(".collapse.in").css("min-height","180px !important");
				}
			});

		});

		