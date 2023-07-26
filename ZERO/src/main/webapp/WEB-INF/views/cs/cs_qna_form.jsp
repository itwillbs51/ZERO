<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 드롭박스 시작 -->
<script src="/static/js/bootstrap.bundle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<!-- 드롭박스 끝 -->

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/cs.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>ZERO</title>
<script type="text/javascript">	
	// 전화번호
// 	function isPhoneNum(phone) {
// 		let getPhone = RegExp(/^(010|011)[\d]{3,4}[\d]{4}$/);
		
// 		if(!getPhone.test(phone)) {
// 			$("#phoneCkArea").text("올바른 전화번호를 입력하세요");
// 			$(this).focus();
// 		} else {
// 			$("#phoneCkArea").empty();
// 			$("button[type='submit']").attr("disabled", false);
// 		}
// 	}
</script>
<style type="text/css">
 .cs_qna_mal {
	text-align: end;
 }
 
 /* 셀렉트 박스 CSS */
 select {
 	width: 200px;
 }
 
 /* 파일 업로드 관련 css 시작 */
input[type=file]::file-selector-button {
  width: 150px;
  height: 30px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  cursor: pointer;
}

input[type=file]::file-selector-button:hover {
	background: rgb(77,77,77);
    color: #fff;
}
 /* 파일 업로드 관련 css 끝 */
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
					<div class="form-group">
						<div class="content_title border">
							<div class="title">
								1 : 1 문의
							</div>
						</div>
						
						<div class="content_main">
							<div class="cs_qna_mal">
								<em style="color: #EB323A;">*</em>  는 필수 입력 항목 입니다. <br>
								이미지는 JEPG, JPG, PNG만 가능합니다.
							</div>
							<form action="csQnaPro" method="post" name="fr" enctype="multipart/form-data">
								<table class="table" >
									<tr>
										<th>
										  	문의 유형 &nbsp; <em style="color: #EB323A;">*</em> 
										</th>
										<td>
											<select name="cs_type" required="required">
								   				<option value="">선택</option>
												<option value="중고거래문의">중고거래문의</option>
												<option value="경매문의">경매문의</option>
												<option value="ZPAY문의">ZPAY문의</option>
												<option value="ZMAN문의">ZMAN문의</option>
												<option value="회원문의">회원문의</option>
												<option value="기타문의">기타문ㄴ의</option>
											</select>
<!-- 											<div class="dropdown"> -->
<!-- 											  <button class="btn btn-dark dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" name="cs_type" required="required"> -->
<!-- 											   	문의 유형을 선택하세요 -->
<!-- 											  </button> -->
<!-- 											  <ul class="dropdown-menu"> -->
<!-- 											    <li><a class="dropdown-item" value="">선택</a></li> -->
<!-- 											    <li><a class="dropdown-item" value="중고거래문의">중고거래문의</a></li> -->
<!-- 											    <li><a class="dropdown-item" value="경매문의">경매문의</a></li> -->
<!-- 											    <li><a class="dropdown-item" value="ZPAY문의">ZPAY문의</a></li> -->
<!-- 											    <li><a class="dropdown-item" value="ZMAN문의">ZMAN문의</a></li> -->
<!-- 											    <li><a class="dropdown-item" value="회원문의">회원문의</a></li> -->
<!-- 											    <li><a class="dropdown-item" value="기타문의">기타문의</a></li> -->
<!-- 											  </ul> -->
<!-- 											</div> -->
										</td>
							 		</tr>
							 		<tr>
										<th>
											아이디&nbsp;<em style="color: #EB323A;">*</em>&nbsp;&nbsp;&nbsp;
<!-- 											<label for="staticEmail" class="col-sm-2 col-form-label">아이디</label> -->
										</th>
										<td>
											<%-- 회원만 글쓰기 --%>
											<%-- 아이디(이메일주소)는 읽기전용 --%>
    										<div class="col-sm-10">
										    	<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="Dolly@zero.co.kr">
										    </div>
										</td>
									</tr>
<!-- 									<tr> -->
<!-- 										<th> -->
<!-- 											휴대전화&nbsp;<em style="color: #EB323A;">*</em>  -->
<!-- 										</th> -->
<!-- 										<td> -->
<!-- 											<input type="text" name="cs_phone" width="3em" maxlength="11" required="required" onkeyup="isPhoneNum(this.value)"> -->
<!-- 											<span id="phoneCkArea"></span> -->
<!-- 											<input type="text" name="phone-number1" width="3em" maxlength="3"> -->
<!-- 											-<input type="text" name="phone-number2" width="5em" maxlength="4"> -->
<!-- 											-<input type="text" name="phone-number3" width="5em"  maxlength="4"> -->
<!-- 										</td> -->
<!-- 									</tr> -->
							  		<tr>
							    		<th>
							    			제목&nbsp;<em style="color: #EB323A;">*</em>
							    		</th>
							    		<td>
							    			 <input type="cs_subject" class="form-control" id="inputPassword" required="required">
<!-- 							    			<textarea rows="1" cols="20" name="cs_subject" required="required" maxlength="30"></textarea> -->
							    		</td>
							  		</tr>
							  		<tr>
							    		<th>
								    		내용&nbsp;<em style="color: #EB323A;">*</em>
								    	</th>
								    	<td>
								    		 <textarea class="form-control" id="floatingTextarea2" style="height: 100px" required="required"
								    		 placeholder="-문의내용에 개인정보가 포함되지 않도록 유의하시기 바랍니다.&#13;&#10;-회원로그인 후 문의작성시 나의 문의내역을 통해 답변을 확인하실 수 있습니다."></textarea>
<!-- 								    		<textarea rows="5" cols="70" name="cs_content" required="required" -->
<!-- 								    			placeholder="-문의내용에 개인정보가 포함되지 않도록 유의하시기 바랍니다.&#13;&#10;-회원로그인 후 문의작성시 나의 문의내역을 통해 답변을 확인하실 수 있습니다."></textarea> -->
							    		</td>
							  		</tr>
							  		<tr>
							    		<th>
							    			이미지 첨부
							    		</th>
							    		<td>
							    			<%-- 만일 특정파일 유형만 허용하려면 accpet 속성을 사용한다 --%>
							    			<%-- 사진 파일 1개만 업로드 허용 --%>
							    			<input type="file" name="cs_file" id="cs_file" accept=".JEPG, .JPG, .PNG">
							    		</td>
							  		</tr>
							  		<tr>
								  		<td colspan="2" style="text-align: center">
											<button class="btn btn-dark" disabled="disabled" type="submit">등록</button>	
								  		</td>
							  		</tr>
								</table>
							</form>
						</div><!-- content_main 끝 -->
					</div>
				</div>
			</div>
		</div>
	</article>
	<footer>
	
	</footer>
</body>
</html>