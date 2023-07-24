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

let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
	let i;
	let slides = document.getElementsByClassName("mySlides");
	let dots = document.getElementsByClassName("demo");
	let captionText = document.getElementById("caption");
	
	if (n > slides.length) {
		  slideIndex = 1
	}
	
	if (n < 1) {
		slideIndex = slides.length
	}
	
	for (i = 0; i < slides.length; i++) {
    	slides[i].style.display = "none";
	}
	
	for (i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" active", "");
	}
	
	slides[slideIndex-1].style.display = "block";
	dots[slideIndex-1].className += " active";
	captionText.innerHTML = dots[slideIndex-1].alt;
}

</script>
<style>
#mainArticle {
	margin-top: 30px;
}
a {
	color:black;

}




/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
  padding-left:5px;
}
/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 15px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 15px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}
/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
.row {
	display: flex;
}

/* Create two equal columns that floats next to each other */
.column {
  float: left;
  width: 50%;
  padding: 10px;
  height: 300px; /* Should be removed. Only for demonstration */
}
.sumnail {
	float:left;
}
/* .column { */
/*   flex: 50%; */
/*   padding-left: 80px; */
/* } */

/* Add a transparency effect for thumnbail images */
.democursor {
  opacity: 0.6;
}
.active,
.democursor:hover {
  opacity: 1;



</style>
</head>
<body>


	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	

	<article id="mainArticle">
		<div class="container">
			<br><br><br><br><br>
			<hr>
		<%-- 큰이미지 --%>	
		<div class="row">
			<div class="column">
			
				<div class="mySlides">
				  <div class="numbertext active">1 / 4</div>
				  <img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" style="width:400px; height:300px;">
				</div>
				<div class="mySlides">
				  	<div class="numbertext">2 / 4</div>
				 	<img src="${pageContext.request.contextPath }/resources/img/슬라이드2.jpg" style="width:400px; height:300px;">
				</div>
		
				<div class="mySlides">
				 	 <div class="numbertext">3 / 4</div>
					 <img src="${pageContext.request.contextPath }/resources/img/슬라이드3.jpg" style="width:400px; height:300px;">
				 </div>
		    
				<div class="mySlides">
				  	<div class="numbertext">4 / 4</div>
		   			<img src="${pageContext.request.contextPath }/resources/img/중고상품1.jpg" style="width:400px; height:300px;">
				</div>
				
				  
				  <%--썸네일이미지 --%>
				  <div class="row">
				    <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" style="width:100px; height:150px;" onclick="currentSlide(1)" alt="The Woods"></span>
				    <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/슬라이드2.jpg" style="width:100px; height:150px;" onclick="currentSlide(2)" alt="Cinque Terre"></span>
				    <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/슬라이드3.jpg" style="width:100px; height:150px;" onclick="currentSlide(3)" alt="Mountains and fjords"></span>
				    <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/중고상품1.jpg"  style="width:100px; height:150px;" onclick="currentSlide(4)" alt="Northern Lights"></span>
				  </div>
				  
			</div><%-- 1행 1열 -- 왼쪽 column끝 --%>
			
		
			
			<%--1행 2열 -- 오른쪽 column 추가하기 --%>
			<div class="column">

					<br>
					<button class="btn btn-dark" style="align:left;">거래중</button><br><br>
					
					<h5>제목입니다</h5>
					<span>조회수 125485 </span><span>등록일 2023-09-20 11:00</span>
					<hr>
					<p>예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도 창공에 반짝이는 뭇 별과 같이 산야에 피어나는 군영과 같이 이상은 실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은</p>

					<%-- 
						sessionId 일치하는경우 (작성자 본인일경우 -> 수정하기, 삭제하기 버튼 보여줌
						sessionId 일치하지 않는경우 or 없는경우 : 채팅하기 버튼 보여줌
						=> 없는경우 채팅버튼 누를경우 : 로그인알람창 -> 로그인페이지 이동
					--%>
		
						<a href="#"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="40px" height="40px"></a>
						<button class="btn btn-primary btn-lg" style="font-size:1em; margin:10px 10px"> 수정하기 </button>
						<button class="btn btn-primary btn-lg" style="font-size:1em;"> 삭제하기 </button><br><br>
						
						<a href="#"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="40px" height="40px"></a>
						<button class="btn btn-primary btn-lg" style="font-size:1em; margin:10px 10px"> 채팅하기 </button>
		
			</div><%-- 오른쪽 column끝 --%>
			
		</div><%-- 첫번째 row끝 ----%>
		
		<%-- 두번째 row 시작 --%>
		<div class="row" style="margin-top:300px;">
			<%-- 2행 1열 (카테고리 결제방법 거래방법) --%>
			<hr>
			<hr>
			<div class="column">
					
					<b>카테고리</b> <button class="btn btn-light" style="align:left;">유아동/유아패션/장난감/도서</button><br>
					<b>거래방법</b> <button class="btn btn-light" > Z스테이션 </button> <button class="btn btn-light" > 직거래</button> <button class="btn btn-light" > 택배거래</button><br>
					<b>결제방법</b> <button class="btn btn-light" > Z페이 </button><br><br>
			</div>
			
			<%-- 2행 2열 (판매자정보) --%>
			<div class="column">
				<%-- 판매자 프로필, 닉네임, 판매상품수 --%>
				<div class="row">
					<div class="column">
						<img src="${pageContext.request.contextPath }/resources/img/profile.png" width="120px" height="120px" style="border-radius:50%">
					 </div>
					 <div class="column">
						<b><a href="#"> 김커피입니다</a></b>
					 	<br>판매상품 nn개
					 </div>
					 
					<%-- 판매자의 판매중 다른상품정보 --%>
					<br>
						<div class="column">
							<b>김커피입니다</b> 님의 판매중인 상품 ... <a href="#">더보기</a>
						</div>
				</div>
				
				 <%--썸네일이미지 --%>
				  <div class="row">
				    <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" style="width:100px; height:150px;" onclick="currentSlide(1)" alt="The Woods"></span>
				    <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/슬라이드2.jpg" style="width:100px; height:150px;" onclick="currentSlide(2)" alt="Cinque Terre"></span>
				    <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/슬라이드3.jpg" style="width:100px; height:150px;" onclick="currentSlide(3)" alt="Mountains and fjords"></span>
				    <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/중고상품1.jpg"  style="width:100px; height:150px;" onclick="currentSlide(4)" alt="Northern Lights"></span>
				  </div>
				
			</div>
		</div>
		
			

		
	
		
		
		
		
		
		
			

			

		</div><%--container 끝 --%>
	</article>
	<footer></footer>
</body>

</html>