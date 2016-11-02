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

<!-- AJAX HELPER -->
<link rel="stylesheet" href="../plugins/ajax/ajax_helper.css" />
<script src="../plugins/ajax/ajax_helper.js"></script>

<!-- handlebar plugin -->
<script src="../plugins/handlebars/handlebars-v4.0.5.js"></script>


<style type="text/css">
<%@include file ="/css/common.css"%>
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
<!-- JSON 데이터 가져오기 스크립트 시작 -->
<script type="text/javascript">
	/** AJAX로 JSON데이터를 가져와서 화면에 출력하는 함수 ---> req는 JSON 내용. */ 
	function get_list(){
		$.get("${pageContext.request.contextPath}/MEMBERLISTBYADMIN.do"  
			,function(json) {
				var template = Handlebars.compile($("#memberitem").html());
				var html = template(json);
				$("#memberlist").append(html);
			});
		}
	$(function() {
		get_list(); //페이지가 열림과 동시에 호출된다.
		$("#more").click(function(e) {
			get_list(); //버튼이 클릭디면 호출된다.
		});
	});
</script>
</head>
<body>
	<%@ include file="../Header.jsp"%>
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
			</div>
			<!-- 페이지 내용 영역 -->
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<td class="text-center">생년월일</td>
							<td class="text-center">아이디</td>
							<td class="text-center">이름</td>
							<td class="text-center">성별</td>
							<td class="text-center">연락처</td>
							<td class="text-center">가입일자</td>
							<td class="text-center">구매내역</td>
							<td class="text-center">문의내역</td>
						</tr>
					</thead>
					<tbody id="memberlist">
						<script id="memberitem" type="text/x-handlebars-template">
					{{#each member}}						
							<tr>
								<td class="text-center">{{birthdate}}</td>
								<td class="text-center">{{mem_id}}</td>
								<td class="text-center">{{mem_name}}</td>
								<td class="text-center">{{gender}}</td>
								<td class="text-center">{{phone_no}}</td>
								<td class="text-center">{{reg_date}}</td>
								<td class="text-center">
								<a href="">구매내역</a></td>
								<td class="text-center">
								<a href="">문의내역</a></td>
						</tr>
					{{/each}}
						</script>
					</tbody>
				</table>
				<button type="button" id="more" class="btn btn-default btn-block"
					style="margin-bottom: 15px">더 보기</button>
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

	<%@ include file="../inc/footer.jsp"%>

</body>

</html>