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
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>ZERO</title>
<script type="text/javascript">
</script>
</head>
<body>
	<header>
		<%@ include file="inc/header.jsp"%>
	</header>
	
	<article>
		<div id="slid">
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${pageContext.request.contextPath }/resources/img/2023-08-05 232316.png" class="d-block w-100" alt="...">
<%-- 						<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="d-block w-100" alt="..."> --%>
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath }/resources/img/2023-08-05 232415.png" class="d-block w-100" alt="...">
<%-- 						<img src="${pageContext.request.contextPath }/resources/img/슬라이드2.jpg" class="d-block w-100" alt="..."> --%>
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
		<div id="main">
			<div class="shortcut_collection" >
				<div class="shortcut_items_wrap" >
					<div class="shortcut_item">
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img" alt="..." style="border-radius: 10px;">
							<p class="shortcut_item_title">이미지</p>
						</div>
					</div>
					<div class="shortcut_item">
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img" alt="..." style="border-radius: 10px;">
							<p class="shortcut_item_title">이미지</p>
						</div>
					</div>
					<div class="shortcut_item">
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img" alt="..." style="border-radius: 10px;">
							<p class="shortcut_item_title">이미지</p>
						</div>
					</div>
					<div class="shortcut_item">
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img" alt="..." style="border-radius: 10px;">
							<p class="shortcut_item_title">이미지</p>
						</div>
					</div>
					<div class="shortcut_item">
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img" alt="..." style="border-radius: 10px;">
							<p class="shortcut_item_title">이미지</p>
						</div>
					</div>
					<div class="shortcut_item">
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img" alt="..." style="border-radius: 10px;">
							<p class="shortcut_item_title">이미지</p>
						</div>
					</div>
					<div class="shortcut_item">
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img" alt="..." style="border-radius: 10px;">
							<p class="shortcut_item_title">이미지</p>
						</div>
					</div>
					<div class="shortcut_item">
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img" alt="..." style="border-radius: 10px;">
							<p class="shortcut_item_title">이미지</p>
						</div>
					</div>
					<div class="shortcut_item">
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img" alt="..." style="border-radius: 10px;">
							<p class="shortcut_item_title">이미지</p>
						</div>
					</div>
					<div class="shortcut_item">
						<div class="card">
							<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img" alt="..." style="border-radius: 10px;">
							<p class="shortcut_item_title">이미지</p>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="productArea">
				<div class="titleArea">
					<div class="title">중고</div>
				</div>
				<div class="productListArea">
					<div class="card">
						<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text">Some</p>
						</div>
					</div>
					<div class="card">
						<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text">Some</p>
						</div>
					</div>
					<div class="card">
						<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text">Some</p>
						</div>
					</div>
					<div class="card">
						<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text">Some</p>
						</div>
					</div>
					<div class="card">
						<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text">Some</p>
						</div>
					</div>
				</div>
				<div class="btnArea">
					<button class="btn btn-sm btn-outline-secondary">더보기</button>
				</div>
			</div>
		</div>
	</article>
	
	<footer>
		<%@ include file="inc/footer.jsp"%>
	</footer>
</body>
</html>