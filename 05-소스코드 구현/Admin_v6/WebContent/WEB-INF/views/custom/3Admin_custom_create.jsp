<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style type="text/css">
.join {
	margin: auto;
	align: center;
	width: 70%;
	text-align: center;
	align: center;
}

.page-header {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class='page-header'>
		<h1>제 품 등 록</h1>
	</div>
	<div class="container">

		<div class="row">
			<div class="join">
				<!-- 가입폼 시작 -->
				<form class="form-horizontal" method="post" id="myform"
					action="${pageContext.request.contextPath}/custom/CustomCreateOk.do">
					<div class="form-group">
						<label for="list">카테고리 선택</label> <select id="list" name="list"
							class="list-option" style="width: 120px;">
							<option value="크림" id=classify>크림</option>
							<option value="크기" id=classify>크기</option>
							<option value="단수" id=classify>단수</option>
							<option value="시트" id=classify>시트</option>
							<option value="초" id=classify>초</option>
						</select>
					</div>
					</br>
					<div class="form-group">
						<label for="name" class="col-md-2">제품명*</label>
						<div class="col-md-10">
							<input type="text" name="cu_name" id="cu_name"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="tel" class="col-md-2">가 격*</label>
						<div class="col-md-10">
							<input type="text" name="cu_price" id="cu_price"
								class="form-control">
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-offset-2 col-md-10">
							<!-- 들여쓰기 -->
							<button type="submit" class="btn btn-primary" id="put">제품등록</button>
							<button type="reset" class="btn btn-danger" id="cancel"
								onclick="history.back()">취소</button>
						</div>
					</div>
				</form>
				<!-- 가입폼 끝 -->
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

</body>

</html>
