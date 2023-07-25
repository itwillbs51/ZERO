<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Insert title here</title>
<script type="text/javascript">


//페이지 들어올때 이상품이 찜이 되어있는지 아닌지 거래중인지 아닌지 확인
	$(function(){
		
		var p_idx = $("#p_idx").val();
		var u_idx = $("#buyer_u_idx").val();
		
		// user가 찜한 상품인지 체크
		$.ajax({
			
			url		: 'jjimCheck.do',
			type	: 'POST',
			data	: {'p_idx':p_idx, 'u_idx':u_idx},
			success	: function(res){
				
				if(res.result){
					$("#jjim_off").css('display','inline-block');
					
				}else{
					$("#jjim_on").css('display','inline-block');
				
				}
				
			}
			
		});
		// 거래중 상품인지 확인
		$.ajax({
			
			url		: 'tradeCheck.do',
			type	: 'POST',
			data	: {'p_idx':p_idx, 'u_idx':u_idx},
			success	: function(res){
				
				if(res.result){
					$("#cancel_trade").css('display','inline-block');
				}else{
					$("#trade_on").css('display','inline-block');
				}
			},
			error	: function(err){
				alert('상품정보 불러오기에 실패했습니다. 관리자에게 문의 해주세요.')
			}
		
		
		
		});
		
		$.ajax({
			
			url		: 'jjimCount.do',
			type	: 'POST',
			data	: {'p_idx':p_idx},
			success	: function(res_data){
				
				$("#jjim_count").html(res_data)
				
			},
			error	: function(err){
				alert('상품정보 불러오기에 실패했습니다.')
			}
			
		})
		
		
		
	})
		


//	찜기능 on
	function jjimOn(){
		
		
		var p_idx = $("#p_idx").val();
		var u_idx = $("#buyer_u_idx").val().trim();
		
		if(u_idx==''){
			
			if(confirm("로그인후 이용가능 합니다.\n로그인 하시겠습니까?")==false) return;
			
			location.href="../user/login_form.do?url=" + encodeURIComponent(location.href);
			
			return;
		}
		
		
		$.ajax({
			
			url	     : 'jjimon.do',
			type	 : 'POST',
			data     : {"p_idx":p_idx, "u_idx":u_idx},
			success	 : function(res){
				
				if(res.result){
					
					$("#jjim_on").css('display','none');
					$("#jjim_off").css('display','inline-block');
					
					
					$.ajax({
			
								url		: 'jjimCount.do',
								type	: 'POST',
								data	: {'p_idx':p_idx},
								success	: function(res_data){
									
									$("#jjim_count").html(res_data)
									
								},
								error	: function(err){
									alert('상품정보 불러오기에 실패했습니다.')
								}
								
							})
										
					
					
					
				}else{
					
					alert('찜 등록을 실패하였습니다. 관리자에게 문의하세요');
				
				}
				
			},error	 : function(err){
				alert('찜 등록을 실패하였습니다. 관리자에게 문의하세요');
			}
			
		});
		
		
		
	}


	//찜기능 off
	function jjimOff(){
		
		var p_idx = $("#p_idx").val();
		var u_idx = $("#buyer_u_idx").val().trim();
		
		
		$.ajax({
			
			url	     : 'jjimoff.do',
			type	 : 'POST',
			data     : {"p_idx":p_idx, "u_idx":u_idx},
			success	 : function(res){
				
				if(res.result){
					
					$("#jjim_off").css('display','none');
					$("#jjim_on").css('display','inline-block');
					
					$.ajax({
			
								url		: 'jjimCount.do',
								type	: 'POST',
								data	: {'p_idx':p_idx},
								success	: function(res_data){
									
									$("#jjim_count").html(res_data)
									
								},
								error	: function(err){
									alert('상품정보 불러오기에 실패했습니다.')
								}
								
						})
					
					
					
				}else{
					
					alert('찜 해제을 실패하였습니다. 관리자에게 문의하세요');
				
				}
				
			},error	 : function(err){
				alert('찜 해제을 실패하였습니다. 관리자에게 문의하세요');
			}
			
		});
		
	}
	
	
	// 거래하기기능
	function trade(p_idx){
		
		var seller_u_idx = $("#seller_u_idx").val();
		var buyer_u_idx = $("#buyer_u_idx").val();
		
		if(buyer_u_idx==''){
			
			if(confirm("로그인후 이용가능 합니다.\n로그인 하시겠습니까?")==false) return;
			
			location.href="../user/login_form.do?url=" + encodeURIComponent(location.href);
			
			return;
		}
		
		if(seller_u_idx==buyer_u_idx){
			alert('본인이 올린 상품은 구매할 수 없습니다.');
			return false;
		}
		
		
		if(!confirm('상품을 구매하시겠습니까?')) return;
		
		
		$.ajax({
		
			url		:  'trade.do',
			type	: 'POST',
			dataType: 'json',
			data	: {
						"seller_u_idx":seller_u_idx, 
						"buyer_u_idx":buyer_u_idx, 
						"p_idx":p_idx},
			success : function(res){
				
				
				if(res.result==1){
					window.location.reload();
				}else if(res.result==0){
					alert('상품 구매시 문제가 발생했습니다. 관리자에게 문의하세요.');
				}else if(res.result==2){
					alert('탈퇴한 회원의 상품입니다.');
					return;
				}
				
			},
			error	: function(err){
				alert('상품 구매시 문제가 발생했습니다. 관리자에게 문의하세요.');
			}
			
		});
		
		
		
	}
	
	function cancelTrade(p_idx){
		
		if(!confirm('거래를 취소 하시겠습니까?')) return false;
		
		$.ajax({
			
			url		: 'tradeCancel.do',
			data	: {'p_idx':p_idx},
			type	: 'POST',
			success	: function(res){
				
				if(res.result){
					window.location.reload();
				}else{
					alert('거래취소를 실패했습니다. 관리자에게 문의하세요.');	
				}
				
			},
			error	: function(err){
				alert('거래취소를 실패했습니다. 관리자에게 문의하세요.');
			}
			
			
		})
		
		
		
	}
	
	
	
	//판매하기
	function sell(p_idx){
		
		if(!confirm('상품을 판매하시겠습니까?')) return;
		
		$.ajax({
			
			url		: 'product_sell.do',
			type	: 'POST',
			data	: {"p_idx" : p_idx},
			success	: function(res){
				
				if(res.result){
					window.location.reload();
				}else{
					alert('상품 구매시 문제가 발생했습니다. 관리자에게 문의하세요.');
				}
				
			},
			error	: function(err){
				
				alert("상품판매시 문제가 발생했습니다. 관리자에게 문의하세요.");
				
			}
			
			
		});		
	}
	
	function delete_product(p_idx, u_idx){
	  if(!confirm('정말 상품을 삭제하시겠습니까?')) return;
	  
		
		$.ajax({
			
			url		: 'delete.do',
			type	: 'POST',
			data	: {'p_idx':p_idx, 'u_idx':u_idx},
			success	: function(res){
				
				if(res.result){
					
					alert('상품을 삭제했습니다.');
					location.href = '../mainpage/list.do';
					
				}else{
					
					alert('상품 삭제에 실패했습니다. 관리자에게 문의해주세요.')
				
				}
				
				
			},
			error	: function(err){
				alert('상품 삭제에 실패했습니다. 관리자에게 문의해주세요.')
			}
			
		})

	

	}
</script>
<style>
@charset "UTF-8";

	#report_popup{
		width: 300px;
		height: 390px;
		
		position:absolute;
		
		z-index:890;
		
		
		padding: 10px;
		/* border: 2px solid black; */
		
		left: 400px; 
		top: 200px;
		
		 background-color : white;
		
		
		/* box-shadow: 2px 2px 3px black; */
		
		/* 나중에 수정해야함 none으로 */
		display: none;
		
	}
	
	#x_button{
		background: white;
		color: black;
		margin-bottom: 5px;
		font-size: 25px;
		
		vertical-align : top;
		
		border: none;
		
	}
	
	#popup_title {
		margin-bottom: 5px;
		font-size: 30px;
		font-family: 맑은굴림;
	}

	.report_box{
		
	
		display: inline-block;
		
		outline: 1px solid rgb(240,240,240);
		
		margin-bottom: 10px;
		
		width: 95%;
		height: 50px;
		
		vertical-align: middle;
		
		text-align: left;
		
	}
	
	/* 쉐도우 효과*/
	.shadow {
		position: fixed;
		left: 0;
		top: 0;
		background: rgba(0, 0, 0, 0.52);
		width: 100%;
		height: 100vh;
		display: none;
		z-index: 889;
	}
	
	input[name="report"]{
		margin-top: 20px;
		margin-left: 10px;
		margin-right: 5px;

	}
	
	.report_reason{
		font-family: 맑은굴림;
		font-size: 13px;
	}

</style>
</head>
<body>

<div id="report_popup" align="center">
		<div style="text-align: right;">
			<input type="button" value="x" id="x_button"
				onclick="hide_report_popup();">
		</div>
		<span id="popup_title">신고사유</span>
		<div align="center" style="margin-bottom:10px; ">
			<div class="report_box">
				<input type="checkbox" value="re_add_cnt" name="report" onclick="doOpenCheck(this);">
				<span class="report_reason">1.광고</span>
			</div>
			<div class="report_box">
				<input type="checkbox" value="re_fake_cnt" name="report" onclick="doOpenCheck(this);">
				<span class="report_reason">2.가품 / 상품 부정확</span>
			</div>
			<div class="report_box">
				<input type="checkbox" value="re_inhibit_cnt" name="report" onclick="doOpenCheck(this);">
				<span class="report_reason">3.거래금지품목(담배/주류/음란물 등..)</span>
			</div>
				<div class="report_box">
					<input type="checkbox" value="re_scam_cnt" name="report" onclick="doOpenCheck(this);">
					<span class="report_reason">4.사기</span>
				</div>
		</div>
		
		<div align="center">
			<input class="btn" type="button" value="신고하기" onclick="send_report();">
			<input class="btn" type="button" value="취소" onclick="hide_report_popup();">
		</div>
	</div>
</body>
</html>