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
<%-- <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script> --%>
<script type="text/javascript">
//슬라이드인덱스
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






// 신고사유 셀렉트 박스
function categoryChange(e) {
    var report_member = ["도배 행위", "사기 행위", "욕설", "비매너"];
    var report_zman = ["불친절", "배달 누락"];
    var report_goods = ["주류, 담배", "전문 의약품, 의료기기", "위조상품", "부정확한 상품 정보", "전문업자 의심"];
    var target = document.getElementById("report");
 
    if(e.value == "member") var d = report_member;
    else if(e.value == "zman") var d = report_zman;
    else if(e.value == "goods") var d = report_goods;
 
    target.options.length = 0;
 
    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }    
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
	align-content:left;
	color:gray;
}
/* 등록일 */
.registDate{
	align-content:right;
	margin-left:190px;
	color:gray;
	
}
/* 거래 상태 변경 셀렉트박스 */
.changeDealStatus {
	margin-left:40px;
	 
}



/* 신고 - 모달영역 */
.modal-title{
 font-size: 17px;
 text-align:left;
 font-weight: bold;
}
.modal_table{
  width:100%;
}
#modal_userImg{
  width:50px;
  height:50px;
  border-radius: 75%;
}
#modal_userId{
  width:200px;
}
#modal_userFollow{
  margin:10px;
  text-align: right;
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
				
				
				
				<%-- 상품이미지영역 - 슬라이드 --%>
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
<%-- 					<a href="reportPopup"><img src="${pageContext.request.contextPath }/resources/img/report_icon.png" width="30px" height="30px"></a> --%>
					
				
				
				
				<%-- 신고 모달로 해보기 --%>
				<%-- 모달 출력 버튼 --%>
				<button class="btn btn-default" data-target="#layerpop" data-toggle="modal">
					<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_report.png"
					 	 alt="신고하기" class="TopNavigationIcon report" width="35px" height="35px">
				</button>
				<%-- 공유하기버튼 --%>
					<a href="#"><img src="${pageContext.request.contextPath }/resources/img/share_icon.png" width="30px" height="30px"></a>
				</span>


	








					
				<h3>${secondhandProduct.secondhand_subject }</h3>
				<h5>${secondhandProduct.secondhand_price }<b>원</b></h5>
				<span class="readcount">조회수 ${secondhandProduct.secondhand_readcount } </span>
				<span class="registDate">등록일 ${secondhandProduct.secondhand_first_date }</span>
				<hr>
				<p>${secondhandProduct.secondhand_content }</p>
				<br>
				<hr>
				
				<%-- 
					sessionId 일치하는경우 (판매자본인일경우) - 수정하기 / 삭제하기 버튼 활성화 
					-> 페이지이동시 상품번호,페이지번호 파라미터로 전달
					
					sessionId 일치하지 않는경우 or 없는경우 : 채팅하기 버튼 보여줌
					=> 없는경우 채팅버튼 누를경우 : 로그인알람창 -> 로그인페이지 이동
				--%>
				
			<c:choose>
				<%-- 1. 세션아이디 존재하고, 세션아이디=판매자아이디 동일할 경우 --%>
				<%-- 1-1. 수정하기, 삭제하기, 끌어올리기 영역 노출 --%>
				<c:when test="${not empty sessionScope.member_id && sessionScope.member_id eq secondhandProduct.member_id}">
					<a href="#"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="40px" height="40px"></a>

					<button class="btn btn-primary btn-lg" style="font-size:1em; margin:10px 10px" 
							onclick="location.href='secondhandModifyForm?secondhand_idx=${secondhandProduct.secondhand_idx}&member_id=${secondhandProduct.member_id }'"> 
						수정하기 
					</button>
	
					<button class="btn btn-primary btn-lg" style="font-size:1em; margin:10px 10px" 
							onclick="location.href='secondhandDelete?secondhand_idx=${secondhandProduct.secondhand_idx}'">
						 삭제하기 
					 </button>
	
					<button class="btn btn-primary btn-lg" style="font-size:1em; margin:10px 10px" 
						onclick="location.href='secondhandUpdatedate?secondhand_idx=${secondhandProduct.secondhand_idx}&member_id=${secondhandProduct.member_id }'"> 
						끌어올리기 
					</button>
					<%--1-2.셀렉트박스로 거래상태변경가능 --%>
<!-- 					<select class="changeDealStatus" aria-label="Default select example"> -->
<!-- 					  <option selected> 거래중 </option> -->
<!-- 					  <option value="1"> 거래완료 </option> -->
<!-- 					  <option value="2"> 끌어올리기 </option> -->
<!-- 					</select> -->
				
				</c:when>					
				
				
				
				
				<%-- 2.판매자 본인 아닐경우 - 채팅하기 가능 --%>
				<c:otherwise>
				
					<%-- 2-1.세션아이디 없을경우(미로그인) -> 로그인알람창띄우고 로그인페이지로 이동 --%>
					<c:if test="${empty sessionScope.member_id }">
						<%--<button type="button" class="btn btn-outline-danger" id="likeMovieNo${i.index }" data-toggle="modal" data-target="#needLogin">♡찜하기</button> --%>
						<a href="#">
							<img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="40px" height="40px">
						</a>
						<div class="d-grid gap-2">
							<button class="btn btn-dark" id="chatting" 
									data-toggle="modal" data-target="#needLogin" 
									style="font-size:1em; margin:10px 10px">
								채팅하기
							</button>
						</div>
					</c:if>
				
					<%--2.2 세션아이디 있을경우(판매자아닌 일반회원) -> 채팅하기 누를경우 채팅창으로 이동 --%>
					<c:if test="${not empty sessionScope.member_id && sessionScope.member_id ne secondhandProduct.member_id }">
						
							<a href="#" style="display: inline-block;">
								<img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="40px" height="40px">
							</a>
							
							<form action="doChat" method="POST">
								<input type="hidden" value="${secondhandProduct.member_id }" name="seller_id">
								<input type="hidden" value="${secondhandProduct.secondhand_idx }" name="secondhand_idx">
								<div class="d-grid gap-2">
									<input type="submit" class="btn btn-dark" style="font-size:1em;" value="채팅하기">
								</div>
							</form>
						
						
					</c:if>
				</c:otherwise>
			</c:choose>
			
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
					<p>
						<b>카테고리</b> 
						<button class="btn btn-light" style="align:left;">${secondhandProduct.category_name }</button><br>
					</p>	

					<p>
						<b>거래방법</b>
						<c:if test="${not empty secondhandProduct.secondhand_deliveryType_ptp }">
							<button class="btn btn-light" > 직거래 </button> 
						</c:if>
						<c:if test="${not empty secondhandProduct.secondhand_deliveryType_parcel }">
							<button class="btn btn-light" > 택배거래 </button> 
						</c:if>
						<c:if test="${not empty secondhandProduct.secondhand_deliveryType_zstation }">
							<button class="btn btn-light" > Z스테이션 </button> 
						</c:if>
						<c:if test="${not empty secondhandProduct.secondhand_deliveryType_zman }">
							<button class="btn btn-light" > Z맨 </button> 
						</c:if>
					</p>												

					<p>
						<b>결제방법</b> 
						<c:if test="${not empty secondhandProduct.secondhand_paymentType_ptp }">
							<button class="btn btn-light" > 직거래 </button> 
						</c:if>
						<c:if test="${not empty secondhandProduct.secondhand_paymentType_zpay }">
							<button class="btn btn-light" > Z페이 </button> 
						</c:if>
					</p>
			</div>
			
			
			
			
			
			
			<%-- 2행 2열 (판매자정보) --%>
			<div class="column">
			<hr>
				<%-- 판매자 프로필, 닉네임, 판매상품수 --%>
				<div class="row">				
					
					<%-- 판매자 프로필 --%>
					<div class="column">
						<img src="${pageContext.request.contextPath }/resources/upload/${seller.member_image}" width="120px" height="120px" style="margin:20px; border-radius: 50%; ">
					 </div>
					
					<%-- 판매자 닉네임 --%>
					 <div class="column">
						<b><a href="secondhandSeller?member_id=${seller.member_id }">${seller.member_nickname } </a></b>
						<%-- 판매자의 판매하는 상품의 개수 --%>
					 	<br>판매상품 ${sellerProduct } 개
					 </div>
				</div>
				
				
				<%-- 판매자의 판매중 다른상품정보 --%>
				<br>
				<div class="row" style="margin-left:10px; margin-bottom:10px;">
					<b>${seller.member_nickname }</b> 님의 판매중인 상품 ... <a href="secondhandSeller?member_id=${secondhandProduct.member_id}">더보기</a>
				</div>

				 <%--썸네일이미지 --%>
				 	<%-- 판매자의 물품 개수만큼 반복표시 --%>
				<div class="row">
				  	<c:forEach var="sellerProductList" items="${sellerProductList }" varStatus="loop">
				  		<c:if test="${loop.index lt 4}">
						<%--판매자의 첫번째상품의 첫번째이미지(썸네일이미지)만 보여줌 --> 판매상품여러개일수도 -> 리스트로 받아옴 --%>
						<%--네개까지만 받아오기 --%>
						<%--각이미지마다 상품 상세페이지로 이동하는 하이퍼링크 --%>
						<span class="sumnail">						
							<a href="secondhand_detail?secondhand_idx=${sellerProductList.secondhand_idx }&member_id=${sellerProductList.member_id}">		
								<img class="democursor" src="${pageContext.request.contextPath }/resources/upload/${sellerProductList.secondhand_image1}" style="width:130px; height:160px;" >
							</a>
						</span>	
						</c:if>
				  	</c:forEach>
				  </div>
			</div>
		</div>
		

			

		</div> <%--container 끝 --%>
		
		
		
	<%-- 찜하기 안내 모달 영역 --%>
	<div class="modal fade" id="needLogin" tabindex="-1" role="dialog" aria-labelledby="needSessionId" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="needSessionId">로그인 안내</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body text-center" id="modalMsg">
	      	<%-- 메세지가 표시되는 부분 --%>
		  	회원 로그인이 필요한 작업입니다. 로그인 하시겠습니까?
	      </div>
	      <div class="modal-footer justify-content-center">
	      	<c:choose>
	      		<c:when test="${empty sessionScope.member_id}">
		        	<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath }/member_login'">로그인</button>
			        <button type="button" class="btn btn-light" data-dismiss="modal" aria-label="Close">아니오</button>
		        </c:when>
		        <c:otherwise>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">확인</button>
		        </c:otherwise>
	      	</c:choose>
	      </div>
	    </div>
	  </div>
	</div>
		
	<%--신고 모달창 영역 --%>
		<div class="modal fade" id="layerpop" >
				<div class="modal-dialog">
					<div class="modal-content">
					
						<!-- header -->
						<div class="modal-header">
					
							<!-- header title -->
							<h4 class="modal-title">header</h4>
							</div>
							
							<!-- body -->
							<form action="zero_report" method="POST" name="fr">								
								<div class="modal-body">
								
								    <%-- 신고하려는 내용 알려주기 --%>
									<div class="1st_report">
										<div class="report_area">
											<h2>신고 제목</h2>
										</div>
									</div>
									
									<%-- 신고 이유 선택하기 --%>				
									<div class="reportReason">
										<h4>사유선택</h4>
										<div>
											<select onchange="categoryChange(this)">
											    <option>신고 타입을 선택해주세요</option>
											    <option value="member">회원</option>
											    <option value="zman">ZMAN</option>
											    <option value="goods">상품</option>
											</select>
					 					</div>
					 					
					 					<div>
											<select id="report">
												<option>사유 선택</option>
											</select>
										</div>
									</div>
								</div> <%-- <div class="modal-body"> --%>
								
								<!-- Footer -->
								<div class="modal-footer">
									<button type="submit" class="btn btn-default" data-dismiss="modal" > 신고하기 </button>
								</div>
							</form>
						</div> <%-- <div class="modal-content"> --%>
					</div>
				</div>
	
	
	
	
	
	</article>
<footer></footer>
</body>

</html>