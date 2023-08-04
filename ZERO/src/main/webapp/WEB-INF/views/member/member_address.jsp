<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/sidebar.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/member.css"
	rel="stylesheet" type="text/css">
	
<%-- vue.js 링크 --%>
<!-- <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script> -->
<!-- <style type="text/css"> /*# sourceMappingURL=contenteditable.vue.map */</style> -->
<!-- 스크립트 태그 추가 -->
<script type="text/javascript">

	$(function(){
		
	
	});
	
	// 주소 추가버튼
	function btnAddress(event) {

// 		event.preventDefault();

		// 이벤트가 발생한 요소를 가져옵니다.
		const target = event.target;
		console.log('클릭한 링크의 class 값:', target.className);
		console.log('클릭한 링크의 name 값:', target.name);
		console.log('hidden 값 상태:', $('div[name="modal"]').attr('hidden'));
// 		if(){
			
// 		}
		$('div[name="modal"]').removeAttr('hidden');
		
	}
	
	// 주소 삭제버튼
	function deleteAddress(event) {

// 		event.preventDefault();

		// 이벤트가 발생한 요소를 가져옵니다.
		const target = event.target;
		console.log('클릭한 링크의 class 값:', target.className);
		console.log('클릭한 링크의 name 값:', target.name);
// 		console.log('hidden 값 상태:', $('div[name="modal"]').attr('hidden'));
// 		if(){
			
// 		}
		$('div[name="modal"]').removeAttr('hidden');
		
	}

	
	function modal(pop) {
		console.log(pop)
		$('#' + pop).toggleClass('blind');
	}

</script>


<title>중고거래 사이트</title>



</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
<%--  <header id="pageHeader"><%@ include file="assets/inc/header_zero.jsp"%></header> --%>
 
  <%--본문내용 --%>
  <article id="mainArticle">
  <div id="__layout">

	<div data-v-473e7c14="" class="container my lg">
	
		<nav id="mainNav" class="sidebarArea d-none d-md-block sidebar">
			<jsp:include page="/WEB-INF/views/inc/member_sidebar_hyo.jsp"></jsp:include>
		</nav>
	
		<div data-v-473e7c14="" class="contentArea">

			<%-- 본문 - 주소록 관리 --%>
			<div data-v-2e8df47b="" data-v-473e7c14="" class="content_area">
				<div data-v-2e8df47b="" class="my_addressbook">
					<div data-v-88eb18f6="" data-v-2e8df47b="" class="content_title">
						<div data-v-88eb18f6="" class="title">
							<h3 data-v-88eb18f6="">주소록</h3>
						</div>
						<div data-v-88eb18f6="" class="btn_box">
							<a data-v-43813796="" data-v-88eb18f6="" name="insert" class="btn btn_add insert" onclick="modal('modal1')">
								+ 새 배송지 추가
							</a>
						</div>
					</div>
					<%-- 배송지 목록 출력 부분 --%>
					<div data-v-1c284ef0="" data-v-2e8df47b="" class="my_list">
						
						<div data-v-1c284ef0="" data-v-2e8df47b="" class="my_list">
							<div data-v-1c284ef0="" class="basic">
								<div data-v-7d49a47c="" class="my_item is_active" default-mark="기본 배송지" data-v-1c284ef0="">
									<div data-v-7d49a47c="" class="info_bind">
										<div data-v-be4e2246="" class="address_info" data-v-7d49a47c="">
											<div data-v-be4e2246="" class="name_box">
												<span data-v-be4e2246="" class="name">주소1</span>
												<span data-v-be4e2246="" class="mark">기본 배송지</span>
											</div>
											<p data-v-be4e2246="" class="phone"></p>
											<div data-v-be4e2246="" class="address_box">
												<span data-v-be4e2246="" class="zipcode">(${member.member_zipcode1 })</span>
												<span data-v-be4e2246="" class="address">${member.member_address1 } ${member.member_address_detail1 }</span>
											</div>
										</div>
									</div>
									<div data-v-7d49a47c="" class="btn_bind">
										<a data-v-43813796="" data-v-7d49a47c="" name="update" class="btn solid small update" onclick="modal('modal2')"> 수정 </a>
										<a data-v-43813796="" data-v-7d49a47c="" name="delete1" class="btn outlinegrey small delete" onclick="deleteAddress(event)"> 삭제 </a>
									</div>
								</div>
							</div>
							<div data-v-1c284ef0="" class="other">
								<div data-v-1c284ef0="" class="other_list"></div>
							</div>
						</div>

					</div>
					
					<%-- 모달1 --%>
					<div data-v-78455e2e="" data-v-71b8d4b9="" data-v-2e8df47b="" class="layer_delivery layer lg blind" modal="" id="modal1">
						<div data-v-78455e2e="" class="layer_container" data-v-0fdfe010="" modal="">
							<a data-v-71b8d4b9="" data-v-78455e2e="" href="#" class="btn_layer_close" modal="">
								<div data-v-71b8d4b9="" data-v-78455e2e="">
									<button>X</button>
								</div>
							</a>
							<div data-v-78455e2e="" class="layer_content" modal="">
								<div data-v-78455e2e="" class="layer_header" modal="">
									<h2 data-v-71b8d4b9="" data-v-78455e2e="" class="title" modal=""> 새 주소 추가 </h2>
								</div>
								<div data-v-71b8d4b9="" data-v-78455e2e="" class="delivery_bind" modal="">
									<div data-v-71b8d4b9="" data-v-78455e2e="" class="delivery_input" modal="">
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box has_error" data-v-78455e2e="" modal="">
											<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title" modal="">이름</h4>
											<div data-v-4e1fd2e6="" class="input_item" modal="">
												<input data-v-4e1fd2e6="" type="text" placeholder="수령인의 이름" autocomplete="off" class="input_txt" modal="">
											</div>
											<p data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_error" modal="">올바른 이름을 입력해주세요. (2 - 50자)</p>
										</div>
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box" data-v-78455e2e="" modal="">
											<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title" modal="">휴대폰 번호</h4>
											<div data-v-4e1fd2e6="" class="input_item" modal="">
												<input data-v-4e1fd2e6="" type="tel" placeholder="- 없이 입력" autocomplete="off" class="input_txt" modal="">
											</div>
											<p data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_error" modal="">정확한 휴대폰 번호를 입력해주세요.</p>
										</div>
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box" data-v-78455e2e="" modal="">
											<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title" modal="">우편번호</h4>
											<div data-v-4e1fd2e6="" class="input_item" modal="">
												<input data-v-4e1fd2e6="" type="text" placeholder="우편 번호를 검색하세요" readonly="readonly" autocomplete="off" class="input_txt" modal="">
												<a data-v-43813796="" data-v-71b8d4b9="" href="#" class="btn btn_zipcode outline small" data-v-4e1fd2e6="" modal=""> 우편번호 </a>
											</div>
										</div>
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box" data-v-78455e2e="" modal="">
											<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title" modal="">주소</h4>
											<div data-v-4e1fd2e6="" class="input_item" modal="">
												<input data-v-4e1fd2e6="" type="text" placeholder="우편 번호 검색 후, 자동입력 됩니다" readonly="readonly" autocomplete="off" class="input_txt" modal=""></div>
										</div>
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box" data-v-78455e2e="" modal="">
											<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title" modal="">상세 주소</h4>
											<div data-v-4e1fd2e6="" class="input_item" modal="">
												<input data-v-4e1fd2e6="" type="text" placeholder="건물, 아파트, 동/호수 입력" autocomplete="off" class="input_txt" modal="">
											</div>
										</div>
									</div>
									<div data-v-71b8d4b9="" data-v-78455e2e="" class="delivery_check" modal="">
										<div data-v-4c714e9f="" data-v-71b8d4b9="" class="checkbox_item" data-v-78455e2e="" modal="">
											<label data-v-4c714e9f="" for="check1" class="check_label" modal="">
												<input data-v-4c714e9f="" id="check1" type="checkbox" name="" class="" modal="">
												<span data-v-4c714e9f="" class="label_txt" modal="">기본 배송지로 설정</span>
											</label>
										</div>
									</div>
								</div>
								<div data-v-71b8d4b9="" data-v-78455e2e="" class="layer_btn" modal="">
									<a data-v-43813796="" data-v-71b8d4b9="" name="closeModal" class="btn btn_delete outlinegrey medium" data-v-78455e2e="" modal="" onclick="modal('modal1')"> 취소 </a>
	<!-- 								<a data-v-43813796="" data-v-71b8d4b9="" disabled="disabled" href="#" class="btn btn_save solid medium disabled" data-v-78455e2e="" modal=""> 저장하기 </a> -->
									<a data-v-43813796="" data-v-71b8d4b9="" name="saveModal" class="btn btn_save solid medium" data-v-78455e2e="" modal="" onclick="closeModal(event)"> 저장하기 </a>
								</div>
							</div>
						</div>
					</div>
					<%-- 모달2 --%>
					<div data-v-78455e2e="" data-v-71b8d4b9="" data-v-2e8df47b="" class="layer_delivery layer lg blind" modal="" id="modal2">
						<div data-v-78455e2e="" class="layer_container" data-v-0fdfe010="" modal="">
							<a data-v-71b8d4b9="" data-v-78455e2e="" href="#" class="btn_layer_close" modal="">
								<div data-v-71b8d4b9="" data-v-78455e2e="">
									<button>X</button>
								</div>
							</a>
							<div data-v-78455e2e="" class="layer_content" modal="">
								<div data-v-78455e2e="" class="layer_header" modal="">
									<h2 data-v-71b8d4b9="" data-v-78455e2e="" class="title" modal=""> 주소 변경 </h2>
								</div>
								<div data-v-71b8d4b9="" data-v-78455e2e="" class="delivery_bind" modal="">
									<div data-v-71b8d4b9="" data-v-78455e2e="" class="delivery_input" modal="">
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box has_error" data-v-78455e2e="" modal="">
											<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title" modal="">이름</h4>
											<div data-v-4e1fd2e6="" class="input_item" modal="">
												<input data-v-4e1fd2e6="" type="text" placeholder="수령인의 이름" autocomplete="off" class="input_txt" modal="">
											</div>
											<p data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_error" modal="">올바른 이름을 입력해주세요. (2 - 50자)</p>
										</div>
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box" data-v-78455e2e="" modal="">
											<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title" modal="">휴대폰 번호</h4>
											<div data-v-4e1fd2e6="" class="input_item" modal="">
												<input data-v-4e1fd2e6="" type="tel" placeholder="- 없이 입력" autocomplete="off" class="input_txt" modal="">
											</div>
											<p data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_error" modal="">정확한 휴대폰 번호를 입력해주세요.</p>
										</div>
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box" data-v-78455e2e="" modal="">
											<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title" modal="">우편번호</h4>
											<div data-v-4e1fd2e6="" class="input_item" modal="">
												<input data-v-4e1fd2e6="" type="text" placeholder="우편 번호를 검색하세요" readonly="readonly" autocomplete="off" class="input_txt" modal="">
												<a data-v-43813796="" data-v-71b8d4b9="" href="#" class="btn btn_zipcode outline small" data-v-4e1fd2e6="" modal=""> 우편번호 </a>
											</div>
										</div>
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box" data-v-78455e2e="" modal="">
											<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title" modal="">주소</h4>
											<div data-v-4e1fd2e6="" class="input_item" modal="">
												<input data-v-4e1fd2e6="" type="text" placeholder="우편 번호 검색 후, 자동입력 됩니다" readonly="readonly" autocomplete="off" class="input_txt" modal=""></div>
										</div>
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box" data-v-78455e2e="" modal="">
											<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title" modal="">상세 주소</h4>
											<div data-v-4e1fd2e6="" class="input_item" modal="">
												<input data-v-4e1fd2e6="" type="text" placeholder="건물, 아파트, 동/호수 입력" autocomplete="off" class="input_txt" modal="">
											</div>
										</div>
									</div>
									<div data-v-71b8d4b9="" data-v-78455e2e="" class="delivery_check" modal="">
										<div data-v-4c714e9f="" data-v-71b8d4b9="" class="checkbox_item" data-v-78455e2e="" modal="">
											<label data-v-4c714e9f="" for="check1" class="check_label" modal="">
												<input data-v-4c714e9f="" id="check1" type="checkbox" name="" class="" modal="">
ㄴ												<span data-v-4c714e9f="" class="label_txt" modal="">기본 배송지로 설정</span>
											</label>
										</div>
									</div>
								</div>
								<div data-v-71b8d4b9="" data-v-78455e2e="" class="layer_btn" modal="">
									<a data-v-43813796="" data-v-71b8d4b9="" name="closeModal" class="btn btn_delete outlinegrey medium" data-v-78455e2e="" modal="" onclick="modal('modal2')"> 취소 </a>
	<!-- 								<a data-v-43813796="" data-v-71b8d4b9="" disabled="disabled" href="#" class="btn btn_save solid medium disabled" data-v-78455e2e="" modal=""> 저장하기 </a> -->
									<a data-v-43813796="" data-v-71b8d4b9="" name="saveModa1" class="btn btn_save solid medium" data-v-78455e2e="" modal="" onclick="closeModal(event)"> 저장하기 </a>
								</div>
							</div>
						</div>
					</div>
					
				
				
			</div>
		</div>							
	</div>
</div>
</div>
</article>
  
  <nav id="mainNav" class="d-none d-md-block sidebar">
  <%--왼쪽 사이드바 --%>
<%--    <%@ include file="../inc/member_sidebar.jsp"%> --%>

  </nav>
  
  <div id="sieAds"></div>
  <%--페이지 하단 --%>
<%--   <footer id="pageFooter"><%@ include file="assets/inc/footer.jsp"%></footer> --%>
  

  
</body>