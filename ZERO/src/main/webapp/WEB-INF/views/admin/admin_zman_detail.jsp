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
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/css/adminstyles.css" rel="stylesheet" type="text/css">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<title>ZERO</title>
<style type="text/css">
	body{
		min-width: 360px;
	}
	.container-fluid {
		max-width: 1000px;
	}

	#zmanDetailInfo th {
		width: 30%;
		background-color: rgba(0, 0, 0, 0.07);
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
					<h1 class="mt-4">${zman.zman_name } 님 회원정보</h1>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="admin_zman_list">zman목록</a></li>
						<li class="breadcrumb-item active" aria-current="page">상세정보</li>
					</ol>
					
					<%-- main 내용 작성 영역 --%>
					<div class="card mb-4">
						<div class="card-header">
							<b>${zman.zman_name }</b> 님 회원정보
						</div>
						<div class="card-body">
							<table id="zmanDetailInfo" class="table table-border">
								<tbody>
									<tr>
										<th>이름</th>
										<td colspan="2">${zman.zman_name }</td>
									</tr>
									<tr>
										<th>아이디</th>
										<td colspan="2">${zman.zman_id }</td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td colspan="2">${zman.zman_birth }</td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td colspan="2">${zman.zman_phone }</td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="2">${zman.zman_address }</td>
									</tr>
									<tr>
										<th>zman상태</th>
										<td>${zman.zman_status }</td>
										<td class="text-end">
											<span style="display: inline-block;">
												<select class="form-select form-select-sm" aria-label="Default select example" style="width: 120px;">
													<option selected>${zman.zman_status }</option>
													<option value="활동">활동</option>
													<option value="활동">탈퇴</option>
												</select>
											</span>
											<span style="display: inline-block;">
												<button type="button" class="btn btn-sm btn-dark text-nowrap" data-bs-toggle="modal" data-bs-target="#changezmanStatus">변경</button>											
											</span>
										</td>
									</tr>
									<tr>
										<th>탈퇴일</th>
										<td colspan="2"></td>
									</tr>
									<tr>
										<th>배달 내역 상세보기</th>
										<td colspan="2" class="text-end">
											<button type="button" class="btn btn-sm btn-dark text-nowrap">상세보기</button>
										</td>
									</tr>
									<tr>
										<th>수익 내역 상세보기</th>
										<td colspan="2" class="text-end">
											<button type="button" class="btn btn-sm btn-dark text-nowrap">상세보기</button>
										</td>
									</tr>
									<tr>
										<th>계좌등록일</th>
										<td colspan="2">
										</td>
									</tr>
									<tr>
										<th>은행명</th>
										<td colspan="2">
										</td>
									</tr>
									<tr>
										<th>계좌번호</th>
										<td colspan="2">
										</td>
									</tr>
									<tr>
										<th>본인인증 방법</th>
										<td colspan="2"></td>
									</tr>
									<tr>
										<th>운전면허증 번호</th>
										<td colspan="2"></td>
									</tr>
									<tr>
										<th>zman 신청일</th>
										<td colspan="2"></td>
									</tr>
									<tr>
										<th>교육이수여부</th>
										<td colspan="2"></td>
									</tr>
									<tr>
										<th>zman 등록일</th>
										<td colspan="2"></td>
									</tr>
								</tbody>
							</table>
							<div class="text-center">
								<button type="button" class="btn btn-outline-dark" onclick="history.back()">뒤로가기</button>							
								<button type="button" class="btn btn-dark" onclick="history.back()">변경저장</button>							
							</div>
						</div>
					</div>
				</div>

			</main>
			<footer class="py-4 bg-light mt-auto">
				<%@ include file="../inc/admin_footer.jsp" %>	
			</footer>	
		</div>
	</div>
	
	<%-- 회원상태 변경 모달창 --%>
	<div class="modal fade" id="changezmanStatus" tabindex="-1" role="dialog" aria-labelledby="changezmanStatusTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fs-5" id="changezmanStatusTitle">회원상태변경</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					정말 변경하시겠습니까?
				</div>
				<div class="modal-footer">
					<form action="zman_login_form" method="post">
						<input type="hidden" name="play_num" value="" />  
						<input type="hidden" name="url" value="" />
						<button type="submit" class="btn btn-dark" onclick="location.href='#'">변경</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					</form>
				</div>
			</div>
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