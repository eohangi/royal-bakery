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

			<form class="form-horizontal" name="myform" method="post"
				action="${pageContext.request.contextPath}/custom/CustomPage_OK.do">

				<div class="clearfix">
					<div class="box2   pull-left" style="display: block;">


						<legend>케익 선택하기</legend>
						<h3>필수 선택 사항</h3>
						<!-- 드롭다운  -->
						<label for="list">크림 선택</label> <select id="list" name="list" class="list-option"
							style="width: 120px;">
							<option class="text-center" value="" data-price="0">--- 선택하세요 ---</option>
							<c:forEach var="custom" items="${list}">
								<option class="text-center" value="${custom.cuName}" data-price="${custom.cuPrice}">${custom.cuName} (+${custom.cuPrice}원)</option>
							</c:forEach>
						</select> </br> <label for="list2">크기선택</label> <select id="list2" name="list2" class="list-option"
							style="width: 120px;">
							<option class="text-center" value="" data-price="0">--- 선택하세요 ---</option>
							<c:forEach var="custom" items="${list2}">
								<option class="text-center" value="${custom.cuName}" data-price="${custom.cuPrice}">${custom.cuName} (+${custom.cuPrice}원)</option>
							</c:forEach>
						</select> </br> <label for="list3">단수 선택</label> <select id="list3" name="list3" class="list-option"
							style="width: 120px;">
							<option class="text-center" value="" data-price="0">--- 선택하세요 ---</option>
							<c:forEach var="custom" items="${list3}">
								<option class="text-center" value="${custom.cuName}" data-price="${custom.cuPrice}">${custom.cuName} (+${custom.cuPrice}원)</option>
							</c:forEach>
						</select> </br> <label for="list4">시트 선택</label> <select id="list4" name="list4" class="list-option"
							style="width: 120px;">
							<option class="text-center" value="" data-price="0">--- 선택하세요 ---</option>
							<c:forEach var="custom" items="${list4}">
								<option class="text-center" value="${custom.cuName}" data-price="${custom.cuPrice}">${custom.cuName} (+${custom.cuPrice}원)</option>
							</c:forEach>
						</select> </br> <label for="list5">초 선택</label> <select id="list5" name="list5" class="list-option"
							style="width: 120px;">
							<option class="text-center" value="" data-price="0">--- 선택하세요 ---</option>
							<c:forEach var="custom" items="${list5}">
								<option class="text-center" value="${custom.cuName}" data-price="${custom.cuPrice}">${custom.cuName} (+${custom.cuPrice}원)</option>
							</c:forEach>
						</select>
						</hr>
						<h3>총금액</h3>
						<div class="text-center"><span id="total_price">0</span>원</div>
						<input type="hidden" name="total_price" id="total_price_hidden"/>
						</hr>
						<h3>추가 사항</h3>
						<textarea name="comment" id="comment"
							style="width: 250px; height: 100px;"
							placeholder="원하시는 문구를 입력해주세요"></textarea>


						<div class="form-group">
							<!-- 	<input style="display: block;" type="button"
								class="btn btn-primary col-md-offset-5" value="구매하기"
								onclick="location.href='OrderComplete.jsp'"> -->
							<button type="submit" class="btn btn-primary">구매하기</button>
							<br />
						</div>
					</div>
				</div>
			</form>
		</div>

	</div>
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
	<script type="text/javascript">
	// each = for문   자바스크립트를 이용하여 실시간 총금액 표현. value값을 이용해야 DB와 연결. data-~~를 이용.
		$(function() {
			$(".list-option").change(function() {
				var total = 0;
				
				$(".list-option").find("option:selected").each(function() {
					total += $(this).data("price");
					$("#total_price").html(total);
					$("#total_price_hidden").val(total);
				});
			});
		});
	</script>
</body>

</html>