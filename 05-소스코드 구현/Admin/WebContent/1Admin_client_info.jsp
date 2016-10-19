<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<title>Royal</title>

<!-- Twitter Bootstrap3 & jQuery -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>



<style type="text/css">
<%@ include file = "css/common.css" %>


/**  header*/
	.header{
		padding-top: 70px;
	}

	.form-group{

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
											<label class="sr-only" for="search">검색할 단어를 입력하세요.</label>
											<input type="search" class="form-control" id="search" >
										</div>
										<button type="submit" class="btn btn-primary">검색</button>
									</fieldset>
								</form>

							</div>	

							<div class="product">
								<button type="submit" class="btn btn-primary">제품등록</button>
							</div>

						</div>

			<!-- 페이지 내용 영역 -->
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="text-center">생년월일</th>
							<th class="text-center">아이디</th>
							<th class="text-center">이름</th>
							<th class="text-center">성별</th>
							<th class="text-center">연락처</th>
							<th class="text-center">관리</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="text-center">1990-05-25</th>
							<th class="text-center">goodluck</th>
							<th class="text-center">이한별</th>
							<th class="text-center">남</th>
							<th class="text-center">010-7894-1234</th>
							<th class="text-center"><a href="1Admin_client_info_detail.jsp">보기</a> / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1995-07-16</th>
							<th class="text-center">good</th>
							<th class="text-center">긁핵</th>
							<th class="text-center">남</th>
							<th class="text-center">010-4567-1234</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1985-04-28</th>
							<th class="text-center">luck</th>
							<th class="text-center">읽핡볉</th>
							<th class="text-center">남</th>
							<th class="text-center">010-1237-7822</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1985-04-28</th>
							<th class="text-center">luck</th>
							<th class="text-center">읽핡볉</th>
							<th class="text-center">남</th>
							<th class="text-center">010-1237-7822</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1985-04-28</th>
							<th class="text-center">luck</th>
							<th class="text-center">읽핡볉</th>
							<th class="text-center">남</th>
							<th class="text-center">010-1237-7822</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1990-05-25</th>
							<th class="text-center">goodluck</th>
							<th class="text-center">이한별</th>
							<th class="text-center">남</th>
							<th class="text-center">010-7894-1234</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1990-05-25</th>
							<th class="text-center">goodluck</th>
							<th class="text-center">이한별</th>
							<th class="text-center">남</th>
							<th class="text-center">010-7894-1234</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1990-05-25</th>
							<th class="text-center">goodluck</th>
							<th class="text-center">이한별</th>
							<th class="text-center">남</th>
							<th class="text-center">010-7894-1234</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1990-05-25</th>
							<th class="text-center">goodluck</th>
							<th class="text-center">이한별</th>
							<th class="text-center">남</th>
							<th class="text-center">010-7894-1234</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1990-05-25</th>
							<th class="text-center">goodluck</th>
							<th class="text-center">이한별</th>
							<th class="text-center">남</th>
							<th class="text-center">010-7894-1234</th>
							<th class="text-center">보기 / 예약관리</th>
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