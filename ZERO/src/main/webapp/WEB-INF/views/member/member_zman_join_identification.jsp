<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/sidebar.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>ZERO</title>
<script type="text/javascript">
</script>
</head>
<body>
	<%--네비게이션 바 영역 --%>
	<header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
	
	<article>
		<%-- 사이드바 --%>
		<div class="container">
			<nav id="mainNav" class="sidebarArea d-none d-md-block sidebar">
				<jsp:include page="/WEB-INF/views/inc/member_sidebar_hyo.jsp"></jsp:include>
			</nav>
			<div class="contentArea">
			<%-- 메인영역 --%>
			<form action="join_pro" method="post">
					<%-- 이메일 DB에서 가져오기 --%>
					<div class="has_button input_box" data-v-4e1fd2e6="" data-v-2b15bea4="">
						<h3 class="input_title" data-v-4e1fd2e6="" data-v-2b15bea4="">이메일 주소(아이디로 사용됩니다)</h3>
						<div class="btn_input_container">
						<input type="email" 
						   	   placeholder="예) kream@kream.co.kr" 
						   	   id="member_id" 
						   	   name="member_id" 
						   	   autocomplete="off" 
						   	   class="input_txt" 
						   	   data-v-4e1fd2e6="">
						</div>
					</div><br>
					
					<div class="input_box has_button" data-v-4e1fd2e6="" data-v-2b15bea4="">
						<h3 class="input_title" data-v-4e1fd2e6="" data-v-2b15bea4="">비밀번호 확인</h3>
						<input type="password" 
							   placeholder="입력해주세요" 
							   id="member_passwd2" 
							   name="member_passwd2" 
							   autocomplete="off" 
							   class="input_txt" 
							   data-v-4e1fd2e6=""
							   required="required">
					</div>
					
				</form>


	</article>

	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/49ee6ec.js"
		defer=""></script>
	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/de88374.js"
		defer=""></script>
	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/bfcc4c4.js"
		defer=""></script>
	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/2ffe3b9.js"
		defer=""></script>
	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/514df53.js"
		defer=""></script>
	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/afbbed2.js"
		defer=""></script>
	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/76e0661.js"
		defer=""></script>
	<link
		href="${pageContext.request.contextPath }/resources/mypage_css/7db96f2.css"
		rel="stylesheet" type="text/css">
	<link
		href="${pageContext.request.contextPath }/resources/mypage_css/bd82ddc.css"
		rel="stylesheet" type="text/css">
	<link
		href="${pageContext.request.contextPath }/resources/mypage_css/815f008.css"
		rel="stylesheet" type="text/css">

</body>
</html>