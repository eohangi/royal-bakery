<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>

<%@ include file="/WEB-INF/inc/topbar.jsp"%>
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

	var id = $("#delete").val();
	$(function(){
		$("#delete").click(function() {
			window.location("${pageContext.request.contextPath}/PRODUCTDELETE.do?id=id");
	});
	});
	
		
	</script>


<!-- 제품리스트 -->

</head>
<body>
	<div class="container">
		<div class="page-header">
		<h3>제품등록 페이지</h3>
		</div>
		<div class="row">
			<form class="form-horizontal" id="member_edit_form"
			name="member_edit_form" method="post"
			action="${pageContext.request.contextPath}/PRODUCTADD.do" enctype="multipart/form-data">
			<div class="form-group">
				<label for='proImg' class="col-md-2">이미지</label>
				<div class="col-md-6">
				<input type="file" class="form-control pull-left" id="proImg" name="proImg"/>
				</div>
			</div>
			<div class="form-group">
				<label for='proClassify' class="col-md-2">분류</label>
				<div class="col-md-6">
					<select class="form-control" name="proClassify" id="proClassify">
						<option>
						-------------------------------선택하세요--------------------------------</option>
						<option value="a" >
						--------------------------------BREAD---------------------------------</option>
						<option value="b" >
						---------------------------------CAKE---------------------------------</option>
						<option value="b" >
						--------------------------------COOKIE--------------------------------</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for='id' class="col-md-2">제품번호</label>
				<div class="col-md-6">
					<input type="text" class="form-control pull-left" id="id"
						name="id" style="width: 25%; display: inline-block; margin-right: 5px;"
						readonly />
				</div>
			</div>
			<div class="form-group">
				<label for='proName' class="col-md-2">제품이름</label>
				<div class="col-md-6">
					<input type="text" class="form-control pull-left" id="proName"
						name="proName"style="width: 25%; display: inline-block; margin-right: 5px;"
						/>
				</div>
			</div>

			<div class="form-group">
				<label for='proPrice' class="col-md-2">제품가격</label>
				<div class="col-md-6">
					<input type="text" name="proPrice" id="proPrice"
						class="form-control" />
				</div>
			</div>
			
			<div class="form-group">
				<label for='stock' class="col-md-2">수량</label>
				<div class="col-md-6">
					<input type="text" name="stock" id="stock"
					class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='status' class="col-md-2">품절상태</label>
				<div class="col-md-6">
					<input type="text" name="status" id="status"
					class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label for='content' class="col-md-2">제품설명</label>
				<div class="col-md-6">
					<textarea class="form-control col-sm-6" rows="3"
					name="content">${item.content}</textarea>
				</div>
			</div>

			<div class="form-group">
				<label for='kcal' class="col-md-2">칼로리</label>
				<div class="col-md-6">
					<input type="text" name="kcal" id="kcal"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='na' class="col-md-2">나트륨</label>
				<div class="col-md-6">
					<input type="text" name="na" id="na"
						class="form-control"  />
				</div>
			</div>

			<div class="form-group">
				<label for='sugar' class="col-md-2">설탕</label>
				<div class="col-md-6">
					<input type="text" name="sugar" id="sugar" class="form-control"
						 />
				</div>
			</div>

			<div class="form-group">
				<label for='fat' class="col-md-2">지방</label>
				<div class="col-md-6">
					<input type="text" name="fat" id="fat" class="form-control"
						 />
				</div>
			</div>
			
			<div class="form-group">
				<label for='protein' class="col-md-2">단백질</label>
				<div class="col-md-6">
					<input type="text" name="protein" id="protein" class="form-control"
						/>
				</div>
			</div>
		
			<div class="form-group">
				<div class="col-md-offset-2 col-md-6">
					<button type="submit" class="btn btn-primary">제품등록</button>					
				</div>
			</div>
		</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>