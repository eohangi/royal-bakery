<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/inc/topbar.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<style type="text/css">
.header {
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


	function get_list() {
		$.get("../custom/CustomList.do", {
			customId : 0
		}, function(json) {
					var template = Handlebars.compile($("#customitem").html());
					var html = template(json);
					$("#customlist").html(html);
				});
	}
	$(function() {
		get_list();
		//장바구니에서 품목 삭제
		$(document).on(
				"click",
				".Custom_delete",
				function() {
					//data-proId 속성의 값을 취득한다.
					var id = $(this).data("id");
					console.log(id);

					//삭제 버튼을 눌렀을 때 삭제
					$.get("../custom/Custom_delete.do", {
						id : id
					}, function(json) {
						//미리 준비한 HTML틀을 읽어온다.
						var template = Handlebars.compile($("#customitem").html());
						// Ajax를 통해서 읽어온 JSON을 템플릿에 병합한다.
						var html = template(json);
						// #result에 읽어온 내용을 추가한다.
						$("#customlist").html(html);
					});

				});

				});

</script>
</head>
<body>
	
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

				<div class="product" class="btn btn-primary btn-lg">
					<button type="submit">
						<a
							href="${pageContext.request.contextPath}/custom/CustomCreate.do">제품등록</a>
					</button>
				</div>

			</div>
			<!-- 페이지 내용 영역 -->
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="text-center">상세 분류</th>
							<th class="text-center">제품명</th>
							<th class="text-center">가격</th>
							<th class="text-center" colspan='2'>관리</th>
						</tr>
					</thead>
					<tbody id="customlist">
						<script id="customitem" type="text/x-handlebars-template">
					{{#each custom}}						
							<tr>
								<td class="text-center">{{cuClassify}}</td>
								<td class="text-center">{{cuName}}</td>
								<td class="text-center">{{cuPrice}}</td>
								<td class="text-center">
								<a href="">수정</a></td>
								<td><a class="Custom_delete btn btn-xs" id="Custom_delete" data-id="{{{id}}}"  onclick=''><i class="glyphicon glyphicon-remove"></i></a></td>
									</tr>
					{{/each}}
						</script>
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
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

</body>

</html>