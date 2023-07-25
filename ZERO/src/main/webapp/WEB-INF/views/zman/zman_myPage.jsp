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

</script>
</head>
<body>
	<%-- 헤더 영역 --%>
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
		
	<article id="mainArticle">
		<div class="container">
			<%-- 사이드 바 영역 --%>
			<nav id="mainNav" class="sidebarArea d-none d-md-block sidebar">
				<jsp:include page="/WEB-INF/views/inc/zman_sidebar.jsp"></jsp:include>
			</nav>
			<div class="container-fluid">
				<div class="contentArea">
					<div id="main">
						<%-- ZMAN 마이페이지 --%>
						<%-- 개인정보와 배달정보를 분리해서 나타내기 --%>
						<h1> 마이페이지 </h1>
						<form class="row g-3">
							<%-- 12 --%>
						    <div class="col-md-4">
						   		<label for="inputAddress" class="form-label">ZMAN 번호</label>
						    	<input type="zman_name" class="form-control" id="inputZmanName" disabled="disabled" value="ZMAN.zman_idx">
						    </div>
						    <div class="col-md-4">
						   		<label for="inputAddress" class="form-label">ZMAN 활동 상태</label>
						    	<input type="zman_name" class="form-control" id="inputZmanName" disabled="disabled" value="ZMAN.zman_status">
						     </div>
						    <div class="col-md-4">
						    	<%-- 탈퇴한 회원이라면 탈퇴한 날짜 --%>
						   		<label for="inputAddress" class="form-label">가입일</label>
						    	<input type="zman_id" class="form-control" id="inputZmanId" disabled="disabled" value="ZMAN.zman_date">
						     </div>
						     <%-- 12 --%>
							 <div class="col-md-4">
								<label for="inputEmail4" class="form-label">이름</label>
								<input type="zman_name" class="form-control" id="inputZmanName" disabled="disabled" value="김둘리">
							 </div>
						     <div class="col-md-4">
						    	<label for="inputPassword4" class="form-label">아이디</label>
						    	<input type="zman_id" class="form-control" id="inputZmanId" disabled="disabled" value="dooly0725@naver.com">
						     </div>
						     <div class="col-md-4">
						    	<label for="inputPassword4" class="form-label">배달수단</label>
						    	<input type="zman_id" class="form-control" id="inputZmanId" disabled="disabled" value="차량 - 01가1111 또는 도보">
						     </div>
						     <%-- 12 --%>
	  						 <div class="col-12">
						    	<label for="inputCity" class="form-label">ZMAN 주소</label>
						   		<input type="text" class="form-control" id="inputCity">
						  	 </div>
	  						 <%-- 12 --%>
	  						 <div class="col-12">
						    	<label for="inputCity" class="form-label">활동 지역</label>
						   		<input type="text" class="form-control" id="inputCity">
						  	 </div>
						     <%-- 12 --%>
							 <div class="col-md-6">
								<label for="inputEmail4" class="form-label">은행명</label>
								<input type="zman_name" class="form-control" id="inputZmanName" disabled="disabled" value="산업은행">
							 </div>
						     <div class="col-md-6">
						    	<label for="inputPassword4" class="form-label">계좌번호</label>
						    	<input type="zman_id" class="form-control" id="inputZmanId" disabled="disabled" value="111-1111-1111-11">
						     </div>
						     <%-- 12 --%>
	  						 <div class="col-md-6">
	    						<label for="inputAddress2" class="form-label">휴대폰</label>
	    						<input type="zman_name" class="form-control" id="inputZmanName" disabled="disabled" value="010-1234-5678">
	  						 </div>
	  						 <div class="col-md-6">
	    						<label for="inputAddress2" class="form-label">&nbsp;</label>
	    						<input type="zman_name" class="form-control" id="inputZmanName" disabled="disabled" value="휴대폰 번호 변경하기">
	  						 </div>
	  						 <%-- 12 --%>
	  						 <div class="col-12">
						    	<label for="inputCity" class="form-label">ZMAN 주소</label>
						   		<input type="text" class="form-control" id="inputCity">
						  	 </div>
	  						 <%-- 12 --%>
	  						 <div class="col-12">
						    	<label for="inputCity" class="form-label">활동 지역</label>
						   		<input type="text" class="form-control" id="inputCity">
						  	 </div>
						  	 <%-- 12 --%>
	  						 <div class="col-12">
	    					 	<div class="form-check">
	      							<input class="form-check-input" type="checkbox" id="gridCheck">
	      							<label class="form-check-label" for="gridCheck">
	        							Check me out
		      						</label>
	    						</div>
	  						 </div>
	  						 <div class="col-12">
	    						<button type="submit" class="btn btn-primary">Sign in</button>
	  						 </div>
					</form>
					
					</div> <%-- <div id="main">  --%>
				</div>
			</div>
		</div>
	</article>
</body>
</body>
</html>