<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 검색폼 + 글 쓰기 버튼 시작 -->
<div class="clearfix">
	<!-- 검색 폼  -->
	
	<!-- 글 쓰기 버튼 -->
	<div class="pull-right">
		<a href="${pageContext.request.contextPath}/bbs/document_write.do?category=${category}" class="btn btn-primary">
			<i class="glyphicon glyphicon-pencil"></i> 글쓰기
		</a>
	</div>
</div>
<!--// 검색폼 + 글쓰기 버튼 끝  -->

<!-- 페이지 번호 시작 -->
<!--// 페이지 번호 끝 -->