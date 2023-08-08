<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/alarm.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<title>ZERO</title>
<%-- 알림 관련 웹소켓 코드 --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/alarm.js"></script> --%>
<script type="text/javascript">

	//---------- 알림 구현 ---------------------------------------
	let member_id = ${sessionScope.member_id}.replace("@", "_");
	if("${sessionScope.member_type}" != "회원") {
		$("#receiver_id").val().replace("@", "_");
	}
	
	// 알림 메세지
	let alarmMessage;
// 	let chatImgMessage;
	// 채팅 보내는 사람
	let receiver = "${member_id}";
	
	// 웹소켓 주소 설정 - 알림창 동기 설정
// 	var sock = new SockJS('${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chatting?=chat_${param.room_idx}');
	var sock;
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	function sendMessage(receiver_id, type, alarmMessage) {
		sock = new SockJS('${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chat?id=' + receiver_id);
		
		// 알림 내용을 DB에 저장하기
// 		$.ajax({
// 			data: {
// // 				chat_datetime: now, // 이건 DB에 넣을 때 기본값으로 넣기
// 				'chat_content': chatMessage,
// 				'chat_content_type' : chat_content_type,
// 				'room_idx': "${param.room_idx}",
// 				'member_id': sender
// 			},
// 			url: "chatRemember",
// 			type: "POST",
// 			success: function(data) {
// // 				console.log("DB 저장 성공");
// 			},
// 			error: function(request,status,error) {
// 				alert("code:"+request.status+"\n"
// 						+"message:"+request.responseText+"\n"
// 						+"error:"+error);
// // 				console.log("DB 저장 실패");
// 			}
// 		});	// ajax 끝
		
		// receiver_id에게 type(알림 타입), alarmMessage(알림 내용) 문자열하나로 보내기
		
		// 각 이벤트 시 받는 메세지를 소켓으로 전달
		sock.send(chatMessage);
		
	}// sendMessage(sender) 끝
	
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
		
		if(message.startsWith("&-안내")) {	// 안내메세지인 경우
			let noticeMessage = message.split("&-안내")[1];
			var str = '<div class="noticeMsg">';
// 			str += '<div>';
			str += noticeMessage;
// 			str += '</div>';
			str += '</div>';
			
			$("#msgArea").append(str);
			
		}else if(sessionId == cur_session){ //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
			
			var str = "<div class='msgitem'>";
			str += "<div class='alert msgRight'>";
			str += "<div class='msgTime'>";
			str += formattedTime;
			str += "</div>";
			str += "<div class='msg'>";
			str += "<b>" + message + "</b>";
// 			str += "<b>" + sessionId + " : " + message + "</b>";
			str += "</div></div></div>";
			
			$("#msgArea").append(str);
		} else{
			
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
<style type="text/css">
	/* ---------- 알람창 크기조절 ----------------- */
body {
	min-width: 320px;
}
article{
	width: inherit;
	min-height: 100%;
	background-color: #f4f6f8;
}
.container {
	margin: auto;
/* 	max-width: 300px; */
	padding: 15px;
}
.contentArea {
	margin: auto;
	padding: 10px;
	border-radius: 10px;
	background-color: white;
}
.titleArea {
	display: flex;
	justify-content: space-between;
}
.title {
	font-weight: bold;
	margin-left: 5px;
	font-size: 20px;
}
.detail {
	text-decoration: none;
	color: #555;
	font-size: 14px;
}

hr {
	margin: 0;
	padding: 0;
}
#alarmList {
	list-style:none;
/* 	align-items: center; */
	margin:0;
	padding: 0;
}
.alarmItem {
	margin: 10px 8px;
}
.alarmTitle {
	font-size: 17px;
}
.alarmContent {
	font-size: 15px;
	color: gray;
}
/* .btnArea { */
/* 	margin: 10px auto; */
/* } */
/* .btnArea .btn { */
/* 	margin: auto; */
/* } */
</style>
</head>
<body>
	<article>
		<div class="container">
			<div class="contentArea">
				<div class="titleArea">
					<div class="title">
						알림
					</div>
					<div class="detailArea">
						<a class="detail" href="">더보기 > </a>
					</div>
				</div>
				<hr>
				<ul id="alarmList">
					<c:forEach var="i" begin="1" end="5">
						<li class="alarmItem">
							<div class="alarmTitle">
								채팅
							</div>
							<div class="alarmContent">
								채팅이 도착했어요!
							</div>
						</li>
					</c:forEach>
				</ul>
				
			</div>
		</div><%-- container 영역 끝 --%>
	</article>
	
</body>
</html>