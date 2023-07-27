<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title> ZERO | 경매예정상세 </title>
<style type="text/css">

	#center{
		
		position: relative;
		max-height: 300px;
		max-width: 500px;
		margin:auto;
	}
	
	#center #carouselExampleIndicators{
		max-height: inherit;
	}
	
	img {
      display: block;
   	  
   	  margin: auto;
      max-height: 300px;
      max-width: 500px;
      
    } 
	
	.column {
  float: left;
  width: 50%;
  padding: 10px;

}
	

	@media only screen and (min-width: 768px) {
		body{
		margin-top: 86px!important;
		
	}
	#center{
		
		
		max-height: 380px;
		max-width: 1000px;
		
	}
	
	#center #carouselExampleIndicators{
		max-height: inherit;
	}
	
	img {
    
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
		
			<div class="d-flex justify-content-center"><h2>조던 1 x 트래비스 스캇 x 프라그먼트 레트로 로우 OG SP 밀리터리 블루</h2></div>
			
			
				<!-- 물품 이미지  -->
				<div id="center">
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
				
				<div class=row>
					<div class="col-6 col-md-6">
						<br>
						<h2 style="display:inline;">경매 시작 가격</h2>100,000원
						<br><br>
						<h2 style="display:inline;">즉시 구매 가격</h2>15,0000원
					</div>
					<div class="row col-6 col-md-6">
						<div class="column">
							<img src="${pageContext.request.contextPath }/resources/img/profile.png" width="120px" height="120px" style="border-radius:50%">
						 </div>
						 <div class="column">
							<b><a href=""> 판매자</a></b>
						 	<br>판매상품 n개
						 </div>
					</div>
				</div>
				<div>
					<br><br>
					<h3>상세정보</h3>
					<hr>
					뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는
					있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고
					찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과
					
				</div>
				
				<br>
				<div class="d-flex justify-content-center">
				<h3>참가자 12/10</h3>
				</div>
				<div class="d-flex justify-content-center">
				<button type="button" class="btn btn-light">참가신청</button>
				<button type="button" class="btn btn-dark">돌아가기</button>
				</div>
				<br><br><br><br><br><br>
			</div>
			
		
		</div>
	</section>
	
	<!-- footer -->
	<footer>
		
	</footer>
</body>
</html>