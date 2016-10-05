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
	
		<!-- 페이지 내용 영역 -->
		<div Id="content" style="padding-top: 0px;">
			<h2>케이크 제작 주문</h2>
			</hr>
			<div class="box1">
				<p>
					<img src="./img/choco.jpg" width="300px" height="300px" />
				<p>
			</div>
			<div class="box2">
				<form>
					<fieldset>
						<legend>케익 선택하기</legend>
						<h3>필수 선택 사항</h3>
						<!-- 드롭다운  -->
						<label for="cream">크림 선택</label> <select name="cream" id="cream">
							<option>-----선택하세요-----</option>
							<option value="choco">초코</option>
							<option value="mocha">모카</option>
							<option value="milkcream">생크림</option>
							<option value="butter">버터크림</option>
						</select></br> <label for="size">크기 선택</label> <select name="size" id="size">
							<option>-----선택하세요-----</option>
							<option value="size1">1호</option>
							<option value="size2">2호</option>
							<option value="size3">3호</option>
							<option value="squre">사각</option>
						</select></br> <label for="layer">단수 선택</label> <select name="layer" id="layer">
							<option>-----선택하세요-----</option>
							<option value="layer1">1단 (기본)</option>
							<option value="layer2">2단</option>
							<option value="layer3">3단</option>
						</select></br> <label for="sheet">시트 선택</label> <select name="sheet" id="sheet">
							<option>-----선택하세요-----</option>
							<option value="regularsheet">기본 시트</option>
							<option value="fruitsheet">초코렛 과일 시트</option>
						</select>

						</hr>
						<h3>추가 선택 사항</h3>
						<label for="candle">초 선택</label> <select name="candle" id="candle">
							<option>-----선택하세요-----</option>
							<option value="freecandle">기본 초(무료)</option>
							<option value="numcandle">숫자 초</option>
							<option value="charcandle">알파벳 초</option>
						</select></br> <label for="drink">샴페인 선택</label> <select name="drink" id="drink">
							<option>-----선택하세요-----</option>
							<option value="appledrink">사과향 샴페인(무알콜)</option>
							<option value="pinedrink">파인애플향 샴페인(무알콜)</option>
							<option value="grapedrink">포도향 샴페인(무알콜)</option>
						</select></br> <label for="comment">문구입력</label>
						<textarea name="comment" id="comment"
							placeholder="원하시는 문구를 입력해주세요"></textarea>

					</fieldset>
				</form>
				<hr />

				<input type="button" class="btn btn-primary" value="구매하기" onclick="location.href='OrderComplete.jsp'">
			</div>
			<hr />


		</div>

	</div>

	<%@ include file="inc/Footer.jsp"%>
</body>

</html>