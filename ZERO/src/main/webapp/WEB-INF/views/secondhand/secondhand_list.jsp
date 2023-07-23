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
<title>ZERO</title>
<script type="text/javascript">
</script>
<style>
#mainArticle {
	margin-top: 30px;
}
a {
	color:black;

}
.photoDiv {
	position: relative;
}
.dealStatus{
/* 	position: absolute; */
/* 	margin-bottom: 0; */
/* 	padding-bottom: 0; */
/* 	bottom: -20px; */
/* 	left: 10px; */
/* 	font-size: 60px; */
/* 	font-style: italic; */
/* 	color: #eee; */
	
	
		font-size: 0.9rem;

		position: absolute;
		top: 117px;
		right: 0px;
/* 		border: 3px double gray;  */
		border-radius: 50%

}
.card-text{
	text-align: center;
	margin-top: 5px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	

	<article id="mainArticle">
		<div class="container">
<!-- 		<div class="row"  id="listArea" align="left"> -->
<!-- 				<div class="col-lg-3 col-mid-4"> -->
<!-- 					<div class="card border-0 shadow-sm" style="width: 18rem;"> -->
<%-- 						페이지이동시 상품번호넘겨줌 --%>
<%-- 					  	<a href="secondhand_detail">?secondhand_idx=${secondhand_idx} --%>
<%-- 					  	<img src="${pageContext.request.contextPath }/resources/img/중고상품1.jpg" class="card-img-top" alt="..."> --%>
<%-- 					  </a>해당영화의 포스터출력 --%>
<!-- 						<div class="card-body"> -->
<!-- 							<h6 class="card-title" style="white-space: nowrap; overflow:hidden; text-overflow: elipsis;"> -->
<!-- 								<b>상품 제목입니다</b> -->
<!-- 							</h6> -->
<!-- 							<p class="card-text"> -->
<%-- 								선택한 거래방법 아이콘으로 표시 => 위치 등 다시생각해봐야할듯 --%>
<!-- 								<button class="btn btn-outline-light">택배가능</button> -->
<!-- 								<button class="btn btn-outline-light">Z페이가능</button> -->
<!-- 							</p> -->
<!-- 							<p class="d-flex justify-content-center"> -->
<%-- 								찜하기영역 --%>
<%-- 								<a href="#"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png"></a>	 --%>
<!-- 					    	</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<%-- 		</div>id listArea끝 --%>
	
	
	
			<div class="row col col-3">
				<hr>
				<div class="productArea">
					<div class="titleArea">
						<div class="title">중고</div>
					</div>
					<div class="productListArea">
						<div class="card">
							<div class="photoDiv">
								<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
								<span class="dealStatus"><button>판매중</button></span>
							</div>
							
						<div class="card-body">
							<button class="btn btn-light">패션/잡화/의류/뷰티</button>
							<p class="card-text">
								<a href="#">제목입니다</a>
								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a>
							</p>
							
								
						
							</div>
						</div>
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<button class="btn btn-light">패션/잡화/의류/뷰티</button>
								<p class="card-text"><a href="#">제목입니다</a></p>
							</div>
						</div>
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<button class="btn btn-light">패션/잡화/의류/뷰티</button>
								<p class="card-text"><a href="#">제목입니다</a></p>
							</div>
						</div>
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<button class="btn btn-light">패션/잡화/의류/뷰티</button>
								<p class="card-text"><a href="#">제목입니다</a></p>
							</div>
						</div>
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<button class="btn btn-light">패션/잡화/의류/뷰티</button>
								<p class="card-text"><a href="#">제목입니다</a></p>
							</div>
						</div>
					</div>
	
				</div>
			</div><%--row끝 --%>
			
			
			<div class="itemThumbnailBox item" data-cd="market0098" style="">
				<div class="itemThumbnailBox" style="">
					<img src="http://c3d2212t3.itwillbs.com/Moneytto/resources/upload/a53263b2.png" alt="썸네일" class="itemThumbnail" style="cursor: pointer">
					<input type="button" value="판매중" class="status active"><img src="http://c3d2212t3.itwillbs.com/Moneytto/resources/images/main/ico_heart_off_x3.png" alt="좋아요 아이콘" class="WishWishImg wish" onclick="wish.call(this)">
				</div>
				<div class="itemTextBox">
					<div class="itemCategory">가전제품/모바일/PC</div>
					<div class="itemText subject">블루라이트 차단 안경 팔아요.</div>
					<div class="itemText">20,000원</div>
					<div class="itemTagBox">
						<div class="itemSizeTag">블루라이트차단</div>
						<div class="itemSizeTag">도수없음</div>
						<div class="itemSizeTag">안경</div>
					</div>
					<div class="itemTimeTag">2023-06-14 23:58</div>
				</div>
			</div>
			
			
			
			
			<div id="row col col-3">
				<hr>
				<div class="productArea">
					<div class="titleArea">
						<div class="title">중고</div>
					</div>
					<div class="productListArea">
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<button class="btn btn-light">패션/잡화/의류/뷰티</button>
								<p class="card-text"><a href="#">제목입니다</a></p>
							</div>
						</div>
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<button class="btn btn-light">패션/잡화/의류/뷰티</button>
								<p class="card-text"><a href="#">제목입니다</a></p>
							</div>
						</div>
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<button class="btn btn-light">패션/잡화/의류/뷰티</button>
								<p class="card-text"><a href="#">제목입니다</a></p>
							</div>
						</div>
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<button class="btn btn-light">패션/잡화/의류/뷰티</button>
								<p class="card-text"><a href="#">제목입니다</a></p>
							</div>
						</div>
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<button class="btn btn-light">패션/잡화/의류/뷰티</button>
								<p class="card-text"><a href="#">제목입니다</a></p>
							</div>
						</div>
					</div>
	
				</div>
			</div><%--row 끝 --%>
		</div><%--container 끝 --%>
		
	</article>
	
	<footer>
	</footer>
</body>
</html>