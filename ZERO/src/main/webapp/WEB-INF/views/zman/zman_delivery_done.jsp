<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#user_membership {
		margin: 25px;
	}
</style>
<script>
  $(function(){
    $('.datepicker').datepicker();
  })
</script>
</head>
<body>
	<%-- 헤더 영역 --%>
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	
	<%-- 본문 영역 --%>
	<article id="mainArticle">
		<div class="container">
			<%-- 사이드 바 영역 --%>
			<nav id="mainNav" class="sidebarArea d-none d-md-block sidebar">
				<jsp:include page="/WEB-INF/views/inc/zman_sidebar.jsp"></jsp:include>
			</nav>
			
			<%-- 본문 내용 --%>
			<div class="container-fluid">
				<div class="contentArea">
					<div id="main">
						<h1> 완료</h1>
						
						<%--ZMAN 프로필 영역 --%>
						<section id="sec01">
							<div class="user_membership" data-v-32a5de90="" data-v-412d8616="">
								<div class="user_detail" data-v-32a5de90="">
									<div class="user_thumb01" data-v-32a5de90="">
										<br>
											<%-- 프로필 사진 --%>
											<img src="${pageContext.request.contextPath }/resources/mypage_img/blank_profile.4347742.png"
												 alt="사용자 이미지" class="thumb_img" data-v-32a5de90="">
											<%-- ZMAN 개인정보 --%>
											<strong class="name" data-v-32a5de90="">김둘리</strong> |
											<strong class="email" data-v-32a5de90="">Dooly@zero.co.kr</strong> |
											<strong class="phone" data-v-32a5de90="">010-1234-5678</strong>
									</div>
								</div>
							</div>
						</section>
				
						<%-- 배달 완료 목록 게시판 --%>
						<section id="sec02">
							<table class="table">
								<thead>
									<tr>
										<%-- 중고 거래 번호, 상품 이름, 배달 거리, 배달료  --%>
								        <th scope="col">중고거래 번호</th>
								        <th scope="col">상품이름</th>
								        <th scope="col">배달 거리</th>
								        <th scope="col">배달료</th>
								 	</tr>
								 </thead>
								 <tbody class="table-group-divider">
								 	<tr>
								         <th scope="row">1</th>
								         <td>텀블러</td>
								         <td>Otto</td>
								         <td>@mdo</td>
								     </tr>
							     	 <tr>
								         <th scope="row">2</th>
								         <td>맥북</td>
								         <td>Thornton</td>
								         <td>@fat</td>
								     </tr>
							    	 <tr>
								         <th scope="row">3</th>
								         <td>마우스</td>
								         <td>@twitter</td>
								         <td>@twitter</td>
								    </tr>
								</tbody>
							</table>
						</section>
						
						
					</div> <%-- <div id="main">  --%>
				</div> <%-- <div class="contentArea"> --%>
			</div> <%-- <div class="container-fluid"> --%>
		</div>
	</article>
</body>
</body>
</html>