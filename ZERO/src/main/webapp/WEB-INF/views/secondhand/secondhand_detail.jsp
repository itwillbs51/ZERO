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

let slideIndex = 1;//슬라이드인덱스 기본값 1
showSlides(slideIndex);


function currentSlide(n) {
  showSlides(slideIndex = n);
}
function showSlides(n) {
	let i;
	let slides = document.getElementsByClassName("mySlides");
	let dots = document.getElementsByClassName("democursor");

	
	if (n > slides.length) {
		  slideIndex = 1
	}
	
	if (n < 1) {
		slideIndex = slides.length//인덱스 1보다 작을경우 슬라이드크기(최대치) 대입
	}
	
	for (i = 0; i < slides.length; i++) {
    	slides[i].style.display = "none";//
	}
	
	for (i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" active", "");
	}
	
	slides[slideIndex-1].style.display = "block";
	dots[slideIndex-1].className += " active";
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

/* Hide the images by default */
.mySlides {
  	display: none;
	margin-bottom:5px;
  
}
/* /* Add a pointer when hovering over the thumbnail images */ */
/* .cursor { */
/*   cursor: pointer; */
/* } */
/* Clear floats after the columns */
.row {
	display: flex;
}
.row:after {
  content: "";
  display: table;
  clear: both;
}


/* Create two equal columns that floats next to each other */
.column {
  float: left;
  width: 50%;
  padding: 10px;

}
.sumnail {
	float:left;
	margin-left:15px;
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
}
.icon {
	margin-left:450px;

}
/* 조회수 */
.readcount {
	margin-right:100px;
	color:gray;
}
/* 등록일 */
.registDate{
	color:gray;
	
}
/* 거래 상태 변경 셀렉트박스 */
.changeDealStatus {
	margin-left:40px;
	 
}
</style>
</head>
<body>
	<header><%@ include file="../inc/header.jsp"%></header>
	
	<article id="mainArticle">
		<div class="container">
		<hr>
		<%-- 큰이미지 --%>	
		<div class="row" style="margin-top:20px;">
			<div class="column">
			
<!-- 				<div class="mySlides"> -->
<%-- 				  <img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" style="width:450px; height:450px;"> --%>
<!-- 				</div> -->
				
<!-- 				<div class="mySlides"> -->
<%-- 				 	<img src="${pageContext.request.contextPath }/resources/img/슬라이드2.jpg" style="width:450px; height:450px;"> --%>
<!-- 				</div> -->
		
<!-- 				<div class="mySlides"> -->
<%-- 					 <img src="${pageContext.request.contextPath }/resources/img/슬라이드3.jpg" style="width:450px; height:450px;"> --%>
<!-- 				 </div> -->
		    
<!-- 				<div class="mySlides"> -->
<%-- 		   			<img src="${pageContext.request.contextPath }/resources/img/중고상품1.jpg" style="width:450px; height:450px;"> --%>
<!-- 				</div> -->
					
<!-- 				 썸네일이미지 -->
<!-- 				 <div class="row"> -->
<%-- 				  <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" style="width:100px; height:80px;" onclick="currentSlide(1)" ></span> --%>
<%-- 				  <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/슬라이드2.jpg" style="width:100px; height:80px;" onclick="currentSlide(2)" ></span> --%>
<%-- 				  <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/슬라이드3.jpg" style="width:100px; height:80px;" onclick="currentSlide(3)" ></span> --%>
<%-- 				  <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/중고상품1.jpg"  style="width:100px; height:80px;" onclick="currentSlide(4)"></span> --%>
<!-- 				</div> -->

				<div id="slid">
						<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="${pageContext.request.contextPath }/resources/upload/${secondhandProduct.secondhand_image1}" class="card-img-top" >
								</div>
								<div class="carousel-item">
									<img src="${pageContext.request.contextPath }/resources/upload/${secondhandProduct.secondhand_image2}" class="card-img-top" >
								</div>
								<div class="carousel-item">
									<img src="${pageContext.request.contextPath }/resources/upload/${secondhandProduct.secondhand_image3}" class="card-img-top" >
								</div>
							</div>
							<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>


					
			</div><%-- 1행 1열 -- 왼쪽 column끝 --%>
			
		
			
			<%--1행 2열 -- 오른쪽 column 추가하기 --%>
			<div class="column">
				<!-- 거래상태 -->
				<button class="btn btn-dark" style="margine-bottom:10px;">${secondhandProduct.secondhand_deal_status }</button>
				<span class="icon">
					<a href="reportPopup"><img src="${pageContext.request.contextPath }/resources/img/report_icon.png" width="30px" height="30px"></a>
					<a href="#"><img src="${pageContext.request.contextPath }/resources/img/share_icon.png" width="30px" height="30px"></a>
				</span>
					
				<h3>${secondhandProduct.secondhand_subject }</h3>
				<h5>${secondhandProduct.secondhand_price }<b>원</b></h5>
				<span class="readcount">조회수 ${secondhandProduct.secondhand_read_count } </span>
				<span class="registDate">등록일 ${secondhandProduct.secondhand_first_date }</span>
				<hr>
				<p>${secondhandProduct.secondhand_content }</p>
				<br>
				<%-- 
					sessionId 일치하는경우 (작성자 본인일경우 -> 수정하기, 삭제하기 버튼 보여줌
					sessionId 일치하지 않는경우 or 없는경우 : 채팅하기 버튼 보여줌
					=> 없는경우 채팅버튼 누를경우 : 로그인알람창 -> 로그인페이지 이동
				--%>
				
				<%-- 판매자본인일경우 - 수정하기 / 삭제하기 버튼 활성화 --%>
				<a href="#"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="40px" height="40px"></a>
				<button class="btn btn-primary btn-lg" style="font-size:1em; margin:10px 10px" onclick="location.href='secondhandModifyForm'"> 수정하기 </button>
				<button class="btn btn-primary btn-lg" style="font-size:1em; margin:10px 10px""onclick="location.href='secondhandDelete'"> 삭제하기 </button>
<!-- 				<button class="btn btn-primary btn-lg" style="font-size:1em;"onclick="location.href='secondhandUpdateDate'"> 끌어올리기</button><br><br> -->
				<%-- 판매자본인일경우 -  셀렉트박스로 거래상태변경가능 --%>
				<select class="changeDealStatus" aria-label="Default select example">
				  <option selected> 거래중 </option>
				  <option value="1"> 거래완료 </option>
				  <option value="2"> 끌어올리기 </option>
				</select>
				<hr>
				
				<%-- 판매자 본인 아닐경우 --%>		
				<a href="#"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="40px" height="40px"></a>
<!-- 				<button class="btn btn-primary btn-lg" style="font-size:1em; margin:10px 10px"> 채팅하기 </button> -->
				<form action="doChat" method="POST">
					<input type="hidden" value="${secondhandProduct.member_id }" name="seller_id">
					<input type="hidden" value="${secondhandProduct.secondhand_idx }" name="secondhand_idx">
					<input type="submit" class="btn btn-primary btn-lg" style="font-size:1em; margin:10px 10px" value="채팅하기">
				</form>
		
			</div><%-- 오른쪽 column끝 --%>
			<hr>
		</div><%-- 첫번째 row끝 ----%>
		
		<%-- 두번째 row 시작 --%>

		<div class="row" style="margin-top:30px;">
			
			<%-- 2행 1열 (카테고리 결제방법 거래방법) --%>
			<hr>
			<hr>
			<div class="column" >
				<hr>
					<b>카테고리</b> <button class="btn btn-light" style="align:left;">유아동/유아패션/장난감/도서</button><br>
					<b>거래방법</b> <button class="btn btn-light" > Z스테이션 </button> <button class="btn btn-light" > 직거래</button> <button class="btn btn-light" > 택배거래</button><br>
					<b>결제방법</b> <button class="btn btn-light" > Z페이 </button><br><br>
			</div>
			
			<%-- 2행 2열 (판매자정보) --%>
			<div class="column">
			<hr>
				<%-- 판매자 프로필, 닉네임, 판매상품수 --%>
				<div class="row">
					<div class="column">
						<img src="${pageContext.request.contextPath }/resources/img/profile.png" width="120px" height="120px" style="border-radius:50%">
					 </div>
					 <div class="column">
						<b><a href="secondhandSeller"> 김커피입니다</a></b>
					 	<br>판매상품 nn개
					 </div>
				</div>
				
				<%-- 판매자의 판매중 다른상품정보 --%>
				<br>
				<div class="row" style="margin-left:10px; margin-bottom:10px;">
					<b>김커피입니다</b> 님의 판매중인 상품 ... <a href="secondhandSeller">더보기</a>
				</div>
				 <%--썸네일이미지 --%>
				  <div class="row">
				    <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" style="width:100px; height:150px;" ></span>
				    <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/슬라이드2.jpg" style="width:100px; height:150px;" ></span>
				    <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/슬라이드3.jpg" style="width:100px; height:150px;" ></span>
				    <span class="sumnail"><img class="democursor" src="${pageContext.request.contextPath }/resources/img/중고상품1.jpg"  style="width:100px; height:150px;"></span>
				  </div>
				
			</div>
		</div>
		

			

		</div> <%--container 끝 --%>
	</article>
<footer></footer>
</body>

</html>