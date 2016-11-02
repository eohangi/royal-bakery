<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
<html>
<head>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="clientjoin">
		<h1 class="page-header">회원정보수정</h1>

		<!-- 가입폼 시작 -->
		<form class="form-horizontal" id="member_edit_form"
			name="member_edit_form" method="post"
			action="${pageContext.request.contextPath}/member/thirdstepforedit.do">

			<div class="form-group">
				<label for='mem_id' class="col-md-2">아이디</label>
				<div class="col-md-8">
					<input type="text" class="form-control pull-left" id="mem_id"
						name="mem_id" value="${memberInfo.mem_id}"
						style="width: 25%; display: inline-block; margin-right: 5px;"
						readonly />
				</div>
			</div>
			<div class="form-group">
				<label for='mem_pw' class="col-md-2">비밀번호변경</label>
				<div class="col-md-8">
					<input type="password" class="form-control pull-left" id="mem_pw"
						name="mem_pw" placeholder="변경을 원하실 경우에만 입력하세요"
						style="width: 25%; display: inline-block; margin-right: 5px;"
						/>
				</div>
			</div>
			<div class="form-group">
				<label for='mem_pw_re' class="col-md-2">변경한비밀번호확인</label>
				<div class="col-md-8">
					<input type="password" class="form-control pull-left" id="mem_pw_re"
						name="mem_pw_re"
						style="width: 25%; display: inline-block; margin-right: 5px;"
						/>
				</div>
			</div>

			<div class="form-group">
				<label for='mem_name' class="col-md-2">이름</label>
				<div class="col-md-10">
					<input type="text" name="mem_name" id="mem_name"
						value="${memberInfo.mem_name}" class="form-control" />
				</div>
			</div>
			
			<div class="form-group">
				<label for='gender1' class="col-md-2">성별*</label>
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
				<label for='email' class="col-md-2">이메일</label>
				<div class="col-md-10">
					<input type="email" name="email" id="email"
						value="${memberInfo.email}" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='phone_no' class="col-md-2">연락처</label>
				<div class="col-md-10">
					<input type="tel" name="phone_no" id="phone_no"
						value="${memberInfo.phone_no}" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='birthdate' class="col-md-2">생년월일</label>
				<div class="col-md-10">
					<input type="text" name="birthdate" id="birthdate"
						class="form-control" value="${memberInfo.birthdate}" />
				</div>
			</div>

			<div class="form-group">
				<label for='postcode' class="col-md-2 clearfix">우편번호</label>
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
				<label for='addr1' class="col-md-2">주소</label>
				<div class="col-md-10">
					<input type="text" name="addr1" id="addr1" class="form-control"
						value="${memberInfo.addr1}" />
				</div>
			</div>

			<div class="form-group">
				<label for='addr2' class="col-md-2">상세주소</label>
				<div class="col-md-10">
					<input type="text" name="addr2" id="addr2" class="form-control"
						value="${memberInfo.addr2}" />
				</div>
			</div>
			
			<input type="hidden" name="addr2" id="addr2" class="form-control"
						value="${memberInfo.reg_date}" />
			
			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<button type="submit" class="btn btn-primary">수정완료</button>
				</div>
			</div>
		</form>
		<!-- 폼 끝 -->
	</div>


	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>
<script type="text/javascript">
String get_gender = request.getParameter("gender");
</script>

</html>
