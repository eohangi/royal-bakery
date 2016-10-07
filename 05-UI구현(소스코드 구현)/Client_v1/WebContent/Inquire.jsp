<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="inc/Common.jsp"%>
</head>
<body>

	<%@ include file="inc/Header2.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-2" id="slide1">
				<h1>슬라이드1</h1>
			</div>
			<!-- 페이지 내용 영역 -->
			<div class="col-md-8" >
	
				<div class="page-header">
					<h2>1대1 문의</h2>
				</div>
			

				<div class="inner final">
				<div class="row">
					<form class="form-horizontal" id="inquireform">
						<div class="form-group col-md-12">
							<label for="addr1" class="col-md-2">제목</label>
							<div class="col-md-10">
								<input type="text" name="addr1" id="addr1" class="form-control">
							</div>
						</div>
						<div class="form-group col-md-12">
							<label for="addr2" class="col-md-2" >내용</label>
							<div class="col-md-10">
								
									<textarea name="body" id="body" 
										class="form-control Area" rows="10" style="margin-bottom:10px;"></textarea>
								
							</div>
							
								<div class="button" style="margin-right:20px;">
									<button type="button" class="btn btn-primary"  onclick="location.href='InquireConfirm.jsp'">제출하기</button>
									<button type="button" class="btn btn-primary" onclick="location.href='MyquestionList.jsp'">취소</button>
								</div>
							
					</form>
					</div>
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