<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="inc/IndexCommon.jsp"%>
</head>
<body>
		<%@ include file="inc/Header.jsp"%>
	<!-- /.navbar-->
	<!-- 캐러셀 내용 -->
	<div class="container">
		<div class="carousel slide" id="carousel-generic" data-ride="carousel">

			<!-- 내용영역 -->
			<div class="carousel-inner">
				<!-- 항목(1) -->
				<div id="background1" class="item active">
					<div class="container">
						<div class="carousel-caption">
							<h1>
								<!-- HTML5 + CSS3 기반의 반응형 웹 퍼블리싱 -->
							</h1>
							<p>
								<!-- 반응형 웹 작업의 핵심 포인트는 부트스트랩에서 제공하는 Grid System 입니다. -->
							</p>
						</div>
					</div>
				</div>
				<!-- //항목(1) -->


				<!-- 항목(2) -->
				<div id="background2" class="item">
					<div class="container">
						<div class="carousel-caption">
							<h1>
								<!-- 다음 단계는? -->
							</h1>
							<p>
								<!-- "Javascript + jQuery + Ajax 완벽 가이드"강의를 추천합니다. -->
							</p>
						</div>
					</div>
				</div>
				<!-- //항목(2) -->


				<!-- 항목(3) -->
				<div id="background3" class="item">
					<div class="container">
						<div class="carousel-caption">
							<h1>
								<!-- CSS3는 CSS2가 기본입니다. -->
							</h1>
							<p>
								<!-- 웹 표준에서의 모든 내용을 파악해야 CSS3가 다루기 쉽습니다. -->
							</p>
						</div>
					</div>
				</div>
				<!-- //항목(3) -->
			</div>
			<!-- //내용영역 -->

			<!-- 이동버튼 -->

		</div>
		<!-- //캐러셀 영역End -->
	</div>
	<!-- 페이지 내용 영역 -->
	<div style="margin-top: 140px;" class="body">
		<p>
			내용을 <br> 넣어보세요. <br> 다음번 <br> 모임은 <br> 뚜레쥬르에서 <br>
			어떠신가요 <br> 행님들
		</p>
	</div>
	<%@ include file="inc/Footer.jsp"%>
</body>

</html>
