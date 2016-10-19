<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<div class="head">
	<div class="banner">
		<a href="MainIndex2.jsp"> <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="logo">
		</a>
	</div>
	<div class="titlebar">
		<ul class="list-unstyled navi">
			<li><a href="LoginPage.jsp">LogOut</a></li>
			<li><a href="MyPage.jsp">MyPage</a>
				<ul class="list-unstyled">
				</ul></li>
			<li><a href="Story.jsp">Brand</a>
				<ul class="list-unstyled">
					<li><a href="Story.jsp">Story</a></li>
				</ul></li>
			<li><a href="bread.jsp">Product</a>
				<ul class="list-unstyled">
					<li><a href="bread.jsp">bread</a></li>
					<li><a href="cake.jsp">cake</a></li>
					<li><a href="cookie.jsp">cookie</a></li>
				</ul></li>
			<li><a href="CustomOrder.jsp">Order</a></li>
			<li><a href="Notice.jsp">Community</a>
				<ul class="list-unstyled">
					<li><a href="Notice.jsp">공지사항</a></li>
					<li><a href="MyquestionList.jsp">문의하기</a></li>
				</ul></li>

		</ul>
	</div>
</div>