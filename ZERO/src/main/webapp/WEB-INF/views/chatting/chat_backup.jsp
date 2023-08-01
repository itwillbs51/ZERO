<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>

<%-- 소켓통신을 위한 함수들을 콜백형태로 제공 --%>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<%-- google 아이콘 --%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/chat.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>채팅 | ZERO</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/sockjs.min.js"></script>
</head>
<body>
	<!-- header -->
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	
	<%-- 세션 아이디 받기 - 없으면 fail_back --%>
	<input type="hidden" id="userid" value="${userid }">
	
	<%-- 크기 조절을 위해 main에 다 넣음 --%>
	<div id="main">
		<!-- nav - 메뉴영역 -->
		<nav>
			채팅
		</nav>
		<hr id="navLine">
		
		<!-- 채팅 목록, 채팅창 영역 -->
		<div class="container">
<!-- 			<div class="col-6"> -->
<!-- 				<label><b>채팅방</b></label> -->
<!-- 			</div> -->
			<div>
				<div id="msgArea"><%-- class="col" --%>
					<c:forEach var="chat" items="${chatList }">
						<c:choose>
							<%-- 채팅 타입이 '안내' 일 때 --%>
							<c:when test="${chat.chat_content_type eq '안내' }">
								<div class="noticeMsg">
									<span>
										${chat.chat_content }
									</span>
								</div>
							</c:when>
							<%-- 세션아이디가 보낸 아이디와 같을 때 --%>
							<c:when test="${chat.member_id eq sessionScope.member_id }">
								<div class="msgitem">
									<div class="alert msgRight">
										<div class="msgTime">
											<fmt:formatDate value="${chat.chat_datetime }" pattern="a hh:mm"/>
										</div>
										<div class="msg">
											<b>${chat.chat_content }</b>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="msgitem">
									<div class="alert msgLeft">
										<div class="msg">
											<b>${chat.chat_content }</b>
										</div>
										<div class="msgTime">
											<fmt:formatDate value="${chat.chat_datetime }" pattern="a hh:mm"/>
										</div>
									</div>
								</div>
							
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
				
				</div>
				<div class="">
				<div class="input-group mb-3">
					<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
					</div>
				</div>
				</div>
			</div>
			<div class="col-6">
			</div>
		</div>
		<!-- 채팅 구현 끝부분 -->
		
	</div>
	
<script type="text/javascript">
	
	// 스크롤 위치 조정
	// 요소 가져오기
	let scrollContainer = document.querySelector('#msgArea');
	// 요소 영역의 높이와 스크롤 높이 가져오기
	let scrollHeight = scrollContainer.scrollHeight;
	let containerHeight = scrollContainer.clientHeight;
	// 스크롤 위치 조정
	scrollContainer.scrollTop = scrollHeight - containerHeight;
	
	//전송 버튼 누르는 이벤트
	$("#button-send").on("click", function(e) {
		sendMessage();
		$('#msg').val('');
	});
	
	// 엔터 누르면 보내지는 이벤트
	$("#msg").keydown(function(key) {
		if(key.keyCode == 13) {
			sendMessage();
			$('#msg').val('');
		}
	});
	
	var sock = new SockJS('http://localhost:8089/zero/chatting?id=${param.chat_room_idx}');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	function sendMessage() {
		let message = $("#msg").val();
		sock.send(message);
		
		let chat_content_type = '일반';
		
		// 채팅 내용을 DB에 저장하기
		$.ajax({
			data: {
// 				chat_datetime: now, // 이건 DB에 넣을 때 기본값으로 넣기
				'chat_content': message,
				'chat_content_type' : chat_content_type,
				'chat_room_idx': "${param.chat_room_idx}",
				'member_id': "${member_id}"
			},
			url: "chatRemember",
			type: "POST",
			success: function(data) {
				console.log("DB 저장 성공");
			},
			error: function(request,status,error) {
				alert("code:"+request.status+"\n"
						+"message:"+request.responseText+"\n"
						+"error:"+error);
				console.log("DB 저장 실패");
			}
			
		});	// ajax 끝
		
	}
	
	//서버에서 메시지를 받았을 때
	function onMessage(msg) {
		
		var data = msg.data;
		var sessionId = null; //데이터를 보낸 사람
		var message = null;
		
		var arr = data.split(":");
		
// 		for(var i=0; i<arr.length; i++){
// 			console.log('arr[' + i + ']: ' + arr[i]);
// 		}
		
		var cur_session = '${member_id}'; //현재 세션에 로그인 한 사람
		
		sessionId = arr[0];
		message = arr[1];
		
		let now = new Date();
		// 원하는 포맷으로 날짜와 시간을 포맷 (예: 오후 09:30)
		let formattedTime = now.toLocaleString('ko-KR', { hour12: true, hour: 'numeric', minute: 'numeric' });
		
	    //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
		if(sessionId == cur_session){
			
			var str = "<div class='msgitem'>";
			str += "<div class='alert msgRight'>";
			str += "<div class='msg'>";
			str += "<b>" + message + "</b>";
// 			str += "<b>" + sessionId + " : " + message + "</b>";
			str += "</div>";
			str += "<div class='msgTime'>";
			str += formattedTime;
			str += "</div></div></div>";
			
			$("#msgArea").append(str);
		}
		else{
			
			var str = "<div class='msgitem'>";
			str += "<div class='alert msgLeft'>";
			str += "<div class='msg'>";
			str += "<b>" + message + "</b>";
// 			str += "<b>" + sessionId + " : " + message + "</b>";
			str += "</div>";
			str += "<div class='msgTime'>";
			str += formattedTime;
			str += "</div></div></div>";
			
			$("#msgArea").append(str);
		}
		
	    
		// 스크롤 위치 조정
		// 요소 가져오기
		scrollContainer = document.querySelector('#msgArea');
		// 요소 영역의 높이와 스크롤 높이 가져오기
		scrollHeight = scrollContainer.scrollHeight;
		containerHeight = scrollContainer.clientHeight;
		// 스크롤 위치 조정
		scrollContainer.scrollTop = scrollHeight - containerHeight;
	}
	//채팅창에서 나갔을 때
	function onClose(evt) {
		
// 		var user = '${pr.username}';
// 		var str = user + " 님이 퇴장하셨습니다.";
		
// 		$("#msgArea").append(str);
	}
	//채팅창에 들어왔을 때
	function onOpen(evt) {
		
// 		var user = '${pr.username}';
// 		var str = user + "님이 입장하셨습니다.";
		
// 		$("#msgArea").append(str);
	}
	
</script>
	
	<!-- footer -->
	<footer>
		<div>여기 footer</div>
	</footer>
</body>
</html>