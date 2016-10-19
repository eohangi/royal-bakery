<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<div class="head">
	<div class="banner">
		<a href="MainIndex1.jsp"> <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="logo">
		</a>
	</div>
	<div class="titlebar">
		<ul class="list-unstyled navi">
			<li><a href="LoginPage.jsp">Login</a></li>
			<li><a href="${pageContext.request.contextPath}/member/Join.do">Join</a></li>
			<li><a href="Story.jsp">Brand</a>
				<ul class="list-unstyled">
					<li><a href="Story.jsp">Story</a></li>
				</ul></li>
			<li><a href="LoginPage.jsp">Product</a>
				<ul class="list-unstyled">
					<li><a href="LoginPage.jsp">bread</a></li>
					<li><a href="LoginPage.jsp">cake</a></li>
					<li><a href="LoginPage.jsp">cookie</a></li>
				</ul></li>
			<li><a href="${pageContext.request.contextPath}/custom/CustomOrder.do">Order</a></li>
			<li><a href="LoginPage.jsp">Community</a>
				<ul class="list-unstyled">
					<li><a href="LoginPage.jsp">공지사항</a></li>

					<li><a href="LoginPage.jsp">문의하기</a></li>
				</ul></li>

		</ul>
	</div>
</div>