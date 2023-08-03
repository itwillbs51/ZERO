<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<meta charset="UTF-8">
<title> ZERO | 경매상세 </title>
	
<script type="text/javascript">


$(function(){
	updateTime();
	});

	function updateTime() {
	  const now = new Date();
	  const endOfDay = new Date(now.getFullYear(), now.getMonth(), now.getDate() + 1, 0, 0, 0);
	  let timeRemaining = endOfDay - now;
	  let hours = Math.floor(timeRemaining / 1000 / 60 / 60);
	  let minutes = Math.floor((timeRemaining / (1000 * 60)) % 60);
	  let seconds = Math.floor((timeRemaining / 1000) % 60);
	  let currentTime = padZero(hours, 2)+':'+padZero(minutes, 2)+':'+padZero(seconds, 2);
	  
	  $('#clock').html('<h3>'+currentTime+'</h3>');

// 	  setInterval(updateTime, 1000);
	  setTimeout(updateTime, 1000);
	  
	}
function padZero(num, size) {
	  let s = num + '';
	  while (s.length < size) s = '0' + s;
	  return s;
	}
</script>


<style type="text/css">

	#auction_log{
		overflow: auto; 
		width: 100%; 
		height: 200px; 
		padding: 10px; 
		border:1px solid;
		}
	#bid_price{
		width: 95px; 
	}
	

	@media only screen and (min-width: 768px) {
		body{
		margin-top: 86px!important;
		
	}
	
		#auction_log{
		height: 500px; 		
		}
	
	}
	
	
</style>


</head>
<body>
	<!-- header -->
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	
	<!-- nav - 메뉴영역 -->
	<nav>
		<a>경매중</a>
		<a>입찰 예정 경매</a>
		<a>종료된 경매</a>
	</nav>
	<hr>
	<nav>
		<a>전체</a>
		<a>럭셔리</a>
		<a>테크</a>
		<a>한정판</a>
	</nav>
	
	<section>
		<div class="container-fluid">
			<div class="row">
				<!-- 좌측 영역 -->
                <div class="col-md-4">
                	<div class="row d-flex justify-content-center">
                	<div class="col-4 col-md-4"><h3>남은시간</h3></div>	<div class="col-3 col-md-3" id="clock"></div>

<!--                 		<h2>03 : 23 : 01</h2> -->
                	</div>
                		<div id="auction_log">
                		<div id="logArea" class="col">
                		<c:forEach var="log" items="${logList}" >
                		<c:if test="${log.member_id eq sessionScope.member_id}"><div class='alert alert-warning'></c:if>
                		<c:if test="${log.member_id ne sessionScope.member_id}"><div class='alert alert-secondary'></c:if>
                		<b>${log.member_id }님이 ${log.auction_log_bid }원 입찰!</b>
                		</div>
                		</c:forEach>
                		</div>
                		<div id="msgArea" class="col">
                		</div>
                		</div>                	
                </div>
				<!--우측 영역 -->
                <div class="row col-md-8">
						<!-- 이미지  -->
                	 <div class="col-md-4 d-none d-md-block">
                	 	<img alt="상품이미지" class="img-fluid" src="${pageContext.request.contextPath }/resources/upload/${product.auction_image1 }">
                	 </div>
						<!--상품명 -->								
                	 <div class="row col-md-8" style=" text-align: center;">  
                	               	 	
                	 	<div class="col-12 col-md-12"><h3>${product.auction_title }</h3></div>
                	 	
                	 	<div class="col-6 col-md-3 d-none d-md-block"> 
                	 		<h4><b>경매날짜</b></h4>
                	 	</div>   
                	 	
                	 	<div class="col-6 col-md-9 d-none d-md-block">    
                	 		2023년 8월 2일~2023년 8월 3일
                	 	</div>
                	 	<div class="col-6 col-md-3"> 
                	 		<h4><b>현재가격</b></h4>
                	 	</div>   
                	 	
                	 	<div class="col-6 col-md-9">    
                	 		<span id="presentPrice">
                	 		<c:if test="${empty logList  }">
								${product.auction_start_price }
							</c:if>
                	 		<c:forEach var="log" items="${logList}"  varStatus="index">
                	 			   <c:if test="${index.last}">${log.auction_log_bid}</c:if>
                	 		</c:forEach>
                	 		</span> 원
                	 	</div>
                	 	<div class="col-6 col-md-3 d-none d-md-block"> 
                	 		<h4><b>시작가격</b></h4>
                	 	</div>   
                	 	
                	 	<div class="col-6 col-md-9 d-none d-md-block">    
                	 		${product.auction_start_price }원
                	 	</div>
                	 </div>
                	 
	                <div class="row col-md-12 ">
	                
	                	<div class="col-4 col-md-4"  style=" text-align: right;">    
                	 		<h4><b>입찰가격 </b></h4>
                	 		<br>
                	 	</div>
                	 	<div class="col-4 col-md-2">
                	 		<input type="number" id="bid_price" class="bid" value=125000>원
                	 		
                	 	</div>
                	 	<div class="col-4 col-md-6"> 
                	 		<button type="button" id="button-send"class="btn btn-secondary btn-block">입찰하기</button>
                	 	</div> 
                	 	  
	                	<div class="col-4 col-md-4"  style=" text-align: right;">    
                	 		<h4><b>즉시구매가격</b></h4>
                	 		<br>
                	 	</div>
                	 	<div class="col-4 col-md-2">
                	 		${product.auction_max_price }원
                	 	</div>
                	 	<div class="col-4 col-md-6"> 
                	 		<button type="button" class="btn btn-dark  btn-block">즉시구매</button>
                	 	</div>   
	                	
	                	<div class="col-4 col-md-4"  style=" text-align: right;">    
                	 		<h4><b>Z-PAY 잔액</b></h4>
                	 	</div>
                	 	<div class="col-4 col-md-2">
                	 		15,0000원
                	 	</div>
                	 	<div class="col-4 col-md-6"> 
                	 		<button type="button" class="btn btn-primary  btn-block">충전하기</button>
                	 	</div>   
	                </div>
                </div>
            </div>
		</div>
	</section>
	
	<!-- footer -->
	<footer>
		
	</footer>
</body>
<script type="text/javascript">

//전송 버튼 누르는 이벤트
$("#button-send").on("click", function(e) {
	sendMessage();
	
});

var sock = new SockJS('${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chatting?id=${param.id}');
sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;

function sendMessage() {
	let bid_price=$("#bid_price").val();
	
// 	if(bid_price<=presentPrice){
// 		alert("현재 가격 보다 높은 금액으로 입찰 가능합니다.")
// 	}
	sock.send(bid_price);
	$.ajax({
		data: {
			'auction_idx':"${param.id}",
			'auction_log_bid': bid_price,
		},
		url: "logHistory",
		type: "POST",
		success: function(data) {
			alert("입찰 성공");
		},
		error: function() {
			
			alert("입찰 실패 다시 시도");
		}
		
	});
	
}
//서버에서 메시지를 받았을 때
function onMessage(msg) {
	
	var data = msg.data;
	var sessionId = null; //데이터를 보낸 사람
	var message = null;
	
	var arr = data.split(":");
	
	for(var i=0; i<arr.length; i++){
		console.log('arr[' + i + ']: ' + arr[i]);
	}
	
	var cur_session = '${sessionScope.member_id}'; //현재 세션에 로그인 한 사람
	console.log("cur_session : " + cur_session);
	
	sessionId = arr[0];
	message = arr[1];
	
    //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
	if(sessionId == cur_session){
		
		var str = "<div>";
		str += "<div class='alert alert-warning'>";
		str += "<b>" + sessionId + " : " + message + "원 입찰!</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str);
	}
	else{
		
		var str = "<div>";
		str += "<div class='alert alert-secondary'>";
		str += "<b>" + sessionId + " : " + message + "원 입찰!</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str);
	}
	$("#presentPrice").html(message);
}
//채팅창에서 나갔을 때
function onClose(evt) {
	
	var user = '${sessionScope.member_id}';
// 	sock.send( "님이 퇴장하셨습니다.");
	
	
}
//채팅창에 들어왔을 때
function onOpen(evt) {
	
	var user = '${sessionScope.member_id}';
	
	var str = "<div>";
	str += "<div class='alert alert-warning'>";
	str += "<b>" + user + "님이 입장하셨습니다 </b>";
	str += "</div></div>";
	
	$("#msgArea").append(str);
	
	
}

</script>
</html>