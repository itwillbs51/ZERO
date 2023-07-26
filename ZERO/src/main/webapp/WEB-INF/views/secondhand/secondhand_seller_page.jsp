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
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/defualt.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<%-- 반응형웹페이지위한 설정 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ZERO</title>

<script type="text/javascript">


function openTab(evt, dealStatus) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  
	  tablinks = document.getElementsByClassName("tablinks");
	  
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  
	  document.getElementById(dealStatus).style.display = "block";
	  evt.currentTarget.className += " active";
	  
	}
</script>


<style>
article {
	margin-top: 150px;
}
a {
	color:black;
}
.container {
  position: relative;
  margin-top: 100px;
}
body {font-family: Arial;}

/* 카드이미지 위에 거래상태 버튼 css */
.photoDiv {
	position: relative;
}
.dealStatus{
		font-size: 0.9rem;
		position: absolute;
		top: 136px;
		right: 0px;
/* 		border: 3px double gray;  */
		border-radius: 50%
}

.card-text{
	text-align: left;
	margin-top: 5px;
}


/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
h3, h5, button {
	margin-bottom:20px;
} 
</style>
</head>
<body>
<header><%@ include file="../inc/header.jsp"%></header>

<article id="mainArticle">
	<div class="container">
		<div class="row row-cols-2">
			<!-- 왼쪽섹션 - 회원프로필 -->
			<div class="col-3">
					<img src="${pageContext.request.contextPath }/resources/img/profile.png" width="120px" height="120px" style="margin:20px;">
					<h3><a href="secondhandSeller"> 김커피입니다</a></h3>
					<button class="btn btn-primary btn-lg" style="font-size:1em;" > 채팅하기 </button>
					<h5> 부산 진구 부전동(주소) </h5>
					<p>판매상품 nn개</p>
			</div>
			
			
			<!-- 오른쪽섹션  -->
			<div class="col-9">
				<div class="tab">
				  <button class="tablinks" onclick="openTab(event, 'dealingTab')">거래 중 상품</button>
				  <button class="tablinks" onclick="openTab(event, 'dealEndTab')">거래 완료 상품</button>
				  <button class="tablinks" onclick="openTab(event, 'reviewTab')">받은 후기</button>
				</div>
				<div id="dealingTab" class="tabcontent">
					<p> 거래중 상품 nn개 </p>
					
						<div class="row row-cols-1 row-cols-md-3 g-4">
						  <div class="col">
						    <div class="card h-100">
						    	<div class="photoDiv">
									<a href="secondhand_detail">
										<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." >
									</a>
									<span class="dealStatus"><button>거래중</button></span>
								</div>
						      <div class="card-body">
						        <h5 class="card-title">
						        	<button class="btn btn-light" style="margin-top:10px">패션/잡화/의류/뷰티</button>
						        	<a href="#" style="margin-left:5px; margin-bottom:50px;"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="25px" height="30px"></a>
						        	<a href="#"> 제목 입니다 <br></a> 
						        </h5>
						        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
						      </div>
						    </div>
						  </div>
						  
						  <div class="col">
						    <div class="card h-100">
						    	<div class="photoDiv">
									<a href="secondhand_detail">
										<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." >
									</a>
									<span class="dealStatus"><button>거래중</button></span>
								</div>
						      <div class="card-body">
						        <h5 class="card-title">
						        	<button class="btn btn-light" style="margin-top:10px">패션/잡화/의류/뷰티</button>
						        	<a href="#" style="margin-left:5px; margin-bottom:50px;"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="25px" height="30px"></a>
						        	<a href="#"> 제목 입니다 <br></a> 
						        </h5>
						        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
						      </div>
						    </div>
						  </div>
						  
						  <div class="col">
						    <div class="card h-100">
						    	<div class="photoDiv">
									<a href="secondhand_detail">
										<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." >
									</a>
									<span class="dealStatus"><button>거래중</button></span>
								</div>
						      <div class="card-body">
						        <h5 class="card-title">
						        	<button class="btn btn-light" style="margin-top:10px">패션/잡화/의류/뷰티</button>
						        	<a href="#" style="margin-left:5px; margin-bottom:50px;"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="25px" height="30px"></a>
						        	<a href="#"> 제목 입니다 <br></a> 
						        </h5>
						        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
						      </div>
						    </div>
						  </div>
						  
						  <div class="col">
						    <div class="card h-100">
						    	<div class="photoDiv">
									<a href="secondhand_detail">
										<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." >
									</a>
									<span class="dealStatus"><button>거래중</button></span>
								</div>
						      <div class="card-body">
						        <h5 class="card-title">
						        	<button class="btn btn-light" style="margin-top:10px">패션/잡화/의류/뷰티</button>
						        	<a href="#" style="margin-left:5px; margin-bottom:50px;"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="25px" height="30px"></a>
						        	<a href="#"> 제목 입니다 <br></a> 
						        </h5>
						        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
						      </div>
						    </div>
						  </div>
						</div>
					</div><%-- 거래중 상품(dealingTab) 끝 --%>
				
				
				<div id="dealEndTab" class="tabcontent">
					<p>거래 완료상품 nn 개</p>
						<div class="row row-cols-1 row-cols-md-3 g-4">
						  <div class="col">
						    <div class="card h-100">
						    	<div class="photoDiv">
									<a href="secondhand_detail">
										<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." >
									</a>
									<span class="dealStatus"><button>거래완료</button></span>
								</div>
						      <div class="card-body">
						        <h5 class="card-title">
						        	<button class="btn btn-light" style="margin-top:10px">패션/잡화/의류/뷰티</button>
						        	<a href="#" style="margin-left:5px; margin-bottom:50px;"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="25px" height="30px"></a>
						        	<a href="#"> 제목 입니다 <br></a> 
						        </h5>
						        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
						      </div>
						    </div>
						  </div>
						  
						  <div class="col">
						    <div class="card h-100">
						    	<div class="photoDiv">
									<a href="secondhand_detail">
										<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." >
									</a>
									<span class="dealStatus"><button>거래완료</button></span>
								</div>
						      <div class="card-body">
						        <h5 class="card-title">
						        	<button class="btn btn-light" style="margin-top:10px">패션/잡화/의류/뷰티</button>
						        	<a href="#" style="margin-left:5px; margin-bottom:50px;"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="25px" height="30px"></a>
						        	<a href="#"> 제목 입니다 <br></a> 
						        </h5>
						        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
						      </div>
						    </div>
						  </div>
						  
						  <div class="col">
						    <div class="card h-100">
						    	<div class="photoDiv">
									<a href="secondhand_detail">
										<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." >
									</a>
									<span class="dealStatus"><button>거래완료</button></span>
								</div>
						      <div class="card-body">
						        <h5 class="card-title">
						        	<button class="btn btn-light" style="margin-top:10px">패션/잡화/의류/뷰티</button>
						        	<a href="#" style="margin-left:5px; margin-bottom:50px;"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="25px" height="30px"></a>
						        	<a href="#"> 제목 입니다 <br></a> 
						        </h5>
						        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
						      </div>
						    </div>
						  </div>
						  
						  <div class="col">
						    <div class="card h-100">
						    	<div class="photoDiv">
									<a href="secondhand_detail">
										<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." >
									</a>
									<span class="dealStatus"><button>거래완료</button></span>
								</div>
						      <div class="card-body">
						        <h5 class="card-title">
						        	<button class="btn btn-light" style="margin-top:10px">패션/잡화/의류/뷰티</button>
						        	<a href="#" style="margin-left:5px; margin-bottom:50px;"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="25px" height="30px"></a>
						        	<a href="#"> 제목 입니다 <br></a> 
						        </h5>
						        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
						      </div>
						    </div>
						  </div>
						</div>
					
					
				</div><%-- 거래완료상품(dealEndTab) 끝 --%>
				
				<div id="reviewTab" class="tabcontent">
					<p>전체 후기 nn 개</p>
						
					<div class = "row">
						<div class = "col-2">
							<img src="${pageContext.request.contextPath }/resources/img/profile.png" width="50px" height="50px" style="margin:20px;">
						</div>
						<div class = "col-10" style="margin-top:20px;">
							<p> 닉네임 </p>
							<p> 리뷰내용</p>
							<hr>
						</div>
					</div>

					<div class = "row">
						<div class = "col-2">
							<img src="${pageContext.request.contextPath }/resources/img/profile.png" width="50px" height="50px" style="margin:20px;">
						</div>
						<div class = "col-10" style="margin-top:20px;">
							<p> 닉네임 </p>
							<p> 리뷰내용</p>
							<hr>
						</div>
					</div>
					
					<div class = "row">
						<div class = "col-2">
							<img src="${pageContext.request.contextPath }/resources/img/profile.png" width="50px" height="50px" style="margin:20px;">
						</div>
						<div class = "col-10" style="margin-top:20px;">
							<p> 닉네임 </p>
							<p> 리뷰내용</p>
							<hr>
						</div>
					</div>
					
					<div class = "row">
						<div class = "col-2">
							<img src="${pageContext.request.contextPath }/resources/img/profile.png" width="50px" height="50px" style="margin:20px;">
						</div>
						<div class = "col-10" style="margin-top:20px;">
							<p> 닉네임 </p>
							<p> 리뷰내용</p>
							<hr>
						</div>
					</div>

					
				</div>		
			</div><!--grid나누기위한컬럼-->
	
			
			
		</div><%--레이아웃 row 끝 --%>
	</div><%--conatiner끝 --%>
</article>
	
	
</body>
</html>