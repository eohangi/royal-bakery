<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar2.jsp"%>

	<div class="container">

			<div class="col-md-2" id="slide1">
				<h1> </h1>
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
											<td width="10%">전체선택<br /> <input type="checkbox"
												value="담기"></td>
											<td width="18%" align="left">순서</td>
											<td width="18%" align="center">상 품</td>
											<td width="18%" align="right"> 수 량 </td>
											<td width="18%" align="right"> 가 격</td>
										</tr>
									</thead>
									<tbody align="center">
										<tr>
											<!--줄 추가-->
											<td><input type="checkbox" value="담기"></td>
											<!--1번줄의 첫번째 셀-->
											<td align="left">1</td>
											<td align="center">소보루 빵</td>
											<td align="right"> 5 </td>
											<td align="right">1500 원</td>
										</tr>
										<tr>
											<!--줄 추가-->
											<td><input type="checkbox" value="담기"></td>
											<!--1번줄의 첫번째 셀-->
											<td align="left">2</td>
											<td align="center">치즈크림 단팥빵</td>
											<td align="right"> 3 </td>
											<td align="right">1500 원</td>
										</tr>
										<tr>
											<!--줄 추가-->
											<td><input type="checkbox" value="담기"></td>
											<!--1번줄의 첫번째 셀-->
											<td align="left">3</td>
											<td align="center">모카 롤 케이크</td>
											<td align="right"> 1 </td>
											<td align="right">18900 원</td>
										</tr>
										<tr>
											<!--줄 추가-->
											<td><input type="checkbox" value="담기"></td>
											<!--1번줄의 첫번째 셀-->
											<td align="left">3</td>
											<td align="center">달콤 마카롱 선물세트</td>
											<td align="right"> 1 </td>
											<td align="right">38900 원</td>
										</tr>
									</tbody>
									<tfoot>
										<tr></tr>
									</tfoot>
								</table>
							</li>
						</ul>

						<ul class="button_my_question">

							<p class="continue pull-right btn-lg" id="continue">
								<input type="button" class="btn btn-default" value="주문하기"
									onclick="location.href='OrderComplete.jsp'">
							</p>

							<p class="orderall pull-right btn-lg" id="orderall">
								<input type="button" class="btn btn-default" value="계속 쇼핑하기"
									onclick="location.href='bread.jsp'">
							</p>

							<p class="remove pull-left btn-lg" id="remove">
								<input type="button" class="btn btn-default" value="선택 삭제"
									onclick="location.href='#'">
							</p>

						</ul>
						<!-- /페이지에 들어갈 2가지 메뉴시작-->



					</div>
					<!-- /페이지 이름 아래로 표시되는 모든 내용을 감싸는 박스-->
				</div>
				<!-- /페이지에서 보여지는 전체의 내용을 감싸는 박스 -->
			</div>


			<div class="col-md-2" id="slide2">
				<h3> </h3>
			</div>
		</div>

	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>