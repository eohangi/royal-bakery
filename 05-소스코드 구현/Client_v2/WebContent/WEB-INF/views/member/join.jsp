<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="clientjoin">
		<div class='page-header'>
			<h1><font color="#f26b24">회원가입</font></h1>
		</div>
		<!-- 가입폼 시작 -->
		<form class="form-horizontal" id="myform" name="myform" method="post"
			action="${pageContext.request.contextPath}/member/JoinOk.do">

			<div class="form-group">
				<label for='mem_id' class="col-md-2">아이디*</label>
				<div class="col-md-8">
					<input type="text" class="form-control pull-left" id="mem_id" name="mem_id"
					 style="width:25%; display:inline-block; margin-right:5px;"/>
					<span>
						<button class="btn btn-primary pull-left" type="button" id="id_uniq_check">중복검사</button>
					</span>
				</div>
			</div>


			<div class="form-group">
				<label for="mem_pw" class="col-md-2">비밀번호*</label>
				<div class="col-md-10">
					<input type="password" name="mem_pw" id="mem_pw"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='mem_pw_re' class="col-md-2">비밀번호 확인*</label>
				<div class="col-md-10">
					<input type="password" name="mem_pw_re" id="mem_pw_re"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='mem_name' class="col-md-2">이름*</label>
				<div class="col-md-10">
					<input type="text" name="mem_name" id="mem_name"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='email' class="col-md-2">이메일*</label>
				<div class="col-md-10">
					<input type="email" name="email" id="email" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='phone_no' class="col-md-2">연락처*</label>
				<div class="col-md-10">
					<input type="tel" name="phone_no" id="phone_no"
						class="form-control" placeholder="'-'없이 입력" />
				</div>
			</div>

			<div class="form-group">
				<label for='birthdate' class="col-md-2">생년월일*</label>
				<div class="col-md-10">
					<input type="date" name="birthdate" id="birthdate"
						class="form-control" placeholder="yyyy-mm-dd" />
				</div>
			</div>

			<div class="form-group">
				<label for='gender1' class="col-md-2">성별*</label>
				<div class="col-md-10">
					<label class="radio-inline"> <input type="radio"
						name="gender" id="gender1" value="M" /> 남자
					</label> <label class="radio-inline"> <input type="radio"
						name="gender" id="gender2" value="F" /> 여자
					</label>
				</div>
			</div>

			<div class="form-group">
				<label for='postcode' class="col-md-2 clearfix">우편번호</label>
				<div class="col-md-10 clearfix">
					<input type="text" name="postcode" id="postcode"
						class="form-control pull-left"
						style='width: 120px; margin-right: 5px' />
					<!-- 클릭 시, Javascript 함수 호출 : openDaumPostcode() -->
					<input type='button' value='우편번호 찾기' class='btn btn-warning pull-left'
						onclick='execDaumPostcode("postcode", "addr1", "addr2")' />
				</div>
			</div>

			<div class="form-group">
				<label for='addr1' class="col-md-2">주소</label>
				<div class="col-md-10">
					<input type="text" name="addr1" id="addr1" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='addr2' class="col-md-2">상세주소</label>
				<div class="col-md-10">
					<input type="text" name="addr2" id="addr2" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<button type="submit" class="btn btn-primary">가입하기</button>
					<button type="reset" class="btn btn-danger">다시작성</button>
				</div>
			</div>
		</form>
		<!-- 가입폼 끝 -->
	</div>

		<!-- 사용자 정의 스크립트 -->
	<script type="text/javascript">
		$(function() {
			/** 버튼 클릭시 이벤트 */
			$("#id_uniq_check").click(function() {
				// 입력값을 취득하고, 내용의 존재여부를 검사한다.
				var mem_id_val = $("#mem_id").val();

				if (!mem_id_val) { // 입력되지 않았다면?
					alert("아이디를 입력하세요."); // <-- 메시지 표시
					$("#mem_id").focus(); // <-- 커서를 강제로 넣기
					return false; // <-- 실행 중단
				}

				// 위의 if문을 무사히 통과했다면 내용이 존재한다는 의미이므로,
				// 입력된 내용을 Ajax를 사용해서 웹 프로그램에게 전달한다.
				$.post("../api/id_unique_check.do", {
					mem_id : mem_id_val
				}, function(req) {
					// 사용 가능한 아이디인 경우 --> req = { result: "OK" }
					// 사용 불가능한 아이디인 경우 --> req = { result: "FAIL" }
					if (req.result == 'OK') {
						alert("사용 가능한 아이디 입니다.");
					} else {
						alert("이미 사용중인 아이디 입니다.");
						$("#mem_id").val("");
						$("#mem_id").focus();
					}
				}); // end $.get
			}); // end click
		});
	</script>


	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>

