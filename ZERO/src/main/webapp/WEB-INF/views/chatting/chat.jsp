<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%-- 소켓통신을 위한 함수들을 콜백형태로 제공 --%>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<%-- google 아이콘 --%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/chat.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>채팅 | ZERO</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
	
	let isOpen = false;
	// 버튼 클릭 시 목록보이게하는 함수
	$(function() {
		$(".listInfoBtn").on("click", function() {
			if(!isOpen) { // 목록이 열려있지 않으면
				$(".listSort").css("display", "initial");
				isOpen = true;
			} else {	// 목록 열려있으면
				$(".listSort").css("display", "none");
				isOpen = false;
			}
			
		});	// 버튼 클릭 시 호출되는 함수 끝
		
		// 정렬기준 선택 시 호출되는 함수
// 		$(".listSort li").on("click", function() {
// 			$(".listSort i").remove();
// 			$(this).append(
// 					'<i class="material-icons">check</i>'
// 			);
			// 클릭된 목록의 아이디를 판별해 상품 목록 다시 불러오는 ajax
	//			$.ajax({
	//				type: ,
	//				dataType: ,
	//				data: ,
	//				success: function(result) {
	//					alert("불러오기 성공!");
					
	//				},
	//				error: function() {
	//					alert("불러오기 실패!");
	//				}
	//			}); // ajax 끝
			
// 		});	// onclick 함수 끝
	});	// function 끝
	
	// 채팅목록 클릭 시 채팅 보이게하는 함수
	$(function() {
		$("#chatList li").on("click", function() {
				$("#chatArea").css("display", "initial");
			
		});	// 버튼 클릭 시 호출되는 함수 끝
		$(".backBtn").on("click", function() {
				$("#chatArea").css("display", "none");
		}); // <- 버튼 클릭 시 호출되는 함수 끝
		
	});	// function 끝
	
	// ================ 채팅 =========================
	// 채팅 기능
	$(".submitBtn").on("click", function() {
		console.log('send message...');
		sendMessage();
// 		#("#inputText").val("");
		
	});	// 보내기 버튼 클릭 함수 끝
	
	// 웹소켓을 지정한 URL로 연결
// 	let sock = new SockJS("<c:url value="/chatting"/>");
	var sock = new SockJS('http://localhost:8089/zero/chatting');
	// 웹소켓 서버에서 메세지를 보내면 자동으로 실행됨
// 	sock.onmessage = onMessage;
	// 웹소켓과 연결을 끊고 싶을 때 실행하는 메서드
// 	sock.onclose = onClose;
// 	sock.onopen = onOpen;
	
	// 웹소켓으로 메세지 보내는 함수
	function sendMessage() {
		sock.send($("#inputText").val());
	}
	
	// 웹소켓이(서버가) 보내준 데이터를 파라미터로 받는 함수
	function onMessage(evt) { // 변수 안에 function을 넣음
		let data = evt.data;
		let sessionId = null;	// 데이터를 보낸 사람
		let message = null;
		
		// 문자열을 split
		let strArray = data.split('|');
		
		for(let i = 0; i < strArray.length; i++) {
			console.log('strArray[' + i + '] : ' + strArray[i]);
		}
		
		//----------- 나중에 로그인 구현되면 구동 되는지 확인하기 --------------
// 		/* 
		// 현재 세션아이디
// 		let current_sessionId2 = $("#userid").val();
		let current_sessionId = "${userid}"; // 현재 세션에 로그인 한 사람
		console.log('현재 세션 아이디 : ' + current_sessionId);
// 		console.log('현재 세션 아이디2 : ' + current_sessionId2);
		
		sessionId = strArray[0];	// 현재 메세지를 보낸 사람의 세션 등록
		message = strArray[1];		// 현재 메세지를 저장
		
		// 나와 상대방이 보낸 메세지를 구분하여 영역 나눔
		if(sessionId == current_sessionId) {
			$(".chatZone").append(
					'<tr>'
					+ '<td class="msgRight">'
					+ '	<div class="msgTime">오후1:37</div>'
					+ '	<div class="msg">' + sessionid + ' : ' + message + '</div>'
					+ '</td>'
					+ '</tr>'
			);
			
		} else {
			$(".chatZone").append(
					'<tr>'
					+ '<td class="msgLeft">'
					+ '	<div class="msg">' + sessionid + ' : ' + message + '</div>'
					+ '	<div class="msgTime">오후1:52</div>'
					+ '</td>'
					+ '</tr>'
			);
			
		}
		
// 		console.log('chatting data : ' + data);
		
		// sock. close();
// 		*/
	}	// onMessage() 함수 끝

	// 채팅방에서 나갔을 때 -> 채팅에선 필요 없을 듯
	function onClose(evt) {
		$("#data").append("연결 끊김");
	}
	
	// 채팅창에 들어왔을 때 -> 채팅에선 필요 없을 듯
	function onOpen(evt) {
		
	}
	
	//문서 시작 시 나올 것들
// 	$(function() {
		
// 	});		// function() 끝
	
</script>
</head>
<body>
	<!-- header -->
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	
	<%-- 세션 아이디 받기 - 없으면 fail_back --%>
<%-- 	<input type="hidden" id="userid" value="${userid }"> --%>
	
	<%-- 크기 조절을 위해 main에 다 넣음 --%>
	<div id="main">
		<!-- nav - 메뉴영역 -->
		<nav>
			채팅
		</nav>
		<hr id="navLine">
		
		<!-- 채팅 목록, 채팅창 영역 -->
		<div id="mainArea">
			<!-- 채팅목록 영역 -->
			<aside id="chatListArea">
				<ul id="chatList">
					<c:forEach var="i" begin="1" end="2">
						<li class="chatRoomList">
							<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/img/슬라이드2.jpg">
							<span>사용자이름(고양이)</span>
						</li>
						<li class="chatRoomList">
							<input type="hidden" value="방번호">
							<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/img/슬라이드3.jpg">
							<span>사용자이름(유니콘)</span>
		<%-- 				<c:if test=""> --%>
								(5) 알람
		<%-- 				</c:if> --%>
						</li>
					</c:forEach>
				</ul>
			</aside>
			<!-- 채팅 영역 -->
			<%-- 채팅목록에서 칸을 클릭 시 ajax를 사용하여 채팅창 나오게함 --%>
			<section id="chatArea" style="display: none;"> <%-- style="display: none;" --%>
				<%-- 위에 상품정보와 약속잡기, 송금하기 등이 있는 영역 --%>
				<article class="chatPage">
					<i class="material-icons backBtn">arrow_back</i>
					<hr>
					<div class="art_firstRow">
						<div class="product_photo co01">
							<img alt="조던" src="${pageContext.request.contextPath }/resources/img/슬라이드3.jpg">
						</div>
						<div class="co02">
							<span class="co02-1">판매중</span>
							<span class="co02-2">레인부츠 사이즈 xxx (상품명)</span><br>
							<span class="co02-3">
								30,000원
							</span>
						</div>
						<div class="co03">
							<button>
								<i class="material-icons">sim_card_alert</i>신고하기
							</button>
						</div>
					</div>
					<div class="art_secondRow">
						<div>
							<button><i class="material-icons">access_time</i><span>약속잡기 </span></button>
							<button><i class="material-icons">attach_money</i><span>송금하기 </span></button>
							<%-- 판매자의 경우 거래하기 아이콘버튼 넣기 --%>
							<button><i class="material-icons">done</i><span>거래하기 </span></button>
						</div>
					</div>
					<hr>
				</article>
				
				<%-- 채팅창 영역 --%>
				<div class="chatMsgInputArea">
					<article class="chatMsgArea">
						<%-- 나오는 채팅만큼 보여주고 위로 무한스크롤? --%>
						<%-- 세션아이디와 비교해 세션아이디가 보낸 메세지는 오른쪽, 아닌 메세지는 왼쪽으로 정렬 --%>
						<table class="chatZone">
							<tr>
								<td class="msgRight">
									<div class="msgTime">오후1:37</div>
									<div class="msg">안녕하세요</div>
								</td>
							</tr>
							<tr>
								<td class="msgLeft">
									<div class="msg">안녕하세요~</div>
									<div class="msgTime">오후1:52</div>
								</td>
							</tr>
						</table>
					</article>
					
					<%-- 채팅 입력 영역 --%>
					<article class="inputArea">
						<button class="listInfoBtn"><i class="material-icons">add</i></button>
							<ul class="listSort" style="display: none;">
								<li><i class="material-icons">photo</i>사진보내기</li>
								<li><i class="material-icons">map</i>지도보내기</li>
								<li><i class="material-icons">access_time</i>약속보내기</li>
								<li><i class="material-icons">attach_money</i>송금보내기</li>
								<li><i class="material-icons">location_on</i>나의 위치</li>
							</ul>
						<div class="inputTextBox">
							<input type="text" id="inputText" placeholder="메세지를 입력하세요">
						</div>
						<button class="submitBtn">
							<i class="material-icons">subdirectory_arrow_left</i>
						</button>
						
					</article>
				</div>
			</section>
		</div>
	</div>
	
	<!-- footer -->
	<footer>
		<div>여기 footer</div>
	</footer>
</body>
</html>