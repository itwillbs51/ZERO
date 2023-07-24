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

function myFunction() {
	  var x = document.getElementById("myDIV");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
}
function myFunction2() {
	  var x2 = document.getElementById("myDIV2");
	  if (x2.style.display === "none") {
	    x2.style.display = "block";
	  } else {
	    x2.style.display = "none";
	  }
	  
}



//탭으로했을경우
// function openCity(evt, cityName) {
//   var i, tabcontent, tablinks;
//   tabcontent = document.getElementsByClassName("tabcontent");
//   for (i = 0; i < tabcontent.length; i++) {
//     tabcontent[i].style.display = "none";
//   }
//   tablinks = document.getElementsByClassName("tablinks");
//   for (i = 0; i < tablinks.length; i++) {
//     tablinks[i].className = tablinks[i].className.replace(" active", "");
//   }
//   document.getElementById(cityName).style.display = "block";
//   evt.currentTarget.className += " active";
// }


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

/* collapse 영역 */
#myDIV, #myDIV2 {
  width: 100%;
  padding: 50px 0;
  text-align: center;
  background-color: white;
  margin-top: 20px;
}


/*탭으로하였을경우*/


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

			<div class="category">
			  <a class="btn btn-light" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" onclick="myFunction()" >
			   	카테고리 <img src="https://ccimage.hellomarket.com/img/web/search/filter/blue_arrow.svg" alt="화살표 아래 아이콘" class="FilterBoxArrow">
			  </a>
			  	<%-- collapse 출력 영역 --%>
			 	<div id="myDIV">
					<button class="btn btn-light">유아동/유아의류/장난감</button>
					<button class="btn btn-light">유아동/유아의류/장난감</button>
					<button class="btn btn-light">유아동/유아의류/장난감</button>
					<button class="btn btn-light">유아동/유아의류/장난감</button>
					<button class="btn btn-light">유아동/유아의류/장난감</button>
				</div>
			  <button class="btn btn-light" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" onclick="myFunction2()">
			  	가격선택 <img src="https://ccimage.hellomarket.com/img/web/search/filter/blue_arrow.svg" alt="화살표 아래 아이콘" class="FilterBoxArrow">
			  </button>
			 	 <%-- collapse 출력 영역 --%>
			  	<div id="myDIV2">
					<input type="text" placeholder="최저가"> ~ <input type="text" placeholder="최고가"><button class="btn btn-light"> 적용하기</button>
				</div>
				<%-- 초기화,내상품등록 --%>
				<div class="secondhandRegist" align="right">
					<button class="btn btn-dark"> 필터초기화 </button>
					<button class="btn btn-dark"> 내 상품 등록하기 </button>
				</div>
			</div>
			
			
<!-- 			<div class="collapse" id="collapseExample"> -->
<!-- 			  <div class="card card-body"> -->
<!-- 			    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger. -->
<!-- 			  </div> -->
<!-- 			</div> -->


			<div class="row col col-3">
				<hr>


					<div class="productListArea">
						<div class="card">
							<div class="photoDiv">
								<a href="secondhand_detail">
									<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." >
								</a>
								<span class="dealStatus"><button>판매중</button></span>
							</div>
						<div class="card-body">
							<button class="btn btn-light">패션/잡화/의류/뷰티</button>
							<p class="card-text">
								<a href="secondhand_detail">제목입니다</a>
								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a>
							</p>
							<p>14,000원</p>
							<p>2023-08-01 11:00:00</p>
						</div>
						</div>
						
						
						<div class="card">
							<div class="photoDiv">
								<a href="secondhand_detail">
									<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." >
								</a>
								<span class="dealStatus"><button>판매중</button></span>
							</div>
						<div class="card-body">
							<button class="btn btn-light">패션/잡화/의류/뷰티</button>
							<p class="card-text">
								<a href="secondhand_detail">제목입니다</a>
								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a>
							</p>
							<p>14,000원</p>
							<p>2023-08-01 11:00:00</p>
						</div>
						</div>
						
						
						<div class="card">
							<div class="photoDiv">
								<a href="secondhand_detail">
									<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." >
								</a>
								<span class="dealStatus"><button>판매중</button></span>
							</div>
						<div class="card-body">
							<button class="btn btn-light">패션/잡화/의류/뷰티</button>
							<p class="card-text">
								<a href="secondhand_detail">제목입니다</a>
								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a>
							</p>
							<p>14,000원</p>
							<p>2023-08-01 11:00:00</p>
						</div>
						</div>
						
						<div class="card">
							<div class="photoDiv">
								<a href="secondhand_detail">
									<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." >
								</a>
								<span class="dealStatus"><button>판매중</button></span>
							</div>
						<div class="card-body">
							<button class="btn btn-light">패션/잡화/의류/뷰티</button>
							<p class="card-text">
								<a href="secondhand_detail">제목입니다</a>
								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a>
							</p>
							<p>14,000원</p>
							<p>2023-08-01 11:00:00</p>
						</div>
						</div>
						
						
						<div class="card">
							<div class="photoDiv">
								<a href="secondhand_detail">
									<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." >
								</a>
								<span class="dealStatus"><button>판매중</button></span>
							</div>
						<div class="card-body">
							<button class="btn btn-light">패션/잡화/의류/뷰티</button>
							<p class="card-text">
								<a href="secondhand_detail">제목입니다</a>
								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a>
							</p>
							<p>14,000원</p>
							<p>2023-08-01 11:00:00</p>
						</div>
						</div>

				</div><%--productArea 끝 --%>
			</div><%--row끝 --%>
		
			<div class="row col col-3">
				<hr>
				<div class="productArea">
	
					<div class="productListArea">
						<div class="card">
							<div class="photoDiv">
								<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." onclick="location.href='secondhand/secondhand_detail.jsp'">
								<span class="dealStatus"><button>판매중</button></span>
							</div>
						<div class="card-body">
							<button class="btn btn-light">패션/잡화/의류/뷰티</button>
							<p class="card-text">
								<a href="secondhand/secondhand_detail.jsp">제목입니다</a>
								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a>
							</p>
							<p>14,000원</p>
							<p>2023-08-01 11:00:00</p>
						</div>
						</div>
						
						
						<div class="card">
							<div class="photoDiv">
								<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." onclick="location.href='secondhand/secondhand_detail.jsp'">
								<span class="dealStatus"><button>판매중</button></span>
							</div>
						<div class="card-body">
							<button class="btn btn-light">패션/잡화/의류/뷰티</button>
							<p class="card-text">
								<a href="secondhand/secondhand_detail.jsp">제목입니다</a>
								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a>
							</p>
							<p>14,000원</p>
							<p>2023-08-01 11:00:00</p>
						</div>
						</div>
						
						
						<div class="card">
							<div class="photoDiv">
								<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." onclick="location.href='secondhand/secondhand_detail.jsp'">
								<span class="dealStatus"><button>판매중</button></span>
							</div>
						<div class="card-body">
							<button class="btn btn-light">패션/잡화/의류/뷰티</button>
							<p class="card-text">
								<a href="secondhand/secondhand_detail.jsp">제목입니다</a>
								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a>
							</p>
							<p>14,000원</p>
							<p>2023-08-01 11:00:00</p>
						</div>
						</div>
						
						<div class="card">
							<div class="photoDiv">
								<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." onclick="location.href='secondhand/secondhand_detail.jsp'">
								<span class="dealStatus"><button>판매중</button></span>
							</div>
						<div class="card-body">
							<button class="btn btn-light">패션/잡화/의류/뷰티</button>
							<p class="card-text">
								<a href="secondhand/secondhand_detail.jsp">제목입니다</a>
								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a>
							</p>
							<p>14,000원</p>
							<p>2023-08-01 11:00:00</p>
						</div>
						</div>
						
						<div class="card">
							<div class="photoDiv">
								<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." onclick="location.href='secondhand/secondhand_detail.jsp'">
								<span class="dealStatus"><button>판매중</button></span>
							</div>
						<div class="card-body">
							<button class="btn btn-light">패션/잡화/의류/뷰티</button>
							<p class="card-text">
								<a href="secondhand/secondhand_detail.jsp">제목입니다</a>
								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a>
							</p>
							<p>14,000원</p>
							<p>2023-08-01 11:00:00</p>
						</div>
						</div>
					</div>
				</div>
			</div><%--row끝 --%>
		</div><%--container 끝 --%>
		
	</article>
	
	<footer>
	</footer>
</body>

</html>