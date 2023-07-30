package com.itwillbs.zero.controller;

import java.io.*;
import java.nio.file.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.itwillbs.zero.service.*;
import com.itwillbs.zero.vo.*;

@Controller
public class SecondhandController {

		@Autowired
		private SecondhandService service;
		
		
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
		public String secondhandRegistForm(HttpSession session, Model model) {
//			//미로그인시 "로그인필수"출력 후 이전페이지 돌아감
//			String sId = (String)session.getAttribute("sId");
//			if(sId == null) {
//				model.addAttribute("msg", "로그인 필수!");
//				return "fail_back";
//			}
			
			System.out.println("secondhandRegistForm");
			
			//중고 카테고리 값 전달 
			List<HashMap<String, String>> category=service.getCategory();
			model.addAttribute("categorylist", category);
			
			return "secondhand/secondhand_regist_form";	
		}
		
		
		
		//상품등록처리(POST)(INSERT)
		@ResponseBody
		@PostMapping("secondhandRegistPro")
		public String secondhandRegistPro(SecondhandVO secondhand, HttpSession session, Model model, HttpServletRequest request) {
			
			
			//판매자아이디저장
//			secondhand.setMember_idx((String)session.getAttribute("member_idx"));
			String sId = (String)session.getAttribute("sId");
			System.out.println(sId);
//			session.setAttribute("member_idx", sId);
			
			
//			if(sId == null) {
//				model.addAttribute("msg", "잘못된 접근입니다!");
//				return "fail_back";
//			}
			
			//임시
			secondhand.setMember_idx("test3@test.com");
			
			
			
			//이미지파일업로드==========================================================================
			String uploadDir = "/resources/upload"; 
			//String saveDir = request.getServletContext().getRealPath(uploadDir); // 사용 가능
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			System.out.println("실제 업로드 경로 : "+ saveDir);
			//실제업로드경로 : 
			
			String subDir = ""; // 서브디렉토리(날짜 구분)
			
			try {
				// --------------------------------------------------
				// 업로드 디렉토리를 날짜별 디렉토리로 자동 분류하기(관리편의성,로딩시간단축)
				
				// 1. Date 객체 생성(기본 생성자 호출하여 시스템 날짜 정보 활용)
				Date date = new Date(); // Mon Jun 19 11:26:52 KST 2023
				
				// 2. SimpleDateFormat 클래스를 활용하여 날짜 형식을 "yyyy/MM/dd" 로 지정
				// => 디렉토리 구조로 바로 활용하기 위해 날짜 구분 기호를 슬래시(/)로 지정
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				
				// 3. 기존 업로드 경로에 날짜 경로 결합하여 저장
				subDir = sdf.format(date);
				saveDir += "/" + subDir;
				
				// --------------------------------------------------------------
				// java.nio.file.Paths 클래스의 get() 메서드를 호출하여
				// 실제 경로를 관리하는 java.nio.file.Path 타입 객체 리턴받기
				// => 파라미터 : 실제 업로드 경로
				Path path = Paths.get(saveDir);
				
				// Files 클래스의 createDirectories() 메서드를 호출하여
				// Path 객체가 관리하는 경로 생성(존재하지 않으면 거쳐가는 경로들 중 없는 경로 모두 생성)
				Files.createDirectories(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// VO 객체에 전달된 MultipartFile 객체 꺼내기
			MultipartFile mFile1 = secondhand.getFile1();
			MultipartFile mFile2 = secondhand.getFile2();
			MultipartFile mFile3 = secondhand.getFile3();
			System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());
			System.out.println("원본파일명2 : " + mFile2.getOriginalFilename());
			System.out.println("원본파일명3 : " + mFile3.getOriginalFilename());
			
			// 파일명 중복 방지
			// 현재 시스템(서버)에서 랜덤ID 값을 추출하여 파일명 앞에 붙여서
			// "랜덤ID값_파일명.확장자" 형식으로 중복 파일명 처리
			// => 랜덤ID 생성은 java.util.UUID 클래스 활용(UUID = 범용 고유 식별자)
			String uuid = UUID.randomUUID().toString();
			System.out.println("uuid : " + uuid);
			
			// 생성된 UUID 값을 원본 파일명 앞에 결합(파일명과 구분을 위해 _ 기호 추가)
			// => 나중에 사용자 다운로드 시 원본 파일명 표시를 위해 분리할 때 구분자로 사용
			//    (가장 먼저 만나는 _ 기호를 기준으로 문자열 분리하여 처리)
			// => 단, 파일명 길이 조절을 위해 임의로 UUID 중 맨 앞자리 8자리 문자열만 활용
//			System.out.println(uuid.substring(0, 8));
			// 생성된 UUID 값(8자리 추출)과 업로드 파일명을 결합하여 BoardVO 객체에 저장(구분자로 _ 기호 추가)
			// => 단, 파일명이 존재하는 경우에만 파일명 생성(없을 경우를 대비하여 기본 파일명 널스트링으로 처리)
			secondhand.setSecondhand_image1("");
			secondhand.setSecondhand_image2("");
			secondhand.setSecondhand_image3("");


			// 파일명을 저장할 변수 선언
			String fileName1 = null;
			String fileName2 = null;
			String fileName3 = null;
			
			// 업로드 된 파일 존재시 fileNameN 변수에 
			if(mFile1 != null) {
				fileName1 = uuid.substring(0, 8) + "_" + mFile1.getOriginalFilename();
				secondhand.setSecondhand_image1(subDir + "/" + fileName1);
			}
			if(mFile2 != null) {
				fileName2 = uuid.substring(0, 8) + "_" + mFile2.getOriginalFilename();
				secondhand.setSecondhand_image2(subDir + "/" + fileName2);
			}
			if(mFile3 != null) {
				fileName3 = uuid.substring(0, 8) + "_" + mFile1.getOriginalFilename();
				secondhand.setSecondhand_image1(subDir + "/" + fileName3);
			}
			System.out.println("실제 업로드 파일명1 : " + secondhand.getSecondhand_image1());
			System.out.println("실제 업로드 파일명2 : " + secondhand.getSecondhand_image2());
			System.out.println("실제 업로드 파일명3 : " + secondhand.getSecondhand_image3());
			
			//=========================================================================================
			
			//게시물등록작업
			//SecondhandService - registBoard()
			//파라미터 : SecondhandVO객체, 리턴타입 : int(insertCount)
			System.out.println(secondhand);
			int insertCount = service.registBoard(secondhand);
			
			// 등록결과판별
			// 성공 : 업로드파일 - 실제디렉토리에 이동시킨 후, secondhand_list 서블릿 리다이렉트
			// 실패 : "글쓰기실패" 출력 후 이전페이지 돌아가기 처리
			
			if(insertCount > 0) { //성공
				
				//업로드파일 실제디렉토리 이동작업---------------------------------
				try {
					// 업로드된파일 - MultipartFile객체에 의해 임시디렉토리 저장
					// 글쓰기 성공시 임시->실제디렉토리 이동작업 필요 -> MultipartFile.transferTo()->실제위치 업로드
					// 비어있는파일 이동불가(예외) - 제외
					// -> File객체생성시 지정디렉토리에 지정이름으로 파일이동(생성)
					// 	 => 이동위치의 파일명도 UUID결합 파일명 지정해야함(fileNameN)
					if(!mFile1.getOriginalFilename().equals("")) {
						mFile1.transferTo(new File(saveDir, fileName1));
					}
					
					if(!mFile2.getOriginalFilename().equals("")) {
						mFile2.transferTo(new File(saveDir, fileName2));
					}
					
					if(!mFile3.getOriginalFilename().equals("")) {
						mFile3.transferTo(new File(saveDir, fileName3));
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				// -----------------------------------------------------------------
				
				// 글쓰기 작업 성공 시 글목록(BoardList)으로 리다이렉트
				return "redirect:/BoardList";
				
			} else { // 실패
				model.addAttribute("msg", "글 쓰기 실패!");
				return "fail_back";
			}
		}
		
		
		
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


