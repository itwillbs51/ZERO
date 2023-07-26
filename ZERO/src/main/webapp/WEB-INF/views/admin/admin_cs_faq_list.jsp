<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/css/adminstyles.css" rel="stylesheet" type="text/css">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<title>ZERO</title>
<style type="text/css">
	body{
		min-width: 360px;
	}
</style>
</head>
	<body class="sb-nav-fixed">
		<header>
			<%@ include file="../inc/admin_header.jsp" %>
			<%@ include file="../inc/admin_sidebar.jsp" %>	
		</header>
		<div id="layoutSidenav">
			<div id="layoutSidenav_content">
				<main>
					<div class="container-fluid px-4">
						<h1 class="mt-4">고객센터 관리</h1>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item active">자주 묻는 질문</li>
						</ol>
						
						<%-- main 내용 작성 영역 --%>
	<!-- 					<div id="grid"></div> -->
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table me-1"></i>
									자주 묻는 질문
									<a href="cs_notice" class="btn btn-sm btn-outline-dark" style="float: right;">고객센터 바로가기</a>					
								</div>
								<div class="card-body">
									<table id="datatablesSimple">
										<thead>
											<tr>
												<th>문의유형</th>
												<th>1</th>
												<th>2</th>
												<th>3</th>
												<th>4</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td><a class="btn btn-sm btn-outline-dark" href="#">상세보기</a></td>
											</tr>
										</tbody>
									</table>
								</div>
	<!-- 						</div> -->
						<%--  메인 영역 끝 --%>					
						
					</div>
				</main>
				<footer class="py-4 bg-light mt-auto">
					<%@ include file="../inc/admin_footer.jsp" %>	
				</footer>	
			</div>
		</div>
	<!-- 이 스크립트들은 위로 올리면 작동하지 않음 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/demo/chart-area-demo.js"></script>
	<script src="${pageContext.request.contextPath }/resources/demo/chart-bar-demo.js"></script>
	<script src="${pageContext.request.contextPath }/resources/demo/chart-pie-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
	</body>
</html>