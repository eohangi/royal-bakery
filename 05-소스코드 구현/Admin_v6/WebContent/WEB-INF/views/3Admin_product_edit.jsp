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

<!-- 제품리스트 -->

</head>
<body>
	<div class="container">
		<div class="row">
			<form class="form-horizontal" id="member_edit_form"
			name="member_edit_form" method="post"
			action="${pageContext.request.contextPath}/PRODUCTEDIT.do">

			<div class="form-group">
				<label for='mem_id' class="col-md-2">이미지</label>
				<div class="col-md-8">
					<input type="text" class="form-control pull-left" id="mem_id"
						name="mem_id" value="${memberInfo.mem_id}"
						style="width: 25%; display: inline-block; margin-right: 5px;"
						readonly />
				</div>
			</div>
			<div class="form-group">
				<label for='mem_pw' class="col-md-2">분류</label>
				<div class="col-md-8">
					<input type="password" class="form-control pull-left" id="mem_pw"
						name="mem_pw" placeholder="변경을 원하실 경우에만 입력하세요"
						style="width: 25%; display: inline-block; margin-right: 5px;"
						/>
				</div>
			</div>
			<div class="form-group">
				<label for='mem_pw_re' class="col-md-2">제품이름</label>
				<div class="col-md-8">
					<input type="password" class="form-control pull-left" id="mem_pw_re"
						name="mem_pw_re"
						style="width: 25%; display: inline-block; margin-right: 5px;"
						/>
				</div>
			</div>

			<div class="form-group">
				<label for='mem_name' class="col-md-2">제품가격</label>
				<div class="col-md-10">
					<input type="text" name="mem_name" id="mem_name"
						value="${memberInfo.mem_name}" class="form-control" />
				</div>
			</div>
			
			<div class="form-group">
				<label for='gender1' class="col-md-2">수량*</label>
				<div class="col-md-10 pull-left">
					<label class="radio-inline"> 
					<input type="radio"	name="gender" id="gender1" value="M"
					<c:if test="${memberInfo.gender =='M'}">checked="checked"</c:if> />남자
					</label>
					
					<label class="radio-inline">
					<input type="radio"	name="gender" id="gender2" value="F"
					<c:if test="${memberInfo.gender =='F'}">checked="checked"</c:if> />여자 
					</label>
				</div>
			</div>

			<div class="form-group">
				<label for='email' class="col-md-2">품절상태</label>
				<div class="col-md-10">
					<input type="email" name="email" id="email"
						value="${memberInfo.email}" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='phone_no' class="col-md-2">제품설명</label>
				<div class="col-md-10">
					<input type="tel" name="phone_no" id="phone_no"
						value="${memberInfo.phone_no}" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='birthdate' class="col-md-2">칼로리</label>
				<div class="col-md-10">
					<input type="text" name="birthdate" id="birthdate"
						class="form-control" value="${memberInfo.birthdate}" />
				</div>
			</div>

			<div class="form-group">
				<label for='postcode' class="col-md-2 clearfix">나트륨</label>
				<div class="col-md-10 clearfix">
					<input value="${memberInfo.postcode}" type="text" name="postcode"
						id="postcode" class="form-control pull-left"
						style='width: 120px; margin-right: 5px' />
					<!-- 클릭 시, Javascript 함수 호출 : openDaumPostcode() -->
					<input type='button' value='우편번호 찾기'
						class='btn btn-warning pull-left'
						onclick='execDaumPostcode("postcode", "addr1", "addr2")' />
				</div>
			</div>

			<div class="form-group">
				<label for='addr1' class="col-md-2">설탕</label>
				<div class="col-md-10">
					<input type="text" name="addr1" id="addr1" class="form-control"
						value="${memberInfo.addr1}" />
				</div>
			</div>

			<div class="form-group">
				<label for='addr2' class="col-md-2">지방</label>
				<div class="col-md-10">
					<input type="text" name="addr2" id="addr2" class="form-control"
						value="${memberInfo.addr2}" />
				</div>
			</div>
			
			<div class="form-group">
				<label for='addr2' class="col-md-2">단백질</label>
				<div class="col-md-10">
					<input type="text" name="addr2" id="addr2" class="form-control"
						value="${memberInfo.addr2}" />
				</div>
			</div>
			
			<div class="form-group">
				<label for='addr2' class="col-md-2">최종수정일</label>
				<div class="col-md-10">
					<input type="text" name="addr2" id="addr2" class="form-control"
						value="${memberInfo.addr2}" readonly />
				</div>
			</div>
			
			<div class="form-group">
				<label for='addr2' class="col-md-2">입력일</label>
				<div class="col-md-10">
					<input type="text" name="addr2" id="addr2" class="form-control"
						value="${memberInfo.addr2}" readonly/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<button type="submit" class="btn btn-primary">수정</button>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<button type="submit" class="btn btn-primary">삭제</button>
				</div>
			</div>
		</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>