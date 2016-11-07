<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>

<style>
.right-side, .form-horizontal {
	z-index: 100;
}

table.table {
	z-index: 100;
}
</style>

</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="col-md-offset-1">
		<h1 class="page-header">
			<b>Menu</b>
		</h1>
	</div>


	<div class="row">


		<!-- 페이지 내용 영역 -->
		<div class="col-md-1" id="slide1">
			<h1>슬라이드1</h1>
		</div>
		<div class="col-md-9">
			<ul id="myTab" class="nav nav-tabs">
				<li class="col-md-4 col-sm-4 active text-center"><a
					data-classify="a" data-toggle="tab" href="#list">bread</a></li>
				<li class="col-md-4 col-sm-4 text-center"><a data-classify="b"
					data-toggle="tab" href="#list">cake</a></li>
				<li class="col-md-4 col-sm-4 text-center"><a data-classify="c"
					data-toggle="tab" href="#list">cookie</a></li>
			</ul>

			<!--// 탭 메뉴 끝 -->

			<!-- 탭 화면 시작 -->
			<div class="tab-content">
				<div class="tab-pane active" id="list">
					<!-- ajax를 이용한 내용영역 -->
				</div>
			</div>
			<!--// 탭 화면 끝 -->

			<!-- list template -->
			<script id="image_item_tmpl" type="text/x-handlebars-template">
				{{#each item}}
					<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
						<div class="item">
							<div class="caption">
								<p class="text-center" style="margin:15px;"><b>{{proName}}</b></p>
							</div>
							<hr style="margin:5px" />
							<div class="over" id="over">
								<div class="img" id="img" style="opecity:1; position:absolute">
										{{#if (is_null proImg)}}
											<img src="${pageContext.request.contextPath}/asset/img/no_image.jpg" width="100%" />	
										{{else}}	
											<img src="../download.do?file={{{proImg}}}" width="100%" />	
										{{/if}}		
								</div>
								<div class="detail" id="detail" style="position:absolute; index:100; width:100%">
									<div class="info" style="margin:0; padding-top:20%; width:100%; vertical-align:middle;">
										<div class="info_2" id="info_2" style="display:inline-block; width:100%;" >
											<div class="content" id="content" style="padding-right:5px;white-space: normal; word-wrap:nomal; overflow: hidden;
													overflow-y:hidden; text-overflow: ellipsis; width:50%;	min-height: 50px; display:inline-block;">{{content}}</div>
											<div class="table" style="width:50%; display:inline-block;">
												<table>
													<tr>
														<th>칼로리 : </th>
														<td>{{kcal}}kcal</td>
													</tr>
													<tr>
														<th>나트륨 : </th>
														<td>{{na}}mg</td>
													</tr>
													<tr>
														<th>당 : </th>
														<td>{{sugar}}g</td>
													</tr>
													<tr>
														<th>지방 : </th>
														<td>{{fat}}g</td>
													</tr>
													<tr>
														<th>단백질 : </th>
														<td>{{protein}}g</td>
													</tr>
												</table>
											</div>
										</div>				
									</div>	
								</div>
							</div>
							<br />
							<div style="display: block ; width:100%;">
							{{#if (eq status 'o')}}
								<div style="width:50%" class="text-left pull-left"><b>현재 수량 : {{stock}}</b></div>	
								<div style="width:50%" class="text-left pull-left"><b>가격 : {{proPrice}}</b></div>	
								<br />
								<div class="order" id="order">
									<br />
									<form id="put-form" method="post" class="form-inline row" action="${pageContext.request.contextPath}/product/productOk.do"><!--여기서 장바구니로 전송-->
										<input id="quantity" class="col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1 col-xs-5 col-sm-5 col-md-5 col-lg-5 pull-left text-center" style="height:30px" type="number" name="quantity" min="1" max="{{{stock}}}">
										<input type="hidden" value="{{{id}}}" id="id" name="id" />		
										<button name="id" id="id" value="{{{id}}}" class="col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2 btn btn-success btn-xs put" type="submit" style="height:30px">담기</button>
									</form>
								</div>
							{{else}}
								<span class="text-center"><b>품절 되었습니다.</b></span>	
								<br />
								<div>
									<br />
									<input type="number" name="id" value="{{{id}}}" id="{{{id}}}" class="form-control" style="border:0; padding:0; height:0; visibility:hidden" />
									<button class="btn btn-danger btn-xs" style="margin:auto; style="width:50%" height:30px" type="button">품절</button>
								</div>
							{{/if}}
							</div>		
	
						</div>
					</div>
				{{/each}}
			</script>


			<!-- 사용자 정의 스크립트 -->
			<script type="text/javascript">
				/* 비교 메서드 */
				Handlebars.registerHelper('eq', function(a, b, opts) {
					console.log(a + "/" + b);
					if (a === b) // Or === depending on your needs
						return true;
					else
						return false;
				});
			
				/* null 검사 메서드 */
				Handlebars.registerHelper('is_null', function(a, opts) {
					console.log(a + "/");
					if (a == null) // Or === depending on your needs
						return true;
					else
						return false;
				});
			
				/* 페이지 생성시 기본 이벤트 */
			
				function bage() {
					//data-deptno 속성의 값을 취득한다.
					console.log("list 검사");
					var current_classify = $("li.active a").data("classify");
			
					//Ajax요청을 통한 제품 데이터 조회
					$.get('../product/productList.do', {
						classify : current_classify
					}, function(json) {
			
						//미리 준비한 HTML틀을 읽어온다.
						var template = Handlebars.compile($("#image_item_tmpl").html());
						//Ajax를 통해서 읽어온 JSON내부의 배열 데이터를 템플릿에 병합한다.
						var html = template(json);
						//완성품을 출력한다.
						$("#list").html(html).find(".detail").hide();
			
					});
				}
			
				function show_cart() {
					console.log("cart 검사");
					//페이지가 시작 됐을 때 제품의 정보가 장바구니로
					$.get("../product/productCart.do", {
						memberId : 0
					}, function(json) {
						if(json.rt == "Not_Login"){
							return false;
						}
						//미리 준비한 HTML틀을 읽어온다.
						var template = Handlebars.compile($("#cart_item_tmpl").html());
						//Ajax를 통해서 읽어온 JSON내부의 배열 데이터를 템플릿에 병합한다.
						var html = template(json);
						//완성품을 출력한다.
						$("#cart_list").html(html);
					})
			
				}
			
				/* 메서드 제작 종료 */
			
				$(function() {
					/* 페이지 생성시 기본 이벤트 */
					bage(); //리스트 뷰
					show_cart(); //장바구니 뷰
			
					/* 탭 페이지가 보여질 경우의 이벤트 */
					// 탭 안의 모든 <a> 태그에 대한 이벤드 --> 모든 탭 페이지가 열릴 때이 이벤트가 호출됨
					$("#myTab a").click(function(e) {
						//data-deptno 속성의 값을 취득한다.
						var select_classify = $(this).data("classify");
			
						//Ajax요청을 통한 제품 데이터 조회
						$.get('../product/productList.do', {
							classify : select_classify
						}, function(json) {
			
							//미리 준비한 HTML틀을 읽어온다.
							var template = Handlebars.compile($("#image_item_tmpl").html());
							//Ajax를 통해서 읽어온 JSON내부의 배열 데이터를 템플릿에 병합한다.
							var html = template(json);
							//완성품을 출력한다.
							$("#list").html(html).find(".detail").hide();
			
						});
			
					});
			
					/* hover기능 */
					$(document).on("mouseenter", ".over",
						function() {
							console.log("one");
							/*마우스 커서가 올라감*/
			
							//detail의 높이 img높이,너비와 동일하게 조절
							var img_height = $(this).find("#img").css("height");
							$(this).find("#detail").css("height", img_height);
							var img_width = $(this).find("#img").css("width");
							$(this).find("#detail").css("height", img_height);
			
							//hover기능 구현
							$(this).find("#img").css("opecity","0");
							$(this).find("#detail").fadeIn(800);
						});
			
					$(document).on("mouseleave", ".over",
						function() {
							console.log("two");
							/*마우스 커서가 빠져나감*/
							$(this).find("#detail").hide();
							$(this).find("#img").css("opecity","1");
						});
			
			
					/* 장바구니 담기 동적함수 */
					/*  $(document).ready(function(){
						//페이지가 시작 됐을 때 제품의 정보가 장바구니로
						$.get("../product/productCart.do",{
							memberId:0
						},function(json){
							
							//미리 준비한 HTML틀을 읽어온다.
						 	var template = Handlebars.compile($("#cart_item_tmpl").html());
							//Ajax를 통해서 읽어온 JSON내부의 배열 데이터를 템플릿에 병합한다.
							var html = template(json);
							//완성품을 출력한다.
							$("#cart_list").html(html);
						});
					});  */
					$(document).on("click", ".put", function() {
						//담기 버튼을 눌렀을 때 제품의 정보가 장바구니로
						$("#put-form").ajaxForm(function(json) {
							if (json.rt == "FAIL") {
								alert("수량을 선택하세요.");								
								return false;
							}
							if(json.rt == "Not_Login"){
								alert("로그인이 필요합니다.");
								window.location="../member/Login.do";
								return false;
							}
							if(json.rt == "Not_enough"){
								alert("재고가 없습니다.");
								widow.location="../product/productBread.do";
								return false;
							}
							//미리 준비한 HTML틀을 읽어온다.
							var template = Handlebars.compile($("#cart_item_tmpl").html());
							//Ajax를 통해서 읽어온 JSON내부의 배열 데이터를 템플릿에 병합한다.
							var html = template(json);
							//완성품을 출력한다.
							$("#cart_list").html(html);
							$("#put-form").trigger('reset');
						});
					});
			
					//장바구니에서 품목 삭제
					$(document).on("click", ".cart_delete", function() {
						//data-proId 속성의 값을 취득한다.
						var select_proId = $(this).data("proid");
						console.log(select_proId);
			
						//삭제 버튼을 눌렀을 때 삭제
						$.get("../product/productCartDelete.do", {
							proId : select_proId
						}, function(json) {
							//미리 준비한 HTML틀을 읽어온다.
							var template = Handlebars.compile($("#cart_item_tmpl").html());
							//Ajax를 통해서 읽어온 JSON내부의 배열 데이터를 템플릿에 병합한다.
							var html = template(json);
							//완성품을 출력한다.
							$("#cart_list").html(html);
						});
			
					});
			
				});
			</script>
		</div>


		<!-- cart template -->
		<script id="cart_item_tmpl" type="text/x-handlebars-template">
			{{#each item}}			
				<tr>
					<th class="text-center"
						style="width:40%; background-color:  rgba(5, 73, 49, 0.55)">{{proName}}</th>
					<th class="text-center"
						style="width:18%; background-color:  rgba(5, 73, 49, 0.55)">{{proCount}}</th>
					<th class="text-center"
						style="width:32%; background-color:  rgba(5, 73, 49, 0.55)">{{proPrice}}</th>
					<th class="text-center"
						style="width:10%; background-color:  rgba(5, 73, 49, 0.55)">
						<a style="width:100%; height:100%" class="cart_delete btn btn-xs" id="cart-delete" data-proid="{{{proId}}}"  onclick=''><i style="width:100%; height:100%" class="glyphicon glyphicon-remove"></i></a>	
					</th>
				</tr>
			{{/each}}
			</script>

		<!-- 슬라이드 2 -->
		<!---------------------------------------  장바구니    ------------------------------------------->
		<div class="col-md-2 right-side" style="padding-right: 0px;">
			<form class="form-horizontal right-side" id="inquireform">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="text-center" colspan="4"
								style="background-color: rgba(5, 73, 49, 1)"><b
								style="color: 'white'">장바구니</b></th>
						</tr>
						<tr>
							<th class="text-center"
								style="width: 40%; background-color: rgba(5, 73, 49, 0.85)">품명</th>
							<th class="text-center"
								style="width: 18%; background-color: rgba(5, 73, 49, 0.85)">수</th>
							<th class="text-center"
								style="width: 32%; background-color: rgba(5, 73, 49, 0.85)">가격</th>
							<th class="text-center"
								style="width: 10%; background-color: rgba(5, 73, 49, 0.85)"></th>
						</tr>
					</thead>
					<tbody id="cart_list">
						<tr>
							<!-- cart template -->
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th class="text-center"
								style="background-color: rgba(5, 73, 49, 0.7)" colspan="2">총
								금액</th>
							<th class="text-center" id="sum_price"
								style="background-color: rgba(5, 73, 49, 0.7)" colspan="2">
								<!-- sum_template -->
							</th>
						</tr>
						<tr>
							<th class="text-center" colspan="4"
								style="background-color: rgba(5, 73, 49, 0.7)">
								<a href="${pageContext.request.contextPath}/cart/Cart.do"><button type="button" class="btn btn-success">장바구니</button></a>
							</th>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>

		<!--------------------------------------  장바구니 ------------ ------------------------- -->
	</div>
	<script type="text/javascript">
		$(function() {
			/* 장바구니 스크롤 애니매이션 기능 */
			$(window).scroll(function() {
				$(".right-side").animate({
					"top" : $(this).scrollTop()
				},
					{
						queue : false,
						ducation : 50,
						easing : "swing"
					});
	
			});
		});
	</script>
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>