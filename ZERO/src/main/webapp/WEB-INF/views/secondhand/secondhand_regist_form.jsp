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
<link href="${pageContext.request.contextPath }/resources/css/defualt.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<%-- 반응형웹페이지위한 설정 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">

</script>
<style>
article {
	margin-top: 150px;
}
a {
	color:black;
}
.container {
	position: relative;
	margin-top: 100px;

 	min-height: 1000px;
	text-align: center;
/* 	background: gray; */
}

table{
	margin-top:30px;
}


	/* 이미지 미리보기 css */
	#img_preview0, #img_preview1, #img_preview2, #img_preview3, #img_preview4, #img_preview5{
		display: none;
		position: relative;
		margin:5px;
		width: 150px;
		height: 150px; 
		
/* 		border: 2px solid black; */
	
	}
	/* 미리보기 삭제버튼 css */
	#sum_style{
		text-align:center;
		width:75px;
		height:20spx;
	    position:absolute; 
		font-size:12px;
		outline:none;
		border:none;
		border-radius:15px;
	    right:70px;
	    bottom:130px;
	    /* z-index:1; */
	    background-color:rgba(0,0,0,0.5);
	    color:white;
	}
	.chk_style{
		vertical-align: middle;
		text-align:center;
		
		width:28px;
		height:28px;
	    position:absolute; 
		/* font-size:20px; */
		outline:none;
		border:none;
		border-radius:18px;
	    right:9px;
	    bottom:115px;
	    /* z-index:1; */
	    background-color:rgba(0,0,0,0.5);
	    color:#ffcccc;
	}
	
		
	/* 미리보기 삭제 css */
	#del_img1, #del_img2, #del_img3, #del_img4, #del_img5,#del_sum{
		cursor: pointer;
		display: none;
	}
	
	#imgup{
		margin-top: 5px;
	}
	
	/* 이미지 미리보기 css */
	#imgup_1,#imgup_2, #imgup_3, #imgup_4, #imgup_5,#imgup_sum {
		cursor: pointer;
		display: none;
	}
	
	
	.input-tag:focus{
		outline: none;
		border: 1px solid black;
	}
</style>

<title>Insert title here</title>
</head>

<body>
<header><%@ include file="../inc/header.jsp"%></header>

<article id="mainArticle">
	<div class="container">
		<section id="writeForm">
			<h1> 상품 등록 </h1>
			
			
			<%-- 파일 업로드를 위해 enctype 속성값을 "multipart/form-data" 로 설정 --%>
			<form action="secondhandRegistPro" name="writeForm" method="post" enctype="multipart/form-data">
				<table>
				
				<!-- 기본정보 -->
				<tr>
					<td colspan="2" align="left">
						<span class="pro_info">기본정보</span>&nbsp;&nbsp;&nbsp; 
						<span style="font-size: 14px; color: red">*필수항목</span>
					</td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				
				
				<!-- 이미지영역 -->
				<tr>
					<td class="td1" align="left" ><span
						class="pro_info">상품이미지</span> 
						<span class="pro_info" id="img_number">(0/3)</span>
						<span style="color: red">*</span>
						<input type="image" id="imgup" onclick="img_preview();"
								src="${ pageContext.request.contextPath }/resources/img/image_upload.png" width="150px" height="150px">
						</td>
					<td class="td2" align="left">
					
						<!-- 이미지 등록 영역 -->
						<div id="img_zone">
							<div id="img_preview0" >
								<input type="image" id="imgup_sum" onclick="send_0();"
									src="" width="150px" height="150px">
								<span id="sum_style" >대표 이미지</span>
								<!-- 삭제버튼 -->
								<span id="del_sum" class="chk_style"  onclick="del_sum();">x</span>
							</div>
							
								
							<div id="img_preview1" >
								<input type="image" id="imgup_1" onclick="send_1();"
									src="" width="150px" height="150px">
								<!-- 삭제버튼 -->
								<span id="del_img1" class="chk_style" onclick="del_img1();">x</span>
							</div>
							
							<div id="img_preview2">
								<input type="image" id="imgup_2" onclick="send_2();"
									src="" width="150px" height="150px">
								<span id="del_img2" class="chk_style" onclick="del_img2();">x</span>
							</div>
						</div>
						<div id="img_intro">
								
								* <b>대표 이미지</b>는 반드시 <font color="red"><b>등록</b></font>해야 합니다.<br>
								- 이미지를 <b>클릭할</b> 경우 이미지를 <b>수정</b>하실 수 있습니다.<br>
								- 이미지 등록은 좌측 <b>이미지 등록</b>을 눌러 등록할 수 있습니다.<br>
								- 이미지 확장자는 <b>.jpg, .jpeg, .png</b> 만 등록 가능합니다.
							</div>
					</td>
				</tr>
				<tr><td colspan="2"><hr></td></tr><!-- 이미지영역끝 -->
				
				
				
				
				
				
				
					<tr>
						<td class="td_left"><label for="board_name" disabled="disabled">글쓴이</label></td>
						<td class="td_right"><input type="text" name="board_name" required="required" readonly="readonly" value=" ${sessionScope.sId }"/></td>
					</tr>
					
	<!-- 				<tr> -->
	<!-- 					<td class="td_left"><label for="board_pass">비밀번호</label></td> -->
	<!-- 					<td class="td_right"> -->
	<!-- 						<input type="password" name="board_pass" required="required" /> -->
	<!-- 					</td> -->
	<!-- 				</tr> -->
					<tr>
						<td class="td_left"><label for="board_subject">제목</label></td>
						<td class="td_right"><input type="text" name="board_subject" required="required" /></td>
					</tr>
					<tr>
						<td class="td_left"><label for="board_content">내용</label></td>
						<td class="td_right">
							<textarea id="board_content" name="board_content" cols="40" rows="15" required="required"></textarea>
						</td>
					</tr>
					<tr>
						<td class="td_left"><label for="board_file">파일 첨부</label></td>
						<!-- 파일 첨부 형식은 input 태그의 type="file" 속성 사용 -->
						<!-- 최대 3개파일 업로드 가능 -->
						<td class="td_right">
							<input type="file" name="file1" /><br>
							<input type="file" name="file2" /><br>
							<input type="file" name="file3" /><br>
						</td>
					</tr>
				</table>
				<section id="commandCell">
					<input type="submit" value="등록">&nbsp;&nbsp;
					<input type="reset" value="다시쓰기">&nbsp;&nbsp;
					<input type="button" value="취소" onclick="history.back()">
				</section>
			</form>
			
			
		</section>
	</div>
</article>


</body>
</html>