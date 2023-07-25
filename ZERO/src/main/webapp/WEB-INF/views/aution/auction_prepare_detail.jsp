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

<meta charset="UTF-8">
<title> ZERO | 경매예정상세 </title>
<style type="text/css">

	
	

	@media only screen and (min-width: 768px) {
		body{
		margin-top: 86px;
		
	}
	#slid{
		overflow: hidden;
		position: relative;
		max-height: 380px;
		max-width: 1000px;
		margin:auto;
	}
	
	#slid #carouselExampleIndicators{
		max-height: inherit;
	}
	
	img {
      display: block;
   	  
   	  margin: auto;
      max-height: 380px;
      max-width: 1000px;
      
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
		<div class="col-md-6"><h2>제목</h2></div>
			<div id="slid">
			<div id="carouselExampleIndicators" class="carousel slide-fluid" data-ride="carousel"  data-interval="false">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg"  class="d-block w-100"alt="...">
					</div> 
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath }/resources/img/슬라이드2.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath }/resources/img/슬라이드3.jpg" class="d-block w-100" alt="...">
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
		</div>
	</section>
	
	<!-- footer -->
	<footer>
		
	</footer>
</body>
</html>