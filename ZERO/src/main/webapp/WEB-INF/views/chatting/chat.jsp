<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath }/resources/css/chatting.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>채팅 | ZERO</title>
</head>
<body>
	<!-- header -->
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	
	<!-- nav - 메뉴영역 -->
	<nav>
		채팅
	</nav>
	<hr>
	
	<!-- 채팅목록 영역 -->
	<aside>
		<ul id="chatList">
			<li>
				<a>
					<img alt="프로필사진" src="">
					<span>사용자이름(고양이)</span>
				</a>
			</li>
			<li>
				<a>
					<img alt="프로필사진" src="">
					<span>사용자이름(유니콘)</span>
<%-- 				<c:if test=""> --%>
					(5) 알람
<%-- 				</c:if> --%>
				</a>
			</li>
			<li>
				<a>
					<img alt="프로필사진" src="">
					<span>사용자이름(토끼)</span>
				</a>
			</li>
		</ul>
	</aside>
	<!-- 채팅 영역 -->
	<%-- 채팅목록에서 칸을 클릭 시 ajax를 사용하여 채팅창 나오게함 --%>
	<section>
		<%@ include file="chat_content.jsp"%>
	</section>
	
	
	<!-- footer -->
	<footer>
		<div>여기 footer</div>
	</footer>
</body>
</html>