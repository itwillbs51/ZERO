<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/cs.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<title>ZERO</title>
<style>
/* a>b{ */
/* 	color: #000; */
/* 	text-decoration: none; */
/* } */

/* a:hover{ */
/* 	color: #000; */
/* 	text-decoration: none; */
/* } */

/* #mainNav>ul{ */
/* 	list-style: none; */
/* } */

/* /* 페이징 색상변경 */ 
/* .page-link { */
/*   color: #000;  */
/*   background-color: #fff; */
/*   border: 1px solid #ccc;  */
/* } */

/* .page-item.active .page-link { */
/*  z-index: 1; */
/*  color: #fff; */
/*  font-weight:bold; */
/*  background-color: #ff5050; */
/*  border-color: #ccc; */
 
/* } */

/* .page-link:focus, .page-link:hover { */
/*   color: #000; */
/*   background-color: #fafafa;  */
/*   border-color: #ccc; */
/* } */

/* /* a링크 활성화 색상 변경 */ */
/* a:hover, a:active{ */
/*  color:  #ff5050 !important; */
	
/* } */

</style>
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
							공지사항
						</div>
					</div>
					<div class="content_main notice">
						<ul>
							<c:forEach var="cs" items="${csList }">
								<li>
									<a href="cs_notice_view?cs_idx=${cs.cs_idx }">
										<p>${cs.cs_subject }</p>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:choose>
								<c:when test="${pageNum > 1 }">
									<li class="page-item">
										<a class="page-link" href="cs_notice?pageNum=${pageNum - 1}" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled">
										<a class="page-link" href="#" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
								<c:choose>
									<c:when test="${pageNum eq i }">
										<li class="page-item"><a class="page-link" href="#">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="cs_notice?pageNum=${i }">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${pageNum < pageInfo.maxPage }">
									<li class="page-item">
										<a class="page-link" href="cs_notice?pageNum=${pageNum + 1}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:when>
								<c:otherwise>
										<li class="page-item disabled">
										<a class="page-link" href="#" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>		
									</li>
								</c:otherwise>
							</c:choose>								
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</article>
	<footer>
	
	</footer>
</body>
</html>