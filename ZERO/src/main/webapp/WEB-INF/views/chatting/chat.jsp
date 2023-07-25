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
<%-- google 아이콘 --%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/chat.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>채팅 | ZERO</title>
</head>
<body>
	<!-- header -->
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	
	<%-- 크기 조절을 위해 main에 다 넣음 --%>
	<div id="main">
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
			<%-- 위에 상품정보와 약속잡기, 송금하기 등이 있는 영역 --%>
			<article class="chatPage">
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
			<article class="chatMsgArea">
				<%-- 나오는 채팅만큼 보여주고 위로 무한스크롤? --%>
				<%-- 세션아이디와 비교해 세션아이디가 보낸 메세지는 오른쪽, 아닌 메세지는 왼쪽으로 정렬 --%>
				<table>
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
				<button id="addBtn"><i class="material-icons">add</i></button>
					<ul style="display: none;">
						<li><img alt="사진아이콘" src="">사진보내기</li>
						<li><img alt="지도아이콘" src="">지도보내기</li>
						<li><img alt="약속아이콘" src="">약속보내기</li>
						<li><img alt="송금아이콘" src="">송금보내기</li>
						<li><img alt="위치아이콘" src="">나의 위치</li>
					</ul>
				<input type="text" id="inputText" placeholder="메세지를 입력하세요">
				<button class="submitBtn">
					<i class="material-icons">subdirectory_arrow_left</i>
				</button>
				
			</article>
		</section>
	</div>
	
	<!-- footer -->
	<footer>
		<div>여기 footer</div>
	</footer>
</body>
</html>