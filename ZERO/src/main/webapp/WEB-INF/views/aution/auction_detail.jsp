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
<title> ZERO | 경매상세 </title>
<style type="text/css">

	#auction_log{
		overflow: auto; 
		width: 100%; 
		height: 200px; 
		padding: 10px; 
		border:1px solid;
		}
	#bid_price{
		width: 95px; 
	}
	

	@media only screen and (min-width: 768px) {
		body{
		margin-top: 86px;
		
	}
	
		#auction_log{
		height: 500px; 		
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
			<div class="row">
				<!-- 좌측 영역 -->
                <div class="col-md-4">
                	<div class="d-flex justify-content-center">
                		<h2>03 : 23 : 01</h2>
                	</div>
                		<div id="auction_log">
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                		<div>agaafs</div>
                	
                		</div>                	
                </div>
				<!--우측 영역 -->
                <div class="row col-md-8">
						<!-- 이미지  -->
                	 <div class="col-md-4 d-none d-md-block">
                	 	<img alt="조던" class="img-fluid" src="${pageContext.request.contextPath }/resources/img/p_e1ef5e002eda49adb7f5d0c8a41f798d.webp">
                	 </div>
						<!--상품명 -->								
                	 <div class="row col-md-8" style=" text-align: center;">  
                	               	 	
                	 	<h3>조던 1 x 트래비스 스캇 x 프라그먼트 레트로 로우 OG SP 밀리터리 블루</h3>
                	 	
                	 	<div class="col-6 col-md-3 d-none d-md-block"> 
                	 		<h4><b>경매날짜</b></h4>
                	 	</div>   
                	 	
                	 	<div class="col-6 col-md-9 d-none d-md-block">    
                	 		2023년 8월 2일~2023년 8월 3일
                	 	</div>
                	 	<div class="col-6 col-md-3"> 
                	 		<h4><b>현재가격</b></h4>
                	 	</div>   
                	 	
                	 	<div class="col-6 col-md-9">    
                	 		120,000원
                	 	</div>
                	 	<div class="col-6 col-md-3 d-none d-md-block"> 
                	 		<h4><b>시작가격</b></h4>
                	 	</div>   
                	 	
                	 	<div class="col-6 col-md-9 d-none d-md-block">    
                	 		100,000원
                	 	</div>
                	 </div>
                	 
	                <div class="row col-md-12 ">
	                
	                	<div class="col-4 col-md-4"  style=" text-align: right;">    
                	 		<h4><b>입찰가격 </b></h4>
                	 		<br>
                	 	</div>
                	 	<div class="col-4 col-md-2">
                	 		<input type="number" id="bid_price" class="bid" value=125000>원
                	 	</div>
                	 	<div class="col-4 col-md-6"> 
                	 		<button type="button" class="btn btn-secondary btn-block">입찰하기</button>
                	 	</div> 
                	 	  
	                	<div class="col-4 col-md-4"  style=" text-align: right;">    
                	 		<h4><b>즉시구매가격</b></h4>
                	 		<br>
                	 	</div>
                	 	<div class="col-4 col-md-2">
                	 		15,0000원
                	 	</div>
                	 	<div class="col-4 col-md-6"> 
                	 		<button type="button" class="btn btn-dark  btn-block">즉시구매</button>
                	 	</div>   
	                	
	                	<div class="col-4 col-md-4"  style=" text-align: right;">    
                	 		<h4><b>Z-PAY 잔액</b></h4>
                	 	</div>
                	 	<div class="col-4 col-md-2">
                	 		15,0000원
                	 	</div>
                	 	<div class="col-4 col-md-6"> 
                	 		<button type="button" class="btn btn-primary  btn-block">충전하기</button>
                	 	</div>   
	                </div>
                </div>
            </div>
		</div>
	</section>
	
	<!-- footer -->
	<footer>
		
	</footer>
</body>
</html>