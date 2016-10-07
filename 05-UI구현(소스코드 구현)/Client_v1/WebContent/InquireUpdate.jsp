<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="inc/Common.jsp"%>
</head>
<body>

	<%@ include file="inc/Header2.jsp"%>

	<div class="page-header"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-2" id="slide1">
				<h1>슬라이드1</h1>
			</div>
			<!-- 페이지 내용 영역 -->
			<div class="col-md-8" Id="content">
				<ul class="tab_menu1 tab2 mgb_20 list-unstyled">
					<li><a href="Notice.jsp">공지사항</a></li>
					<li><a href="#">1대1 문의하기</a></li>
				</ul>
				<div class="page-header">
					<h2>수정하기</h2>
				</div>
				<hr />

				<div class="inner final">
					<form class="form-horizontal" id="inquireform">
						<div class="form-group">
							<label for="addr1" class="col-md-2">제목</label>
							<div class="col-md-10">
								<input type="text" name="addr1" id="addr1" class="form-control"
									value="사이트 이용에 관하여 질문이 있습니다.">
							</div>
						</div>
						<div class="form-group">
							<label for="addr2" class="col-md-2">내용</label>
							<div class="col-md-10">

								<textarea name="body" id="body" class="Area form-control"
									rows="10" style="resize: none;">front line 어쩌구 저쩌구 ~~~~~~~~~~~~~~~~~~~~~~~~~~</textarea>

							</div>
							<div>
								<div class="button"
									style="margin-top: 10px; margin-right: 20px;">
									<button type="button" class="btn btn-primary"
										onclick="location.href='InquireConfirm.jsp'">수정완료</button>
									<button type="button" class="btn btn-primary"
										onclick="location.href='InquireConfirm.jsp'">취소</button>
								</div>
							</div>
					</form>
				</div>
			</div>

			<div class="col-md-2" id="slide2">
				<h3>슬라이드2</h3>
			</div>

		</div>
	</div>

	<%@ include file="inc/Footer.jsp"%>
</body>

</html>