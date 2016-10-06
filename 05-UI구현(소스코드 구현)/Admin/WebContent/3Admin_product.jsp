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
	
<link rel="stylesheet" href="plugins/sweetalert/sweetalert.css" />

<script src="plugins/sweetalert/sweetalert.min.js"></script>	

<script type="text/javascript">
$(function(){
	$("#delete").click(function(){
			swal({
			  title: "삭제",
			  text: "이 회원을 삭제 하겠습니까?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-primary",
			  confirmButtonText: "삭제",
			
			  
			  
			  cancelButtonClass: "btn-danger",
			  cancelButtonText: "취소",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
				if(isConfirm){
					location.href="3Admin_order.jsp";
				}else{
				location.href="3Admin_order.jsp";
				}
			
			});  
	});
});
</script>

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

				<div class="product">
					<button type="submit" class="btn btn-primary"><a href="3Admin_product_create.jsp">제품등록</a></button>
				</div>

			</div>
			<!-- 페이지 내용 영역 -->
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="text-center">상태</th>
							<th class="text-center">제품명</th>
							<th class="text-center">상세 분류</th>
							<th class="text-center">가격</th>
							<th class="text-center">수량</th>
							<th class="text-center">관리</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<th class="text-center">판매중</th>
							<th class="text-center">초코 쿠키</th>
							<th class="text-center">쿠키</th>
							<th class="text-center">1000 원</th>
							<th class="text-center">10개</th>
							<th class="text-center"><a href="3Admin_product_update.jsp">수정</a> / <a href="#" id="delete">삭제</a></th>
						</tr>
						<tr>
							<th class="text-center">판매중</th>
							<th class="text-center">초코 쿠키</th>
							<th class="text-center">쿠키</th>
							<th class="text-center">1000 원</th>
							<th class="text-center">10개</th>
							<th class="text-center">수정 / 삭제</th>
						</tr>
						<tr>
							<th class="text-center">판매중</th>
							<th class="text-center">초코 쿠키</th>
							<th class="text-center">쿠키</th>
							<th class="text-center">1000 원</th>
							<th class="text-center">10개</th>
							<th class="text-center">수정 / 삭제</th>
						</tr>
						<tr>
							<th class="text-center">판매중</th>
							<th class="text-center">초코 쿠키</th>
							<th class="text-center">쿠키</th>
							<th class="text-center">1000 원</th>
							<th class="text-center">10개</th>
							<th class="text-center">수정 / 삭제</th>
						</tr>
						<tr>
							<th class="text-center">판매중</th>
							<th class="text-center">초코 쿠키</th>
							<th class="text-center">쿠키</th>
							<th class="text-center">1000 원</th>
							<th class="text-center">10개</th>
							<th class="text-center">수정 / 삭제</th>
						</tr>
						<tr>
							<th class="text-center">판매중</th>
							<th class="text-center">초코 쿠키</th>
							<th class="text-center">쿠키</th>
							<th class="text-center">1000 원</th>
							<th class="text-center">10개</th>
							<th class="text-center">수정 / 삭제</th>
						</tr>
						<tr>
							<th class="text-center">판매중</th>
							<th class="text-center">초코 쿠키</th>
							<th class="text-center">쿠키</th>
							<th class="text-center">1000 원</th>
							<th class="text-center">10개</th>
							<th class="text-center">수정 / 삭제</th>
						</tr>
						<tr>
							<th class="text-center">판매중</th>
							<th class="text-center">초코 쿠키</th>
							<th class="text-center">쿠키</th>
							<th class="text-center">1000 원</th>
							<th class="text-center">10개</th>
							<th class="text-center">수정 / 삭제</th>
						</tr>
						<tr>
							<th class="text-center">판매중</th>
							<th class="text-center">초코 쿠키</th>
							<th class="text-center">쿠키</th>
							<th class="text-center">1000 원</th>
							<th class="text-center">10개</th>
							<th class="text-center">수정 / 삭제</th>
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