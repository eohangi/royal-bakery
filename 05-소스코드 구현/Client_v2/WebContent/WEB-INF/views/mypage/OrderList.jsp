<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar2.jsp"%>


	<div class="page-header"></div>
	<div class="container">
		<div class="row">


			<div class="header">
				<div class="Search">
					<form class="form-inline">
						<fieldset>
							<div class="form-group">
								<div class="col-md-10">
									<input type="date" name="birthdate" id="sample2"
										class="form-control" placeholder="yyyy-mm-dd">
								</div>
							</div>
							<button type="submit" class="btn btn-primary">검색</button>
						</fieldset>
					</form>

				</div>

			</div>
			<!-- 페이지 내용 영역 -->
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">종류</th>
							<th class="text-center">상품명</th>
							<th class="text-center">주문자</th>
							<th class="text-center">결제 금액</th>
							<th class="text-center">결제일</th>
							<th class="text-center">관리</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반제품</th>
							<th class="text-center">바게트 외 3개</th>
							<th class="text-center">이한볅</th>
							<th class="text-center">30000원</th>
							<th class="text-center">2016-09-24</th>
							<th class="text-center"><a href="OrderConfirmation.jsp">보기</a></th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반제품</th>
							<th class="text-center">바게트 외 3개</th>
							<th class="text-center">이한볅</th>
							<th class="text-center">30000원</th>
							<th class="text-center">2016-09-24</th>
							<th class="text-center"><a href="OrderConfirmation.jsp">보기</a></th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반제품</th>
							<th class="text-center">바게트 외 3개</th>
							<th class="text-center">이한볅</th>
							<th class="text-center">30000원</th>
							<th class="text-center">2016-09-24</th>
							<th class="text-center"><a href="OrderConfirmation.jsp">보기</a></th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반제품</th>
							<th class="text-center">바게트 외 3개</th>
							<th class="text-center">이한볅</th>
							<th class="text-center">30000원</th>
							<th class="text-center">2016-09-24</th>
							<th class="text-center"><a href="OrderConfirmation.jsp">보기</a></th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반제품</th>
							<th class="text-center">바게트 외 3개</th>
							<th class="text-center">이한볅</th>
							<th class="text-center">30000원</th>
							<th class="text-center">2016-09-24</th>
							<th class="text-center"><a href="OrderConfirmation.jsp">보기</a></th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반제품</th>
							<th class="text-center">바게트 외 3개</th>
							<th class="text-center">이한볅</th>
							<th class="text-center">30000원</th>
							<th class="text-center">2016-09-24</th>
							<th class="text-center"><a href="OrderConfirmation.jsp">보기</a></th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반제품</th>
							<th class="text-center">바게트 외 3개</th>
							<th class="text-center">이한볅</th>
							<th class="text-center">30000원</th>
							<th class="text-center">2016-09-24</th>
							<th class="text-center"><a href="OrderConfirmation.jsp">보기</a></th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반제품</th>
							<th class="text-center">바게트 외 3개</th>
							<th class="text-center">이한볅</th>
							<th class="text-center">30000원</th>
							<th class="text-center">2016-09-24</th>
							<th class="text-center"><a href="OrderConfirmation.jsp">보기</a></th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반제품</th>
							<th class="text-center">바게트 외 3개</th>
							<th class="text-center">이한볅</th>
							<th class="text-center">30000원</th>
							<th class="text-center">2016-09-24</th>
							<th class="text-center"><a href="OrderConfirmation.jsp">보기</a></th>
						</tr>
					</tbody>
				</table>
			</div>

			<ul class="pagination">
				<li class="disabled"><a href="#">&laquo;</a></li>
				<!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용 입니다 .-->
				<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
			<div></div>
		</div>
	</div>

	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>
