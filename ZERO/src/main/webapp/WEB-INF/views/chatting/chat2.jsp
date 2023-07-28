<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- 							<tr> -->
<!-- 								<td class="msgRight"> -->
<!-- 									<div class="msgTime">오후1:37</div> -->
<!-- 									<div class="msg">안녕하세요</div> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td class="msgLeft"> -->
<!-- 									<div class="msg">안녕하세요~</div> -->
<!-- 									<div class="msgTime">오후1:52</div> -->
<!-- 								</td> -->
<!-- 							</tr> -->
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
	
