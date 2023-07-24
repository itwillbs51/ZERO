<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/cs.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/button.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<title>ZERO</title>
<style>
	.searchFaq {
		position: relative;
		height: 40px;
		margin: 16px 0 16px;
	}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	<article>
		<div class="container cs">
			<nav id="mainNav" class="sidebarArea d-none d-md-block sidebar">
				<jsp:include page="/WEB-INF/views/inc/cs_sidebar.jsp"></jsp:include>
			</nav>
			<div class="contentArea">
				<div>
					<div class="content_title border">
						<div class="title">
							자주묻는질문
						</div>
					</div>
					<div class="searchFaq">
						<form class="form-inline my-2 my-md-0">
							<input class="form-control form-control mr-2 mr-sm-2" type="search" placeholder="Search">
							<button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Search</button>
						</form>
					</div>
					<div>
						<div class="btn-group" role="group" aria-label="Basic example">
							<button type="button" id="faqAll" value="전체" class="btn btn-dark" >전체</button>
							<button type="button" id="faqReserv" value="예매" class="btn btn-outline-dark">이용정책</button>
							<button type="button" id="faqMemship" value="멤버십" class="btn btn-outline-dark">공통</button>
							<button type="button" id="faqPayment" value="결제수단" class="btn btn-outline-dark">구매</button>
							<button type="button" id="faqTheater" value="극장" class="btn btn-outline-dark">판매</button>
						</div>
					</div>
					<hr>
				</div>
			</div>
		</div>
	</article>
	<footer>
	
	</footer>
</body>
</html>