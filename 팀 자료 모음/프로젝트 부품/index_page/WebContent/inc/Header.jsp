<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
	<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
		<a id="logo" href=""><img style="height: 120px;"
			src="img/logo.png" alt="로고"></a>
		<div class="container2">
			<div class="navbar-header">
				<!-- 핸드폰용 단축 버튼	-->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav list-inline">
					<li id="login" class="col-md-offset-1 col-md-1"><a
						href="MainIndex.jsp">Logout</a></li>
					<li id="join" class="col-md-1"><a href="">MyPage</a></li>
					<li id="brand" class="col-md-offset-4 col-md-1"><a href="">브랜드
							이야기</a>
						<ul class="sub depth2">
							<li><a href="">브랜드 스토리</a></li>
							<li><a href="">지점 위치</a></li>
						</ul></li>
					<li id="list" class="col-md-1"><a href="">제품 목록</a>
						<ul class="sub depth2">
							<li><a href="">빵</a></li>
							<li><a href="">케이크</a></li>
							<li><a href="">쿠키</a></li>
						</ul></li>
					<li id="order" class="col-md-1"><a href="">주문 제작</a></li>
					<li id="community" class="col-md-1"><a href="">커뮤니티</a>
						<ul class="sub depth2">
							<li><a href="">공지사항</a></li>
							<li><a href="">글쓰기</a></li>
							<li><a href="">1:1문의하기(Q&amp;A)</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.nav-collapse-->
			<div id="depth2"
				style="height: 70px; width: 100%; background-color: rgba(255, 246, 204, 0.8); z-index: 50;">

			</div>
		</div>
		<!-- /.container2-->
	</div>
