<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath }/resources/css/adminstyles.css" rel="stylesheet" />
<div id="layoutSidenav">
	<div id="layoutSidenav_nav">
		<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
			<div class="sb-sidenav-menu">
				<div class="nav">
					<div class="sb-sidenav-menu-heading">관리자 홈</div>
					<a class="nav-link" href="admin_main">
						<div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
						Dashboard
					</a>
					<div class="sb-sidenav-menu-heading">관리</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#memberManagement" aria-expanded="false" aria-controls="memberManagement">
						<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
						회원관리
						<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
					</a>
					<div class="collapse" id="memberManagement" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="admin_member_list">회원목록</a>
							<a class="nav-link" href="admin_member_report">회원신고</a>
						</nav>
					</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#zmanManagement" aria-expanded="false" aria-controls="zmanManagement">
						<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
						ZMAN관리
						<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
					</a>
					<div class="collapse" id="zmanManagement" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="admin_zman_list">ZMAN목록</a>
							<a class="nav-link" href="admin_zman_delivery_list">ZMAN배달내역</a>
							<a class="nav-link" href="admin_zman_report">ZMAN신고</a>
						</nav>
					</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#secondhandManagement" aria-expanded="false" aria-controls="secondhandManagement">
						<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
						중고거래관리
						<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
					</a>
					<div class="collapse" id="secondhandManagement" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="admin_secondhand_list">상품목록</a>
							<a class="nav-link" href="#">금지품목</a>
							<a class="nav-link" href="#">상품신고</a>
						</nav>
					</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#auctionManagment" aria-expanded="false" aria-controls="auctionManagment">
						<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
						경매관리
						<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
					</a>
					<div class="collapse" id="auctionManagment" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="#">상품목록</a>
						</nav>
					</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#csManagment" aria-expanded="false" aria-controls="csManagment">
						<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
						고객센터관리
						<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
					</a>
					<div class="collapse" id="csManagment" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="#">공지사항</a>
							<a class="nav-link" href="#">자주묻는 질문</a>
							<a class="nav-link" href="#">1:1질문</a>
							<a class="nav-link" href="#">건의사항</a>
						</nav>
					</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#accountManagment" aria-expanded="false" aria-controls="accountManagment">
						<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
						계좌관리
						<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
					</a>
					<div class="collapse" id="accountManagment" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="#">회원 계좌 관리</a>
							<a class="nav-link" href="#">ZMAN 계좌 관리</a>
						</nav>
					</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#zpayManagment" aria-expanded="false" aria-controls="zpayManagment">
						<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
						ZPAY관리
						<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
					</a>
					<div class="collapse" id="zpayManagment" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="#">ZPAY 충전환급 관리</a>
							<a class="nav-link" href="#">ZPAY 수익지출 관리</a>
						</nav>
					</div>
					<div class="sb-sidenav-menu-heading">Addons</div>
					<a class="nav-link" href="charts_ex">
						<div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
						Charts
					</a>
					<a class="nav-link" href="tables_ex">
						<div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
						Tables
					</a>
				</div>
			</div>
			<div class="sb-sidenav-footer">
				<div class="small">Logged in as:</div>
				Start Bootstrap
			</div>
		</nav>
	</div>
</div>