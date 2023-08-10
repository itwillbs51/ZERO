<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"> -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script> -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script> -->
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<title>ZERO</title>
<%-- 소켓통신을 위한 함수들을 콜백형태로 제공 --%>
<!-- <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> -->
</head>
<body>
	<div class="alarmArticle">
		<div class="alarmContainer">
			<div class="alarmContentArea">
				<div class="alarmTitleArea">
					<div class="alarmTitle">
						알림
					</div>
					<div class="detailArea">
						<a class="moreAlarm" href="">더보기 > </a>
					</div>
				</div>
<%-- 				<button onclick="sendAlarmMessage('${sessionScope.member_id}', '채팅', '테스트입니다')">알람보내보기</button> --%>
				<hr class="alarmHr">
				<ul id="alarmList">
<%-- 					<c:forEach var="i" begin="1" end="5"> --%>
<!-- 						<li class="alarmItem"> -->
<!-- 							<div class="alarmTitle"> -->
<!-- 								채팅 -->
<!-- 							</div> -->
<!-- 							<div class="alarmContent"> -->
<!-- 								채팅이 도착했어요! -->
<!-- 							</div> -->
<!-- 						</li> -->
<%-- 					</c:forEach> --%>
				</ul>
				
			</div>
		</div><%-- container 영역 끝 --%>
	</div>
	
</body>
</html>