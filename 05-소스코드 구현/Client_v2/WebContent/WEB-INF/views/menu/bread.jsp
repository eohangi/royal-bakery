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
<!--
content 내용 ...으로 생략 -->
 
</style>

</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="page-header"></div>


	<div class="row">


		<!-- 페이지 내용 영역 -->
		<div class="col-md-1" id="slide1">
			<h1>슬라이드1</h1>
		</div>
		<div class="col-md-9">
			<ul id="myTab" class="nav nav-tabs">
				<li class="col-md-4 col-sm-4 active text-center"><a data-classify="a"
					data-toggle="tab" href="#list">bread</a></li>
				<li class="col-md-4 col-sm-4 text-center"><a data-classify="b"
					data-toggle="tab" href="#list">cake</a></li>
				<li class="col-md-4 col-sm-4 text-center"><a data-classify="c"
					data-toggle="tab" href="#list">cookie</a></li>
			</ul>

			<!--// 탭 메뉴 끝 -->

			<!-- 탭 화면 시작 -->
			<div class="tab-content">
				<div class="tab-pane fade" id="list">
					<!-- ajax를 이용한 내용영역 -->
				</div>
			</div>
			<!--// 탭 화면 끝 -->

			<!-- template -->
			<script id="image_item_tmpl" type="text/x-handlebars-template">
				{{#each item}}
					<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
						<div class="item">
							<div class="caption">
								<p class="text-center" style="margin:15px;"><b>{{proName}}</b></p>
							</div>
							<hr style="margin:5px" />
							<div class="over">
								<div class="img">
									<a>
										{{#if (is_null proImg)}}
											<img src="${pageContext.request.contextPath}/asset/img/no_image.jpg" width="100%" />	
										{{else}}	
											<img src="../download.do?file={{{proImg}}}" width="100%" />	
										{{/if}}		
									</a>
								</div>
								<div class="detail" style="width:100%">
									<div class="info row">
										<div>
											<div class="content" id="content" style="white-space: normal; word-wrap:nomal;overflow: hidden;
												text-overflow: ellipsis; width:50%;	min-height: 50px; display:inline-block;">{{content}}</div>
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
										<br />
										<div style="display: inline-block ; width:100%;">
											{{#if (eq status 'o')}}
													<div style="width:50%; display:inline;" class="text-center">현재 수량 : {{stock}}</div>	
													<div style="width:50%; display:inline;" class="text-center">가격 : {{proPrice}}</div>	
											{{else}}
													<span class="text-center"><b>품절 되었습니다.</b></span>	
											{{/if}}
										</div>						
									</div>	
									<div class="order">
	
									</div>	
								</div>
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
			    if(a === b) // Or === depending on your needs
			        return true;
			    else
			        return false;
			});
			
			/* null 검사 메서드 */
			Handlebars.registerHelper('is_null', function(a,  opts) {
				console.log(a + "/" );
			    if(a == null) // Or === depending on your needs
			        return true;
			    else
			        return false;
			});
			
				$(function() {
					/* 탭 페이지가 보여질 경우의 이벤트 */
					// 탭 안의 모든 <a> 태그에 대한 이벤드 --> 모든 탭 페이지가 열릴 때이 이벤트가 호출됨
					$("#myTab a").click(function(e){
						//data-deptno 속성의 값을 취득한다.
						var current_classify = $(this).data("classify");
						
						//Ajax요청을 통한학과 데이터 조회
						$.get('../product/productList.do',{classify:current_classify},function(json){
							
							//미리 준비한 HTML틀을 읽어온다.
						 	var template = Handlebars.compile($("#image_item_tmpl").html());
							//Ajax를 통해서 읽어온 JSON내부의 배열 데이터를 템플릿에 병합한다.
							var html = template(json);
							//완성품을 출력한다.
							$("#list").html(html);
						});
					});
						
					
					
					/* content 높이 설정 */
					//content의 너비
					/* var content_width = $("#content").css("width");
					
					//높이설정
					$("#content").css("height",content_width*0.8 + "%"); */
					
					/* 제품 이미지 Hover시 변환되는 스크립트 */
					
				});			
			</script>
		</div>


		<!-- 슬라이드 2 -->
		<!---------------------------------------  장바구니    ------------------------------------------->
		<form class="form-horizontal" id="inquireform">

			<div class="col-md-2" style="padding-right: 0px;">

				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="text-center" colspan="2"
								style="background-color: rgb(217, 204, 255)">장바구니</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<th class="text-center">
							<th class="text-center">삭제</th>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th class="text-center"
								style="background-color: rgb(209, 255, 204)"></th>
							<th class="text-center"
								style="background-color: rgb(209, 255, 204)">총금액</th>
						</tr>
						<tr>
							<th class="text-center" colspan="2"
								style="background-color: rgb(209, 255, 204)">
								<button type="submit" class="btn btn-primary" onclick=' '>예약하기</button>
							</th>
						</tr>
					</tfoot>
				</table>

			</div>
		</form>
		<!--------------------------------------  장바구니 ------------ ------------------------- -->
	</div>

	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>