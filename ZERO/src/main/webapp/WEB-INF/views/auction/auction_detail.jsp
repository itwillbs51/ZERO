<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	$("#startPrice").html(comma($("#startPrice").html()));
	$("#presentPrice").html(comma($("#presentPrice").html()));
	$("#maxPrice").html(comma($("#maxPrice").html()));
	$("#zpayBalance").html(comma($("#zpayBalance").html()));
	for(let i=0; i<${fn:length(logList)}; i++){
 	$("#logBid"+i).html(comma($("#logBid"+i).html()));
	}	
	$("#bid_price").on("propertychange change keyup paste input", function() {
		
		
		let checkPrice = $("#bid_price").val() ;
				
		/* 숫자 comma 찍는 함수 */
		checkPrice = comma(checkPrice);
		
		
		/* console.log(p_price); */
		
		$("#bidCheck").html(checkPrice+" 원");
		if(checkPrice==""){
		$("#bidCheck").html("");}
		$("#bidCheck").css('color','red');

	});
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
	
function comma(str) {
    str = String(str);
    
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    
    if(regular_han.test(str)){
    	alert('숫자만 입력하세요');
    }
    
    return str.replace(/[^\d]+/g, '');
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
		width: 130px; 
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
                		<c:forEach var="log" items="${logList}" varStatus="i">
                		<c:if test="${log.member_id eq sessionScope.member_id}"><div class='alert alert-warning'></c:if>
                		<c:if test="${log.member_id ne sessionScope.member_id}"><div class='alert alert-secondary'></c:if>
                		<b>${log.member_id }님이 <span id="logBid${i.index}">${log.auction_log_bid }</span>원 입찰!</b>
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
                	 		<span id="startPrice">${product.auction_start_price }</span> 원
                	 	</div>
                	 </div>
                	 
	                <div class="row col-md-12 ">
	                
	                	<div class="col-4 col-md-4"  style=" text-align: right;">    
                	 		<h4><b>입찰가격 </b></h4>
                	 		<br>
                	 	</div>
                	 	<div class="col-4 col-md-2">
                	 		<input type="number" id="bid_price" class="bid" >원<br><span id=bidCheck ></span>
                	 		
                	 	</div>
                	 	<div class="col-4 col-md-6"> 
                	 		<button type="button" id="button-send"class="btn btn-secondary btn-block">입찰하기</button>
                	 	</div> 
                	 	  
	                	<div class="col-4 col-md-4"  style=" text-align: right;">    
                	 		<h4><b>즉시구매가격</b></h4>
                	 		<br>
                	 	</div>
                	 	<div class="col-4 col-md-2">
                	 		<span id="maxPrice">${product.auction_max_price }</span> 원
                	 	</div>
                	 	<div class="col-4 col-md-6"> 
                	 		<button type="button" class="btn btn-dark  btn-block">즉시구매</button>
                	 	</div>   
	                	
	                	<div class="col-4 col-md-4"  style=" text-align: right;">    
                	 		<h4><b>Z-PAY 잔액</b></h4>
                	 	</div>
                	 	<div class="col-4 col-md-2">
                	 		<span id="zpayBalance">150000</span> 원
                	 	</div>
                	 	<div class="col-4 col-md-6"> 
                	 		<button type="button" class="btn btn-primary  btn-block">충전하기</button>
                	 	</div>   
	                </div>
                </div>
            </div>
		</div>
		<div class="col-12 col-md-4"><div class="row d-flex justify-content-center">현재 접속중 회원</div></div>
		<div class="col-12 col-md-6" id="users"></div>
	</section>
	
	<!-- footer -->
	<footer>
		
	</footer>
</body>
<script type="text/javascript">

//전송 버튼 누르는 이벤트
$("#button-send").on("click", function(e) {
	
	if($("#bidCheck").html().length == 0){
		alert("금액을 입력하세요");
	}else{
	  let result = confirm($("#bidCheck").html()+"을 입찰하시겠습니까?");

      if(!result){return false;}

      sendMessage();
	}
});
//엔터키 누르는 이벤트
$("#bid_price").on("keyup",function(key){
    if(key.keyCode==13) {
    	if($("#bidCheck").html().length == 0){
    		alert("금액을 입력하세요");
    	}else{
    	let result = confirm($("#bidCheck").html()+"을 입찰하시겠습니까?");

        if(!result){return false;}


  	sendMessage();
    }
    }
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
	;
	$.ajax({
		data: {
			'auction_idx':"${param.id}",
			'auction_log_bid': bid_price,
		},
		url: "logHistory",
		type: "POST",
		success: function(result) {
			if(result == "true") {
				sock.send(bid_price)
			} else {
				alert("실패!");
			}
		},
		fail: function() {
			alert("실패!");
		}	
		
	});
	
}
//서버에서 메시지를 받았을 때
function onMessage(msg) {
	var data = msg.data;
	var sessionId = null; //데이터를 보낸 사람
	var message = null;
	var currentUsers=null;
	var arr = data.split(":");
	
	
	
	var cur_session = '${sessionScope.member_id}'; //현재 세션에 로그인 한 사람
	console.log("cur_session : " + cur_session);
	
	sessionId = arr[0];
	message = comma(arr[1]);
	currentUsers=arr[2];
	
    //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
    if(!message==""){
    	
	if(sessionId == cur_session){
		
		var str = "<div>";
		str += "<div class='alert alert-warning'>";
		str += "<b>" + sessionId + "님이 " + message + "원 입찰!</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str);
	}
	else{
		
		var str = "<div>";
		str += "<div class='alert alert-secondary'>";
		str += "<b>" + sessionId + "님이 " + message + "원 입찰!</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str);
	}
	$("#presentPrice").html(message);
	
    }else{
    	$("#users").html(currentUsers.replace(/[\[\]']+/g, ''));
    	
    }
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
	
	str += "<b>" + user + "님 입장 </b>";
	str += "</div>";
	
	$("#msgArea").append(str);
	
	
}

</script>
</html>