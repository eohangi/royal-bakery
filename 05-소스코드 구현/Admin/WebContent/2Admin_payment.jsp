<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<title>My JSP Page</title>
<!-- Twitter Bootstrap3 & jQuery -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>

<style type="text/css">

<%@ include file = "css/common.css" %>


/**  header*/
.header {
	padding-top: 70px;
}

.form-group {
	
}

.product {
	float: right;
}

/** table */
.table-responsive {
	padding-top: 100px;
}

.table-striped>tbody>tr:nth-child(odd)>td, .table-striped>tbody>tr:nth-child(odd)>th
	{
	background-color: white !important;
}

.table-striped>tbody>tr:hover>td, .table-striped>tbody>tr:hover>th {
	background-color: orange !important;
}

.pagination {
	margin: 0;
}

</style>
</head>
<body>
<%@ include file = "Header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="header">
				<div class="Search">
					<form class="form-inline">
						<fieldset>
							<div class="form-group">
								<label class="sr-only" for="search">검색할 단어를 입력하세요.</label> <input
									type="search" class="form-control" id="search">
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
							<th class="text-center">상품 내용</th>
							<th class="text-center">주문자</th>
							<th class="text-center">결제금액</th>
							<th class="text-center">수령일</th>
							<th class="text-center">관리</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반 제품</th>
							<th class="text-center"><a href="2Admin_payment_detail.jsp">바게트 외 3건</a></th>
							<th class="text-center">이무기</th>
							<th class="text-center">10000원</th>
							<th class="text-center">2016.09.21</th>
							<th class="text-center">수령완료</th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반 제품</th>
							<th class="text-center"><a href="2Admin_payment_detail.jsp">바게트 외 3건</a></th>
							<th class="text-center">이무기</th>
							<th class="text-center">10000원</th>
							<th class="text-center">2016.09.21</th>
							<th class="text-center">수령완료</th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반 제품</th>
							<th class="text-center"><a href="2Admin_payment_detail.jsp">바게트 외 3건</a></th>
							<th class="text-center">이무기</th>
							<th class="text-center">10000원</th>
							<th class="text-center">2016.09.21</th>
							<th class="text-center">수령완료</th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반 제품</th>
							<th class="text-center">바게트 외 3건</th>
							<th class="text-center">이무기</th>
							<th class="text-center">10000원</th>
							<th class="text-center">2016.09.21</th>
							<th class="text-center">수령완료</th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반 제품</th>
							<th class="text-center">바게트 외 3건</th>
							<th class="text-center">이무기</th>
							<th class="text-center">10000원</th>
							<th class="text-center">2016.09.21</th>
							<th class="text-center">수령완료</th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반 제품</th>
							<th class="text-center">바게트 외 3건</th>
							<th class="text-center">이무기</th>
							<th class="text-center">10000원</th>
							<th class="text-center">2016.09.21</th>
							<th class="text-center">수령완료</th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반 제품</th>
							<th class="text-center">바게트 외 3건</th>
							<th class="text-center">이무기</th>
							<th class="text-center">10000원</th>
							<th class="text-center">2016.09.21</th>
							<th class="text-center">수령완료</th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반 제품</th>
							<th class="text-center">바게트 외 3건</th>
							<th class="text-center">이무기</th>
							<th class="text-center">10000원</th>
							<th class="text-center">2016.09.21</th>
							<th class="text-center">수령완료</th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반 제품</th>
							<th class="text-center">바게트 외 3건</th>
							<th class="text-center">이무기</th>
							<th class="text-center">10000원</th>
							<th class="text-center">2016.09.21</th>
							<th class="text-center">수령완료</th>
						</tr>
						<tr>
							<th class="text-center">1</th>
							<th class="text-center">일반 제품</th>
							<th class="text-center">바게트 외 3건</th>
							<th class="text-center">이무기</th>
							<th class="text-center">10000원</th>
							<th class="text-center">2016.09.21</th>
							<th class="text-center">수령완료</th>
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

<%@ include file = "inc/footer.jsp" %>

</body>

</html>