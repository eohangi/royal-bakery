<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<%@
include file = "/css/common.css" %>
	/**  header*/ .header {
	padding-top: 70px;
}

.form-group {
	
}
/**<<<<<<<<<<<<<<<<<<<<<<<<<<<<제품등록 버튼*/
.product {
	margin-top: 10px;
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
	<%@ include file="Header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="header">
				<div class="Search">
					<form class="form-inline" method="post"
						action="${pageContext.request.contextPath}/검색창 활성화 서브릿 주소">
						<fieldset>
							<div class="form-group">
								<label class="sr-only" for="search">검색할 단어를 입력하세요.</label> <input
									type="search" class="form-control" name="search">
							</div>
							<button type="submit" class="btn btn-primary">검색</button>
						</fieldset>
					</form>

				</div>
				<!-- <<<<<<<<<<<<<<<<<<< 제품 등록 서블릿 경로 >>>>>>>>>>>>>>>>>>>> -->
				<div class="product">
					<a href="${pageContext.request.contextPath}/제품등록경로"
						class="btn btn-primary">제품등록</a>
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
							<th class="text-center">가입일자</th>
							<th class="text-center">구매내역</th>
							<th class="text-center">문의내역</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test=${회원목록객체 != null}>
								<tr>
									<th class="text-center">${회원목록객체.birthDate}</th>
									<th class="text-center">${회원목록객체.mem_Id}</th>
									<th class="text-center">${회원목록객체.mem_Name}</th>
									<th class="text-center">${회원목록객체.Gender}</th>
									<th class="text-center">${회원목록객체.Phone_no}</th>
									<th class="text-center">${회원목록객체.Reg_date}</th>
									<th class="text-center">
									<button type="button"
											href="${pageContext.request.contextPath}/구매내역.do">구매내역</button></th>
									<th class="text-center">
									<button type="button"
											href="${pageContext.request.contextPath}/문의내역.do">문의내역</button></th>

								</tr>
							</c:when>
							<c:otherwise>
							회원이 없습니다.
							</c:otherwise>
						</c:choose>

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

	<%@ include file="inc/footer.jsp"%>

</body>

</html>