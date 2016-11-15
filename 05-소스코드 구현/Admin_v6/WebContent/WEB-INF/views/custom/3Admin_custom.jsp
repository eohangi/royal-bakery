<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>

</head>
<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<div class="row">
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
			<script id="customitem" type="text/x-handlebars-template">	
					{{#each custom}}						
							<tr>
								<td class="text-center">{{cuClassify}}</td>
								<td class="text-center">{{cuName}}</td>
								<td class="text-center">{{cuPrice}}</td>
								<td class="text-center">
								<a href='${pageContext.request.contextPath}/custom/CustomUpdate.do?id={{id}}'>수정</a></td>
								<td><a class="Custom_delete btn btn-xs" id="Custom_delete" data-id="{{{id}}}"  onclick=''><i class="glyphicon glyphicon-remove"></i></a></td>
									</tr>
					{{/each}}
						</script>
			<!-- JSON 데이터 가져오기 스크립트 시작 -->
			<script type="text/javascript">
				function get_list() {
					$.get("../custom/CustomList.do", {
						customId : 0
					}, function(json) {
						var template = Handlebars.compile($("#customitem")
								.html());
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
									var template = Handlebars.compile($(
											"#customitem").html());
									var html = template(json);
									$("#customlist").html(html);
								});

							});

				});
			</script>


			<div class="header">
	

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

					</tbody>
				</table>
			</div>


		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

</body>

</html>