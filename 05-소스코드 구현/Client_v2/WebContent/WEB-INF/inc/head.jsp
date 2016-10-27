<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>Royal</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- Optional theme -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />

<script src="http://code.jquery.com/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!-- 공통 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/common.css" />

<!-- 일반제품 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/ListHover.css" />

<!-- 다음 우편번호 검색 스크립트 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/js/daumPostCode.js"></script>


<!-- ajax-helper -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ajax/ajax_helper.css" />
<script src="../plugins/ajax/ajax_helper.js"></script>

<!-- CKEditor -->
<script src="http://cdn.ckeditor.com/4.4.7/standard/ckeditor.js"></script>

<!-- ajax-helper -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ajax/ajax_helper.css" />
<script src="${pageContext.request.contextPath}/plugins/ajax/ajax_helper.js"></script>

<!-- handlebars plugin -->
<script src="${pageContext.request.contextPath}/plugins/handlebars/handlebars-v4.0.5.js"></script>

<!-- grid 플러그인 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/multi-column/multi-columns-row.css" />
<script src="${pageContext.request.contextPath}/multi-column/ie-row-fix.js"></script>