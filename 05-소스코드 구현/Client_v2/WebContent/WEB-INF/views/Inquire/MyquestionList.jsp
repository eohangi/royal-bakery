<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar2.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-2" id="slide1">
				<h1>슬라이드1</h1>
			</div>


			<!-- 페이지 내용 영역(김양수 수정내용)-->
			<div class="col-md-8" Id="content">
				<!-- 페이지에서 보여지는 전체의 내용을 감싸는 박스 -->
				<div class="myquestion-container">

					<!-- 해당 페이지의 이름을 보여주는 내용을 감싸는 박스 -->
					<div class="page-name">
						<h3>
							<strong>｜상담내역</strong>
						</h3>
					</div>
					<!-- /해당 페이지의 이름을 보여주는 내용을 감싸는 박스 -->




					<!-- 페이지 이름 아래로 표시되는 모든 내용을 감싸는 박스-->
					<div class="qeinner-content">


						<!--마이 페이지 안내 메시지를 감싸는 상단의 박스-->
						<div class="qeinner-content-info">
							<p>
							<h2>온라인 상담</h2>
							</p>
							<p>
							<h5 class="qeinner-content-info-text">
								고객님께서 느끼셨던 다양한 의견이나 불편사항,<br />문의사항을 적어 보내주시면 최선을 다해 답변을 드리도록
								하겠습니다.
							</h5>
							</p>
						</div>
						<!-- /마이 페이지 안내 메시지를 감싸는 상단의 박스-->


						<!-- 페이지에 들어갈 2가지 메뉴시작-->
						<ul class="myquestionlist  list-unstyled">
							<li class="table">
								<table class="table table-hover">
									<thead style="background-color: #eee">
										<tr align="center">
											<td width="18%">번호</td>
											<td width="18%">제목</td>
											<td width="18%">등록일</td>
											<td width="18%">답변유/무</td>
										</tr>
									</thead>
									<tbody align="center">
										<tr>
											<!--줄 추가-->
											<td>1</td>
											<!--1번줄의 첫번째 셀-->
											<td><a href="InquireConfirm.jsp">사이트에 관하여 질문이 있습니다.</a></td>
											<td>2016-9-23</td>
											<td>유</td>

										</tr>
										<tr>
											<td>2</td>
											<td>문의2</td>
											<td>2016-9-23</td>
											<td>유</td>
										</tr>
										<tr>
											<td>3</td>
											<td>문의3</td>
											<td>2016-9-23</td>
											<td>유</td>
										</tr>
										<tr>
											<td>4</td>
											<td>문의4</td>
											<td>2016-9-23</td>
											<td>유</td>
										</tr>
										<tr>
											<td>5</td>
											<td>문의5</td>
											<td>2016-9-23</td>
											<td>유</td>
										</tr>
										<tr>
											<td>6</td>
											<td>문의6</td>
											<td>2016-9-23</td>
											<td>무</td>
										</tr>
									</tbody>
									<tfoot>

									</tfoot>
								</table>
							</li>
						</ul>

						<ul class="button_my_question">

							<p class="removequestion pull-left" id="removequestion">
								<input type="button" class="btn btn-warning" value="삭제하기"
									onclick="#">
							</p>

							<p class="addquestion pull-right" id="addquestion">
								<input type="button" class="btn btn-info" value="상담하기"
									onclick="location.href='Inquire.jsp'">
							</p>

						</ul>
						<!-- /페이지에 들어갈 2가지 메뉴시작-->



					</div>
					<!-- /페이지 이름 아래로 표시되는 모든 내용을 감싸는 박스-->
				</div>
				<!-- /페이지에서 보여지는 전체의 내용을 감싸는 박스 -->
			</div>


			<div class="col-md-2" id="slide2">
				<h3>슬라이드2</h3>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>