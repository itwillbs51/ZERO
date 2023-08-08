<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" -->
<!-- 	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" -->
<!-- 	crossorigin="anonymous"></script> -->
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
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet" type="text/css">



<meta charset="UTF-8">
<title>ZERO</title>

<!-- 후기작성하기 글씨 변경 -->  
<style type="text/css">
.last_title, .secondary_title {
      font-size: 14px; /* 원하는 글자 크기로 변경하세요 (예: 14px) */
    }

/* 평점 별 css */
#myform fieldset {
  display: inline-block;
  border: 0;
}
#myform fieldset legend {
  text-align: right;
}
#myform input[type="radio"] {
  display: none;
}
#myform label {
  font-size: 3em;
  color: transparent;
  text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover {
  color: rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label {
  color: transparent;
}
#myform input[type="radio"]:checked ~ label {
  color: transparent;
}
#myform input[type="radio"]:checked + label {
  color: rgba(250, 208, 0, 0.99);
}
#reviewContents {
  width: 100%;
  height: 150px;
  padding: 10px;
  box-sizing: border-box;
  border: solid 1.5px #d3d3d3;
  border-radius: 5px;
  font-size: 16px;
  resize: none;
}

    
    
</style>


</head>
<body>
	<%--네비게이션 바 영역 --%>
	<header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
	
	<article>
		<div class="container">
			<%-- 사이드바 --%>
			<nav id="mainNav" class="sidebarArea d-none d-md-block sidebar">
				<jsp:include page="/WEB-INF/views/inc/member_sidebar_hyo.jsp"></jsp:include>
			</nav>
			<div class="contentArea">
			<%-- 메인영역 --%>
			<article id="mainArticle">
		<div class="my_purchase">
			<div class="content_title" data-v-88eb18f6="">
				<div class="title" data-v-88eb18f6="">
					<h3 data-v-88eb18f6="">상품구매 내역</h3>
					<!---->
				</div>
				<!---->
			</div>
	<!-- 거래내역 없을때 -->
		<c:if test="${empty myOdShList }">
		<div data-v-412d8616="" class="recent_purchase">
			<div data-v-412d8616="">
				<div data-v-7a02263e="" data-v-412d8616=""
					class="purchase_list all ask">
					<!---->
					<div data-v-6abf8c64="" data-v-7a02263e="" class="empty_area">
						<p data-v-6abf8c64="" class="desc">구매 내역이 없습니다.</p>
						<!---->
					</div>
					<div data-v-7a02263e="" class="v-portal" style="display: none;"></div>
				</div>
				<!---->
			</div>
		</div>
		</c:if>
		
		<!-- 거래내역 있을때 -->
		 <c:if test="${not empty myOdShList }">
                        <div data-v-412d8616="" class="recent_purchase">
                            <div data-v-412d8616="">
                                <div data-v-7a02263e="" data-v-412d8616=""
                                    class="purchase_list all bid">
                                    <!---->
                                    <div data-v-7a02263e="">
                                        <div data-v-e5d3a8ae="" data-v-7a02263e="">
                                            <c:forEach var="myOdShList" items="${myOdShList }">
                                                <div style="position: relative;">
                                                    <div data-v-e5d3a8ae=""
                                                         class="purchase_list_display_item"
                                                         style="background-color: rgb(255, 255, 255); cursor: pointer;"
                                                         onclick="location.href='secondhand_detail?secondhand_idx=${myOdShList.secondhand_idx}&member_id=${myOdShList.order_secondhand_seller}'">
                                                        <div data-v-e5d3a8ae="" class="purchase_list_product">
                                                            <div data-v-e5d3a8ae="" class="list_item_img_wrap">
                                                                <img data-v-e5d3a8ae="" alt="myOdShList_image"
                                                                     src="${pageContext.request.contextPath }/resources/upload/' + myOdShList.secondhand_image1 + '"
                                                                     class="list_item_img"
                                                                     style="background-color: rgb(244, 244, 244);">
                                                                <!---->
                                                            </div>
                                                            <div data-v-e5d3a8ae="" class="list_item_title_wrap">
                                                                <!---->
                                                                <p data-v-e5d3a8ae="" class="list_item_title">${myOdShList.order_secondhand_product}</p>
                                                            </div>
                                                        </div>
                                                        <div data-v-e5d3a8ae="" class="list_item_status">
                                                            <div data-v-e5d3a8ae=""
                                                                 class="list_item_column column_secondary">
                                                                <p data-v-7b1f182e="" data-v-e5d3a8ae=""
                                                                   class="secondary_title display_paragraph"
                                                                   style="color: rgba(34, 34, 34, 0.5);">${myOdShList.order_secondhand_date }</p>
                                                            </div>
                                                            <div data-v-e5d3a8ae="" class="list_item_column column_last">
                                                                <p data-v-7b1f182e="" data-v-e5d3a8ae=""
                                                                   class="last_title display_paragraph"
                                                                   style="color: rgb(34, 34, 34);">${myOdShList.order_secondhand_status }</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <c:if test="${myOdShList.order_secondhand_status == '거래완료'}">
                                                    <a href="javascript:void(0)" data-v-7b1f182e="" data-v-e5d3a8ae=""
													   class="last_title display_paragraph"
													   style="color: rgb(34, 34, 34); 
													   cursor:pointer; position: absolute; bottom: 0; right: 0;" 
													   onclick="openReviewPopup(event, '${myOdShList.order_secondhand_product}', '${myOdShList.order_secondhand_seller}');">
													후기 작성하기
													</a>
                                                    
                                                    </c:if>
                                                </div>
                                            </c:forEach>
                                            <!---->
                                        </div>
                                    </div>
                                    <!---->
                                    <div data-v-7a02263e="" class="v-portal" style="display: none;"></div>
                                </div>
                                <!---->
                            </div>
                        </div>
                    </c:if>
                    <!---->
                </div>
            </article>
        </div>
    </div>
</article>

<!-- 리뷰쓰기 모달 -->
<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="reviewModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reviewModalLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="review-form" action="member_buyList_review" method="post">
        	 <input type="hidden" name="review_writer_id" value="${sessionScope.member_id }"> 
            <div class="form-group">
            <fieldset id="myform" name="member_review_rating">
			  <span class="text-bold">별점을 선택해주세요</span>
			  <input type="radio" name="reviewStar" value="1" id="rate1" />
			  <label for="rate1">★</label>
			  <input type="radio" name="reviewStar" value="2" id="rate2" />
			  <label for="rate2">★</label>
			  <input type="radio" name="reviewStar" value="3" id="rate3" />
			  <label for="rate3">★</label>
			  <input type="radio" name="reviewStar" value="4" id="rate4" />
			  <label for="rate4">★</label>
			  <input type="radio" name="reviewStar" value="5" id="rate5" />
			  <label for="rate5">★</label>
			</fieldset>
            </div>
            <div class="form-group">
		      <label for="message-text" class="col-form-label" id="">리뷰를 남겨주세요 (최대 100자)</label>
		      <textarea class="form-control" id="message-text" name="member_review_content"></textarea>
		      <div class="char-counter text-muted" style="float: right; display: flex;">
		        <div id="currentCount">0</div>
		        <div>&nbsp;/ 100</div>
		      </div>
		    </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary" form="review-form">리뷰 작성</button>
      </div>
    </div>
  </div>
</div>


<script src="${pageContext.request.contextPath }/resources/mypage_js/49ee6ec.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/ac846b6.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/bfcc4c4.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/2ffe3b9.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/e679961.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/514df53.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/afbbed2.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/76e0661.js" defer=""></script>
<link href="${pageContext.request.contextPath }/resources/mypage_css/css/7db96f2.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/bd82ddc.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/81ef50f.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/d2d1f2f.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/8a6891b.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/ddf6c56.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/10a7d17.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/4bb4200.css" rel="stylesheet" type="text/css">

<!-- 후기작성 팝업 -->
<script type="text/javascript">
jQuery.noConflict();
function openReviewPopup(event, order_secondhand_product, member_id) {
  event.preventDefault();
  event.stopPropagation();

  // Show the modal
  $("#reviewModal").modal("show");

  // Set the title (order_secondhand_product and member_id can be used for customization)
  $("#reviewModalLabel").text("상품명 : " + order_secondhand_product);
}

function updateCharCount() {
	  const maxLength = 100;
	  const currentLength = $("#message-text").val().length;
	  const clampedLength = Math.min(currentLength, maxLength);

	  if (currentLength > maxLength) {
	    $("#message-text").val($("#message-text").val().substring(0, maxLength));
	  }

	  $("#currentCount").html(clampedLength);
	}

$(document).ready(function () {
  // 이벤트 바인딩
  $("#message-text").on("input", updateCharCount);
  $(".btn-primary").on("click", submitReview);

  // 초깃값 설정
  updateCharCount();
});

function submitReview() {
	  event.preventDefault();  // 폼의 기본 제출 동작을 막습니다.
	  const messageText = $("#message-text").val();

	  if (!messageText) {
	    alert("리뷰를 작성해주세요.");
	    return;
	  }

	  // AJAX to send data to the server
	  $.ajax({
	    type: "POST",
	    url: "/member_buyList_review",
	    data: {
	      messageText: messageText,
	    },
	    success: function(response){
	      alert("리뷰가 작성되었습니다.");
	      
	      // Close the modal
	      $("#reviewModal").modal("hide");

	      // Clear form fields after submission
	      $("#message-text").val("");
	      updateCharCount();
	    },
	    error: function(){
	      // Handle error appropriately
	      alert("리뷰 작성 실패, 다시 시도해주세요.");
	    }
	  });
	}
</script>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const stars = document.querySelectorAll("#myform input[type=radio]");
    const labels = document.querySelectorAll("#myform label");

    stars.forEach((star, index) => {
      star.addEventListener("change", () => {
        labels.forEach((label, idx) => {
          if (idx <= index) {
            label.style.color = "rgba(250, 208, 0, 0.99)";
          } else {
            label.style.color = "transparent";
          }
        });
      });
    });
  });
</script>

</body>
</html>