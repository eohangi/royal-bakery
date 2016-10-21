<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar2.jsp"%>
	<div class="page-header"></div>
	<div class="container ">

		<!-- 페이지 내용 영역 -->
		<div id="content" style="padding-top: 0px; margin-bottom: 100px;">
			<h2>케이크 제작 주문</h2>
			</hr>

			<div class="box1 pull-left">
				<p>
					<img src="${pageContext.request.contextPath}/assets/img/choco.jpg"
						width="300px" height="300px" />
				<p>
			</div>
			<div class="clearfix">
				<div class="box2   pull-left" style="display: block;">


					<legend>케익 선택하기</legend>
					<h3>필수 선택 사항</h3>
					<!-- 드롭다운  -->
					<label name="크림">크림 선택</label> 
					<select name="크림">
						<option>-----선택하세요-----</option>
						<c:forEach var="custom" items="${list1}">
						<option class="text-center">${custom.cuName}</option>
						</c:forEach>
					</select> 
					</br> 
					<label for="size">크기 선택</label> 
							<select name="크기">
						<option>-----선택하세요-----</option>
						<c:forEach var="custom" items="${list2}">
						<option class="text-center">${custom.cuName}</option>
						</c:forEach>
					</select>  </br>
					 <label for="layer">단수 선택</label> 
							<select name="단수">
						<option>-----선택하세요-----</option>
						<c:forEach var="custom" items="${list3}">
						<option class="text-center">${custom.cuName}</option>
						</c:forEach>
					</select> 
					 </br> 
					 <label for="sheet">시트 선택</label> 
							<select name="시트">
						<option>-----선택하세요-----</option>
						<c:forEach var="custom" items="${list4}">
						<option class="text-center">${custom.cuName}</option>
						</c:forEach>
					</select> 
					 </br> 
					 <label for="candle">초 선택</label> 
							<select name="초">
						<option>-----선택하세요-----</option>
						<c:forEach var="custom" items="${list5}">
						<option class="text-center">${custom.cuName}</option>
						</c:forEach>
					</select> 

					</hr>
					<h3>추가 사항</h3>
					<textarea name="comment" id="comment"
						style="width: 250px; height: 100px;" placeholder="원하시는 문구를 입력해주세요"></textarea>



					<input style="display: block;" type="button"
						class="btn btn-primary col-md-offset-5" value="구매하기"
						onclick="location.href='OrderComplete.jsp'"> <br />
				</div>
			</div>

		</div>

	</div>
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>

</body>

</html>