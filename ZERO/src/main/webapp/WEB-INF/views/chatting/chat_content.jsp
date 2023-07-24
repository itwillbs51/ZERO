<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<section>
	<%-- 위에 상품정보와 약속잡기, 송금하기 등이 있는 영역 --%>
	<article>
		<div class="art_firstRow">
			<div class="product_photo">
				<img alt="상품사진" src="">
			</div>
			<div>
				<p>
					<span>판매상태(판매중, 판매완료)</span>
					<span>상품명</span>
				</p>
			</div>
			<div>
				<img alt="신고하기아이콘" src=""> 신고하기
			</div>
		</div>
		<div class="art_secondRow">
			<div>
				<button><img alt="약속아이콘">약속잡기</button>
				<button><img alt="송금아이콘">송금하기</button>
				<%-- 판매자의 경우 거래하기 아이콘버튼 넣기 --%>
				<button><img alt="거래아이콘">거래하기</button>
			</div>
		</div>
	</article>
	
	<%-- 채팅창 영역 --%>
	<article>
		<%-- 나오는 채팅만큼 보여주고 위로 무한스크롤? --%>
		<div><span>오후1:37</span>안녕하세요</div>
		<div><span>오후1:52</span>안녕하세요~</div>
	</article>
	
	<%-- 채팅 입력 영역 --%>
	<article>
		<button>+</button>
			<ul style="display: none;">
				<li><img alt="사진아이콘" src="">사진보내기</li>
				<li><img alt="지도아이콘" src="">지도보내기</li>
				<li><img alt="약속아이콘" src="">약속보내기</li>
				<li><img alt="송금아이콘" src="">송금보내기</li>
				<li><img alt="위치아이콘" src="">나의 위치</li>
			</ul>
		<input type="text" placeholder="메세지를 입력하세요">
		<button><img alt="전송아이콘" src=""></button>
		
	</article>
</section>