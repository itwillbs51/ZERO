<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 부트스트랩 사용 --%>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<link href="${pageContext.request.contextPath }/resources/css/header.css" rel="stylesheet" type="text/css">
<nav class="navbar navbar-expand-md fixed-top navbar-light p-0">
	<div id="logo">
		<a href="./">ZERO</a>
	</div>
	<button id="navToggle" class="navbar-toggler collapsed border-0" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		<div id="headerArea1">
			<div id="headerArea1_inner">
				<ul id="headerArea1_list">
					<li class="headerArea1_item"><a href="cs_main" class="headerArea1_link">고객센터</a></li>
					<li class="headerArea1_item"><a href="member_mypage_main" class="headerArea1_link">마이페이지</a></li>
					<li class="headerArea1_item"><a href="#" class="headerArea1_link">관심상품</a></li>
					<li class="headerArea1_item"><a href="#" class="headerArea1_link">알림</a></li>
					<%-- 알림 임시 --%>
<!-- 					<div class="dropdown"> -->
<!-- 						<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 							알림 -->
<!-- 						</a> -->
<!-- 						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink"> -->
<!-- 							<a class="dropdown-item" href="#">Action</a> -->
<!-- 							<a class="dropdown-item" href="#">Another action</a> -->
<!-- 							<a class="dropdown-item" href="#">Something else here</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
					<%-- 채팅 임시 --%>
					<li class="headerArea1_item"><a href="chat" class="headerArea1_link">채팅</a></li>
					<li class="headerArea1_item"><a href="member_login" class="headerArea1_link">로그인</a></li>
					<li class="headerArea1_item"><a href="zman_main" class="headerArea1_link">ZMAN</a></li>
					<li class="headerArea1_item"><a href="admin_main" class="headerArea1_link">관리자</a></li>
				</ul>
			</div>
		</div>
		<div id="headerArea2">
			<div id="headerArea2_inner">
				<ul class="navbar-nav ml-auto mr-2 mt-2 mt-md-0">
					<li class="nav-item">
						<a class="nav-link" href="./">Home <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="secondhand_list">중고거래</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="autionList_present">경매</a>
					</li>
				</ul>
				<form class="form-inline my-2 my-md-0">
					<input class="form-control form-control-sm mr-2 mr-sm-2" type="search" placeholder="Search">
					<button class="btn btn-sm btn-outline-dark my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</div>
	</div>
</nav>

