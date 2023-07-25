package com.itwillbs.zero.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class SecondhandController {

	
		//중고상품목록페이지
		//날짜순 기본정렬
	
		@GetMapping("secondhand_list")
		public String secondhand_list() {
			return "secondhand/secondhand_list";
		}
		
		//상품 상세정보페이지
		@GetMapping("secondhand_detail")
		public String secondhand_detail() {
			return "secondhand/secondhand_detail";
		}
		
		
		//상품등록폼 이동
		@GetMapping("secondhandRegistForm")
		public String secondhandRegistForm() {
			return "secondhand/secondhand_regist_form";	
		}
		
		
		//상품등록처리(POST)(INSERT)
		
		
		//상품수정하기폼 이동
		@GetMapping("secondhandModifyForm")
		public String secondhandModifyForm() {
			return "secondhand/secondhand_modify_form";
		}
		
		//상품수정 처리(UPDATE)
		
		
		
		//끌어올리기(UPDATE - DATE)
		//DB의 registdate날짜 업데이트하기
		@GetMapping("secondhandUpdateDate")
		public String secondhandUpdateDate() {
			//날짜업데이트후 secondhand_list페이지로 리다이렉트(서블릿-서블릿)
			return "secondhand/secondhand_list";
		}
		
		
		
		//상품삭제 처리(DELETE)
		@GetMapping("secondhandDelete")
		public String secondhandDelete(
//				@RequestParam int board_num, 
//				@RequestParam(defaultValue = "1") int pageNum, 
//				HttpSession session, Model model
				) {
		
//			// 세션 아이디가 존재하지 않으면(미로그인) "잘못된 접근입니다!" 출력 후 이전 페이지 돌아가기 처리
//			String sId = (String)session.getAttribute("sId");
//			if(sId == null) {
//				model.addAttribute("msg", "잘못된 접근입니다!");
//				return "fail_back";
//			}

			
			// SecondhandService - isWriter()작성자 판별요청
			// 파라미터:글번호, 세션아이디 리턴타입:boolean(isWriter)
			// 단, 세션아이디가 "admin" 아닐 경우에만 수행
//			if(!sId.equals("admin")) {
//				boolean isBoardWriter = service.isBoardWriter(board_num, sId);
//				
//				if(!isBoardWriter) {
//					model.addAttribute("msg", "권한이 없습니다!");
//					return "fail_back";
//				}
//			}
			
			
			// SecondhandService - removeBoard() 호출하여 글 삭제요청
			// 파라미터 : 글번호, 리턴타입 : int(deleteCount)
//			int deleteCount = service.removeBoard(board_num);
			
			// 삭제 실패 시 "삭제 실패!" 처리 후 이전페이지 이동
			// 아니면, BoardList 서블릿 요청(파라미터 : 페이지번호)
			
			
			
			// 서블릿 => 서블릿 : redirect
//			return "redirect:/secondhand_list?pageNum=" + pageNum;
			
			return "";
		}
		
		
		//판매자페이지
		@GetMapping("secondhandSeller")
		public String secondhand_seller_page() {
			return "secondhand/secondhand_seller_page";
		}
		
		
		//신고하기 팝업 이동(모달?)
		@GetMapping("reportPopup")
		public String reportPopup() {
			return "secondhand/report_popup";
		}
		
		//신고 등록작업(INSERT)
		
		
		
		//
		
		
}


