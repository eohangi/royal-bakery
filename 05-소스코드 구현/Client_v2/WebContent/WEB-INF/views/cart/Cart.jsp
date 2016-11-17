<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>

</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>

	<script id="cart_item_tmpl" type="text/x-handlebars-template">								
								{{#each item}}		
								
									<tr align="center">
										<td width="23%" class="text-center">{{proName}}</td>
										<td width="23%" class="text-center">{{proCount}}</td>
										<td width="23%" class="text-center">{{proPrice}}</td>
										<td><a class="cart_delete btn btn-xs" id="cart-delete" data-id="{{{id}}}"  onclick=''><i class="glyphicon glyphicon-remove"></i></a></td>
									</tr>
						
								{{/each}}
								{{#each item2}}	
								
									<tr align="center">
										<td width="23%" class="text-center">{{cuText}}</td>
										<td width="23%" class="text-center">{{cuCount}}</td>
										<td width="23%" class="text-center">{{cuPrice}}</td>
								<td><a class="cart_delete btn btn-xs" id="cart-delete" data-id="{{{id}}}"  onclick=''><i class="glyphicon glyphicon-remove"></i></a></td>
									</tr>
						
								{{/each}}

	</script>
	<script type="text/javascript">
		/* 새로운 메서드 정의 */

		/** AJAX로 JSON데이터를 가져와서 화면에 출력하는 함수 */
		function get_list() {
			$.get("../cart/Cart.do", {
				memberId : 0
			}, function(json) {
				console.log("hello");
				if (json.rt == "Not_Login") {
					alert("로그인이 필요합니다.");
					window.location = "../member/Login.do";
					return false;
				}
				if (json.rt == "Data_fail") {
					alert("장바구니 조회에 실패하였습니다.");
					return false;
				}
				// JSON배열과 템플릿의 결합
				// var tmpl = $("#dept_item_tmpl").tmpl(req.item);
				// 미리 준비한 HTML틀을 읽어온다.
				var template = Handlebars.compile($("#cart_item_tmpl").html());
				// Ajax를 통해서 읽어온 JSON을 템플릿에 병합한다.
				var html = template(json);
				// #result에 읽어온 내용을 추가한다.
				$("#cart_list_body").html(html);
			});
		}

		$(function() {
			get_list();
			//장바구니에서 품목 삭제
			$(document).on(
					"click",
					".cart_delete",
					function() {
						//data-proId 속성의 값을 취득한다.
						var id = $(this).data("id");
						console.log(id);

						//삭제 버튼을 눌렀을 때 삭제
						$.get("../cart/CartItemDelete.do", {
							id : id
						}, function(json) {
							//미리 준비한 HTML틀을 읽어온다.
							var template = Handlebars.compile($(
									"#cart_item_tmpl").html());
							// Ajax를 통해서 읽어온 JSON을 템플릿에 병합한다.
							var html = template(json);
							// #result에 읽어온 내용을 추가한다.
							$("#cart_list_body").html(html);
						});

					});

		});
	</script>

	<div class="container">

		<div class="col-md-2" id="slide1">
			<h1></h1>
		</div>


		<!-- 페이지 내용 영역(김양수 수정내용)-->
		<div class="col-md-8" Id="content">
			<!-- 페이지에서 보여지는 전체의 내용을 감싸는 박스 -->
			<div class="mypage-container">

				<!-- 해당 페이지의 이름을 보여주는 내용을 감싸는 박스 -->
				<div class="page-name">
					<h3>
						<strong>｜장바구니</strong>
					</h3>
				</div>
				<!-- /해당 페이지의 이름을 보여주는 내용을 감싸는 박스 -->




				<!-- 페이지 이름 아래로 표시되는 모든 내용을 감싸는 박스-->
				<div class="inner-content">


					<!--마이 페이지 안내 메시지를 감싸는 상단의 박스-->
					<!-- 없음 -->
					<!-- /마이 페이지 안내 메시지를 감싸는 상단의 박스-->


					<!-- 페이지에 들어갈 2가지 메뉴시작-->
					<ul class="myquestionlist">
						<li class="table list-unstyled">
							<table class="table table-hover">
								<thead style="background-color: #eee">
									<tr align="center">
										<td width="23%" align="center">상 품</td>
										<td width="23%" align="center">수 량</td>
										<td width="23%" align="center">가 격</td>
										<td width="23%" align="center">예약취소</td>
									</tr>
								</thead>
								<tbody id="cart_list_body">
									<!-- Ajax로 로드한 결과가 표시될 곳 -->
								</tbody>

							</table>
						</li>
					</ul>

					<ul class="cart_button" style="height: 40px;">

						<p class="continue pull-right btn-lg" id="continue">
							<button class="btn btn-default">
								<a
									href="${pageContext.request.contextPath}/mypage/OrderComplete.do">주문하기</a>
							</button>
						</p>
						<p class="continue pull-right btn-lg" id="orderall">
							<button class="btn btn-default">
								<a
									href="${pageContext.request.contextPath}/product/productBread.do">계속 쇼핑하기</a>
							</button>
						</p>

					</ul>
					<!-- /페이지에 들어갈 2가지 메뉴시작-->



				</div>
				<!-- /페이지 이름 아래로 표시되는 모든 내용을 감싸는 박스-->
			</div>
			<!-- /페이지에서 보여지는 전체의 내용을 감싸는 박스 -->
		</div>


		<div class="col-md-2" id="slide2">
			<h3></h3>
		</div>
	</div>

	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>