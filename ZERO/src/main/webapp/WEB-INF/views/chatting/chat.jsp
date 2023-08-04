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
<!-- 		<div class="container"> -->
			<section id="chatArea"> <%-- style="display: none;" --%>
<%-- 				<%@ include file="chat.jsp"%> --%>
				<%-- 위에 상품정보와 약속잡기, 송금하기 등이 있는 영역 --%>
				<article class="chatPage">
<!-- 					<i class="material-icons backBtn">arrow_back</i> -->
<!-- 					<hr> -->
					<div class="art_firstRow">
						<div class="product_photo co01">
							<img alt="상품사진" src="${pageContext.request.contextPath }/resources/img/슬라이드3.jpg">
<%-- 							<img alt="상품사진" src="${pageContext.request.contextPath }/resources/upload/${secondhandInfo.secondhand_image1}"> --%>
						</div>
						<div class="co02">
							<div class="co02-1">${secondhandInfo.secondhand_deal_status }</div>
							<div class="co02-2">${secondhandInfo.secondhand_subject }</div><br>
							<div class="co02-3">
								${secondhandInfo.secondhand_price }원
							</div>
						</div>
						<div class="co03">
							<button>
								<i class="material-icons">sim_card_alert</i>신고하기
							</button>
						</div>
					</div>
					<div class="art_secondRow">
						<div>
							<%-- 판매자의 경우 거래하기 아이콘버튼 넣기 --%>
							<%-- 판매자가 누르면 상태가 바뀐다는 것 알려주기 - 확인 - 상태 : 예약중으로 변경,  --%>
							<c:if test="${secondhandInfo.member_id eq sessionScope.member_id && secondhandInfo.secondhand_deal_status eq '판매중'}">
								<button id="doDeal" data-toggle="modal" data-target="#needConfirm">
									<i class="material-icons">done</i><span>거래하기 </span>
								</button>
							</c:if>
							<%-- 2. 약속버튼, z페이 보내기, 후기보내기(보냈으면 후기확인) 버튼 활성화 --%>
							<c:if test="${secondhandInfo.secondhand_deal_status eq '예약중' }">
								<button onclick="reservationNext(this.text)"><i class="material-icons">access_time</i><span>약속잡기 </span></button>
								<button onclick="reservationNext(this.text)"><i class="material-icons">attach_money</i><span>송금하기 </span></button>
								<button onclick="reservationNext(this.text)"><i class="material-icons">edit</i><span>후기쓰기 </span></button>
							</c:if>
							<%-- 찜하기 버튼과 버튼 클릭 시 상태 변경용 히든 타입 태그 --%>

						</div>
					</div>
					<hr>
				</article>
				
				<%-- 채팅창 영역 --%>
				<div class="chatMsgInputArea">
					<article id="chatMsgArea">
						<%-- 나오는 채팅만큼 보여주고 위로 무한스크롤?
						세션아이디와 비교해 세션아이디가 보낸 메세지는 오른쪽, 아닌 메세지는 왼쪽으로 정렬 --%>
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
												<input type="hidden" class="date" value="${chat.chat_datetime }">
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
												<input type="hidden" class="date" value="${chat.chat_datetime }">
												<fmt:formatDate value="${chat.chat_datetime }" pattern="a hh:mm"/>
											</div>
										</div>
									</div>
								
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
				
					</div>
					<%-- 채팅 입력 영역 --%>
					<article class="inputArea">
						<div class="input-group mb-3">
						<button class="listInfoBtn"><i class="material-icons">add</i></button><br>
							<div>
							</div>
							<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
							</div>
							
						</div>
							<%-- + 버튼 클릭 시 나오는 기능들 --%>
							<div>
								<table class="listSort" style="display: none;"> <%-- style="display: none;" --%>
									<tr>
										<td>
											<a><i class="material-icons">photo</i><br> 사진보내기 </a>
										</td>
										<td>
	<!-- 											<i class="material-icons">map</i>지도보내기(나의위치) -->
											<a><i class="material-icons">location_on</i><br> 지도보내기 </a>
										</td>
<!-- 										<td> -->
<!-- 											<a><i class="material-icons">access_time</i><br> 약속잡기 </a> -->
<!-- 										</td> -->
<!-- 										<td> -->
<!-- 											<a><i class="material-icons">attach_money</i><br> 송금하기 </a> -->
<!-- 										</td> -->
									</tr>
								</table>
							</div>
							<%-- 기능들 영역 끝 --%>
					</article>
					<%-- 채팅 입력 영역 끝 --%>
				</article>
				</div>
			</section>
				
<!-- 		</div> -->
		<!-- 채팅 구현 끝부분 -->
		
	</div>
	
	
	<%-- 찜하기 안내 모달 영역 --%>
	<div class="modal fade" id="needConfirm" tabindex="-1" role="dialog" aria-labelledby="needSessionId" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="needSessionId">거래하기 확인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body text-center" id="modalMsg">
	      <%-- 메세지가 표시되는 부분 --%>
		      정말 상대방과 거래하시겠습니까?<br>
		      최종 거래금액을 입력하고 진행하실 거래방법을 눌러주세요<br>
		      <div class="modal-price">
		      	최종거래금액 : 
			    <input type="number" id="finalPrice" value="${secondhandInfo.secondhand_price }" min="0" max="${secondhandInfo.secondhand_price }">원<br>
		      </div>
		      <div class="dealBtns">
	        	<button type="button" class="btn btn-dark" onclick="dealNext(1)">만나서 거래하기</button>
	        	<button type="button" class="btn btn-dark" onclick="dealNext(2)">Z맨</button>
	        	<button type="button" class="btn btn-dark" onclick="dealNext(3)">택배로 받기</button><br>
		      </div>
	      </div>
	      <div class="modal-footer justify-content-center">
	        <button type="button" class="btn btn-dark" data-dismiss="modal" aria-label="Close">아니오</button>
	      </div>
	    </div>
	  </div>
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
	
	// 채팅 메세지
	let chatMessage;
	
	// 채팅 보내는 사람(안내일때는 그때마다 바꾸는걸로)
	let sender = "${member_id}";
	
	//전송 버튼 누르는 이벤트
	$("#button-send").on("click", function(e) {
		chatMessage = $('#msg').val();
		
		if(chatMessage != "") {
			sendMessage(sender);
			$('#msg').val('');
		}
	});
	
	// 엔터 누르면 보내지는 이벤트
	$("#msg").keydown(function(key) {
		chatMessage = $('#msg').val();
		
		if(chatMessage != "" && key.keyCode == 13) {
			sendMessage(sender);
			$('#msg').val('');
		}
	});
	
	// 채팅일 알람(다른날 채팅이면 날짜 알려주기)
	// 채팅창에서 가장 최근 올라온 메세지의 datetime을 받음(sethour)
	let lastDatetime = new Date($(".date").last().val());
// 	console.log("최후 : " + lastDatetime);	// Thu Aug 03 2023 00:00:00 GMT+0900
	let formatNow = formatDate(new Date());
	
	function formatDate(data){
        let date = new Date(data);
        let year = date.getFullYear();
        let month = String(date.getMonth() + 1).padStart(2, '0');
        let day = String(date.getDate()).padStart(2, '0');

        let formattedDate = year + '년 ' + month + "월 " + day + "일 ";
        return formattedDate;
    }
	
// 	console.log(formatDate(lastDatetime));
// 	console.log(now);
	
	// ================== 웹소켓을 통한 채팅창 동기 과정 ==================================
	var sock = new SockJS('http://localhost:8089/zero/chatting?=chat_${param.room_idx}');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	function sendMessage(sender) {
		
		let chat_content_type = '일반';

		if(formatDate(lastDatetime) != formatNow) {
			formatNow = "&-안내" + formatNow;
			sock.send(formatNow);
			
			// 안내 내용을 DB에 저장하기
			$.ajax({
				data: {
//	 				chat_datetime: now, // 이건 DB에 넣을 때 기본값으로 넣기
					'chat_content': formatNow,
					'chat_content_type' : '안내',
					'room_idx': "${param.room_idx}",
					'member_id': "notice@test.com"
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
		} else if(sender == 'notice@test.com') {
			// 안내메세지 관리
			chat_content_type = '안내';
// 			chatMessage = chatMessage.split("&-안내")[1];
		}
		
		// 채팅 내용을 DB에 저장하기
		$.ajax({
			data: {
// 				chat_datetime: now, // 이건 DB에 넣을 때 기본값으로 넣기
				'chat_content': chatMessage,
				'chat_content_type' : chat_content_type,
				'room_idx': "${param.room_idx}",
				'member_id': sender
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
	
	// ==========================================================================
	
		
	// ====================== 텍스트 외 다른 입력 기능 ==========================
	let isOpen = false;
	// 버튼 클릭 시 목록보이게하는 함수
	$(function() {
		$(".listInfoBtn").on("click", function() {
			if(!isOpen) { // 목록이 열려있지 않으면
				$(".listSort").css("display", "");
				isOpen = true;
				
				
			} else {	// 목록 열려있으면
				$(".listSort").css("display", "none");
				isOpen = false;
			}
			
		});	// 버튼 클릭 시 호출되는 함수 끝
	});	// 함수 호출 끝
	
	// ================= 버튼들 기능 함수 =========================
	function dealNext(num) {
		// 전역변수
		let price = $("#finalPrice").val();
		console.log("최종 금액 : " + price);
		
		// 채팅내용 : chatMessage에 저장(안내니까 "-&안내" 붙이기)하고 sendMessage(sender) 실행시키기
		switch(num) {
			case 1 :
				// 1-1. 만나서 거래하기 클릭 => 안내 메세지 띄우기
				chatMessage = '&-안내' + '${chatRoom.buyer_id}' + '님이 <b>만나서 거래하기</b>를 선택하셨습니다.<br> 안전거래 되세요!';
				setOrderSecondhand("직거래", price);
				break;
			case 2 :
				// 1-2. z맨 클릭 => 안내 메세지 띄우고 판매자-출발주소, 구매자-도착주소 받는 폼 보여주기(보고나서는 수정불가)
				chatMessage = '&-안내' + ' ${chatRoom.buyer_id}' + '님이 <b>Z맨으로 거래하기</b>를 선택하셨습니다.<br> 출발지와 도착지를 입력해주세요!';
				chatMessage += '<button class="btn btn-dark" onclick="window.open("chatToZ","newWindow", "width=300, height=300, left=600, top=400");">'
				chatMessage += 'Z맨 호출 접수</button>'
// 				setOrderSecondhand("Z맨", price);
				
				break;
			case 3 :
				// 1-3. 택배로 받기 클릭 => 안내 메세지 띄우고 판매자에게 택배회사 주소가 담긴 버튼 보여주기(안내메세지 판별해 버튼 보여주기)
				chatMessage = '&-안내' + ' ${chatRoom.buyer_id}' + '님이 <b>택배로 받기</b>를 선택하셨습니다.<br> 안전거래 되세요!';
				chatMessage += '<button class="btn btn-dark" onclick="location.href=\'https://www.cjlogistics.com/ko/tool/parcel/reservation-general\'">CJ대한통운 택배예약</button>'
// 				setOrderSecondhand("택배", price);
				
				break;
				
		}	// switch문 끝
		// 메세지 보내기
		sendMessage('notice@test.com');
		
		// 2. 약속버튼, z페이 보내기, 후기보내기(보냈으면 후기확인) 버튼 활성화
				
	}	// 거래버튼 시 실행 함수 끝
	
	// 받은 거래타입과 금액, 채팅방에 있는 정보(buyer_id, seller_id, secondhand_idx, secondhand_product)를
	// DB ORDER_SECONDHAND에 저장
	function setOrderSecondhand(type, price) {
		
		$.ajax({
			data: {
				"type": type,
				"order_secondhand_price": price,
				"order_secondhand_seller": "${chatRoom.seller_id}",
				"order_secondhand_buyer": "${chatRoom.buyer_id}",
				"order_secondhand_product": "${secondhandInfo.secondhand_subject }",
				"secondhand_idx" : ${chatRoom.secondhand_idx}
			},
			url: "ChatDeal",
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
		});	// ajax끝
		
	}	// setOrderSecondhand() 끝
	
	function reservationNext(type) {
		// 전역변수
		
		switch(type) {
			case '약속잡기' :
			
				break;
			case '송금하기' :
				
				break;
			case '후기쓰기' :
				break;
		}
		// switch문 끝
	}
	
</script>
	
	<!-- footer -->
	<footer>
		<div>여기 footer</div>
	</footer>
</body>
</html>