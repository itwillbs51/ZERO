package com.itwillbs.zero.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.zero.controller.AdminController;
import com.itwillbs.zero.mapper.AuctionMapper2;
import com.itwillbs.zero.service.AdminService;
import com.itwillbs.zero.vo.AuctionManagingVO;
import com.itwillbs.zero.vo.CsVO;
import com.itwillbs.zero.vo.MemberVO;
import com.itwillbs.zero.vo.ReportVO;
import com.itwillbs.zero.vo.ZmanDeliveryVO;
import com.itwillbs.zero.vo.ZmanVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// 로그 출력을 위한 변수 선언 => getLogger() 메서드 파라미터로 로그 처리할 현재 클래스 지정
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	// 관리자 - 메인페이지로 디스패치
	@GetMapping("admin_main")
	public String adminMain() {
		System.out.println("AdminController - adminMain");
		
		return "admin/admin_main";
	}
	
	// ============================= 회원관리 ==========================================================
	// 회원관리 - 회원목록 페이지로 디스패치
	@GetMapping("admin_member_list")
	public String adminMemberList() {
		System.out.println("AdminController - adminMemberList");
		
		return "admin/admin_member_list";
	}
	
	// 회원관리 - 회원목록 페이지에 회원목록 가져오기
	@ResponseBody
	@GetMapping("GetMemberList")
	public String getMemberList() {
		System.out.println("AdminController - getMemberList()");
		
		List<MemberVO> memberList = service.getMemebrList();
		System.out.println(memberList);
		
		JSONArray json = new JSONArray(memberList);
		System.out.println(json);
		
		return json.toString();
		
	}

	// 회원관리 - 회원 정보 조회
	@GetMapping("GetMember")
	public String getMemebr(String member_idx, Model model) {
		System.out.println("AdminController - getMemebr");
		
		int memberIdx =  Integer.parseInt(member_idx);
		
		MemberVO member = service.getMember(memberIdx);
		int memberReportCount = service.getMemberReportCount(member.getMember_id());
		System.out.println(member);
		model.addAttribute("member", member);
		model.addAttribute("memberReportCount", memberReportCount);
		
		return "admin/admin_member_detail";
	}
	
	// 회원관리 - 회원 정보 삭제
	@GetMapping("admin_member_delete")
	public String adminMemberDelete(@RequestParam int member_idx, Model model) {
		System.out.println("AdminController - adminMemberDelete()");
		System.out.println(member_idx);
		
		int deleteCount = service.removeMember(member_idx);
		
		if(deleteCount > 0) {
			return "redirect:/admin_member_list";			
		} else {
			model.addAttribute("msg", "회원 삭제 실패");
			return "fail_back";
		}
		
	}

	// 회원관리 - 회원 정보 수정
	@PostMapping("admin_member_modify")
	public String adminMemberUpdate(MemberVO member, Model model) {
		System.out.println("AdminController - adminMemberModify()");
		System.out.println(member);
		
		int updateCount = service.modifyMember(member);
		
		if(updateCount > 0) {
			return "redirect:/admin_member_list";			
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패");
			return "fail_back";
		}
		
	}
	
	// 회원관리 - 회원신고 페이지로 디스패치
	// 회원정보 상세보기 페이지에서 [피신고내역 상세보기]를 위해 파라미터 값 설정
	@GetMapping("admin_member_report")
	public String adminMemberReport(@RequestParam(defaultValue = "") String reported_member_id, Model model) {
		System.out.println("AdminController - adminMemberReport");
		
		List<ReportVO> reportList = service.getMemberReportList(reported_member_id);
		model.addAttribute("reportList", reportList);
		
		return "admin/admin_member_report";
	}
	
	// 회원관리 - 회원 신고 정보 조회
	@GetMapping("admin_member_report_detail")
	public String adminMemberReportDetail(int report_idx, Model model) {
		System.out.println("AdminController - adminMemberReportDetail");
				
		ReportVO report = service.getMemberReportDetail(report_idx);
		System.out.println(report);
		model.addAttribute("report", report);
		
		return "admin/admin_member_report_detail";
	}

	// 회원관리 - 회원 신고 정보 수정(처리상태 변경)
	@PostMapping("admin_member_report_status_modify")
	public String adminMemberReportUpdate(ReportVO report, Model model) {
		System.out.println("AdminController - adminMemberReportUpdate()");
		
		int updateCount = service.modifyReport(report);
		
		if(updateCount > 0) {
			return "redirect:/admin_member_report";			
		} else {
			model.addAttribute("msg", "회원 신고 상태 수정 실패");
			return "fail_back";
		}
		
	}
	
	// 회원관리 - 회원리뷰 페이지로 디스패치
	@GetMapping("admin_member_review")
	public String adminMemberReview() {
		System.out.println("AdminController - adminMemberReview");
		
		return "admin/admin_member_review";
	}
	
	
	// ============================= ZMAN 관리 =======================================================================================
	// zman관리 - zman 목록 페이지로 디스패치
	@GetMapping("admin_zman_list")
	public String adminZmanList(Model model) {
		System.out.println("AdminController - adminZmanList");
		
		List<ZmanVO> zmanList = service.getZmanList();
		System.out.println(zmanList);
		
		model.addAttribute("zmanList", zmanList);
		
		return "admin/admin_zman_list";
	}
	
	// zman관리 - zman 정보 조회
	@GetMapping("admin_zman_detail")
	public String getZman(String zman_idx, Model model) {
		System.out.println("AdminController - getZman");
		
		int zmanIdx =  Integer.parseInt(zman_idx);
		
		ZmanVO zman = service.getZman(zmanIdx);
//		int memberReportCount = service.getMemberReportCount(member.getMember_id());
//			System.out.println(member);
		model.addAttribute("zman", zman);
//		model.addAttribute("memberReportCount", memberReportCount);
		
		return "admin/admin_zman_detail";
	}
	
	// zman관리 - zman 정보 삭제
	@GetMapping("admin_zman_delete")
	public String adminZmanDelete(@RequestParam int zman_idx, Model model) {
		System.out.println("AdminController - adminZmanDelete()");
		System.out.println(zman_idx);
		
		int deleteCount = service.removeZman(zman_idx);
		
		if(deleteCount > 0) {
			return "redirect:/admin_zman_list";			
		} else {
			model.addAttribute("msg", "zman 삭제 실패");
			return "fail_back";
		}
		
	}

	// zman관리 - zman 정보 수정
	@PostMapping("admin_zman_modify")
	public String adminZmanModify(ZmanVO zman, Model model) {
		System.out.println("AdminController - adminZmanModify()");
		
		int updateCount = service.modifyZman(zman);
		
		if(updateCount > 0) {
			return "redirect:/admin_zman_list";			
		} else {
			model.addAttribute("msg", "zman 정보 수정 실패");
			return "fail_back";
		}	
	}
	
	// zman관리 - zman 배달 내역 페이지로 디스패치
	@GetMapping("admin_zman_delivery_list")
	public String adminZmanDeliveryList(HttpSession session, Model model) {
		System.out.println("AdminController - adminZmanDeliveryList");
		
		ZmanDeliveryVO zmanDeliveryList = service.getDeliveryList();
		model.addAttribute("zmanDeliveryList", zmanDeliveryList);
		
		return "admin/admin_zman_delivery_list";
	}

	// zman관리 - zman 신고 페이지로 디스패치
	@GetMapping("admin_zman_report")
	public String adminZmanReport() {
		System.out.println("AdminController - adminZmanReport");
		
		return "admin/admin_zman_report";
	}

	// ============================= 중고거래 관리 =======================================================================================
	// 중고거래관리 - 중고거래 목록 페이지로 디스패치
	@GetMapping("admin_secondhand_list")
	public String adminSecondhandList() {
		System.out.println("AdminController - adminSecondhandList");
		
		return "admin/admin_secondhand_list";
	}
	
	// 경매관리 - 경매예정 상품 목록 페이지로 디스패치
	@GetMapping("admin_auction_managing_list")
	public String adminAuctionManagingList(Model model) {
		System.out.println("AdminController - adminAuctionManagingList");
		
		List<AuctionManagingVO> auctionManagingList = service.getAuctionManagingList();
		System.out.println(auctionManagingList);
		
		model.addAttribute("auctionManagingList", auctionManagingList);
		
		return "admin/admin_auction_managing_list";
	}

	// ============================= 경매 관리 =======================================================================================
	// 경매관리 - 경매예정 상품 상세보기
	@GetMapping("admin_auction_managing_detail")
	public String adminAuctionManagingDetail(@RequestParam int auction_idx, Model model) {
		System.out.println("AdminController - adminAuctionManagingDetail");
		
		Map<String, String> auctionManaging = service.getAuctionManaging(auction_idx);
		System.out.println(auctionManaging);
		
		model.addAttribute("auctionManaging", auctionManaging);
		
		return "admin/admin_auction_managing_detail";
	}
	
	// 경매관리 - 경매예정 상품 정보 수정
	@PostMapping("admin_auction_mangaing_modify")
	public String adminAuctionMangaingModify(AuctionManagingVO auctionManaging, Model model) {
		System.out.println("AdminController - adminAuctionMangaingModify()");
		
		int updateCount = service.modifyAuctionManaging(auctionManaging);
		
		if(updateCount > 0) {
			return "redirect:/admin_auction_managing_list";			
		} else {
			model.addAttribute("msg", "경매 예정 상품 정보 수정 실패");
			return "fail_back";
		}
		
	}
	
	// 부트스트랩 테이블 예제
	@GetMapping("tables_ex")
	public String tables_ex() {
		System.out.println("AdminController - tables_ex");
		
		return "admin/tables_ex";
	}
	
	// 부트스트랩 파이차트 예제
	@GetMapping("charts_ex")
	public String charts_ex() {
		System.out.println("AdminController - charts_ex");
		
		return "admin/charts_ex";
	}
	
	
	//============================= 고객센터 관리 =======================================================================================

	// 고객센터관리 - admin_cs_notice_list.jsp로 디스패치
	@GetMapping("admin_cs_notice_list")
	public String adminCsNoticeList(Model model) {
		System.out.println("AdminController - adminCsNoticeList");
		
		List<CsVO> csList = service.getCsList();
		model.addAttribute("csList", csList);
		
		return "admin/admin_cs_notice_list";
	}

	// 고객센터관리 - admin_cs_notice_form.jsp로 디스패치
	@GetMapping("admin_cs_notice_write_form")
	public String adminCsNoticeForm() {
		System.out.println("AdminController - adminCsNoticeForm");
		
		return "admin/admin_cs_notice_write_form";
	}

	// 고객센터관리 - 공지사항 글쓰기
	@PostMapping("admin_cs_notice_write_pro")
	public String adminCsNoticeWritePro(CsVO cs, @RequestParam String member_id, HttpSession session, Model model) {
		System.out.println("AdminController - adminCsNoticeWritePro");
		
		String uploadDir = "/resources/upload"; 
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		System.out.println("실제 업로드 경로 : " + saveDir);
		
		String subDir = "";	// 서브디렉토리(날자 구분)
		
		// -------------------------------------------------------------------------------------------
		try {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			subDir = sdf.format(date);
			saveDir += "/" + subDir;
			// --------------------------------------------------------------------------------------------
			Path path = Paths.get(saveDir);
			
			Files.createDirectories(path);
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile = cs.getFile();
		System.out.println("원본파일명1 : " + mFile.getOriginalFilename());
		
		String uuid = UUID.randomUUID().toString();
		System.out.println(uuid.substring(0, 8));
		
		cs.setCs_file("");
		
		String fileName = uuid.substring(0, 8) + "_" + mFile.getOriginalFilename();
		
		if(!mFile.getOriginalFilename().equals("")) {
			cs.setCs_file(subDir + "/" + fileName);			
		}
		System.out.println("실제 업로드 파일명1 : " + cs.getCs_file());
		
		// -----------------------------------------------------------------------------------------------
		// 작성자의 member_idx, member_type 조회
		boolean isAdmin = service.isAdmin(member_id);
		
		// CsService - registNotice() 메서드를 호출하여 게시물 등록 작업 요청
		// => 파라미터 : CsVO 객체    리턴타입 : int(insertCount)
		int insertCount = service.registNotice(cs);
		
		// 게시물 등록 작업 요청 결과 판별
		// => 성공 시 업로드 파일을 실제 디렉토리에 이동시킨 후 BoardList 서블릿 리다이렉트
		// => 실패 시 "글 쓰기 실패!" 메세지 출력 후 이전페이지 돌아가기 처리
		if(insertCount > 0 ) {	// 성공
			try {
				if(!mFile.getOriginalFilename().equals("")) {
					mFile.transferTo(new File(saveDir, fileName));
				}
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 글쓰기 작업 성공 시 글목록(BoardList)으로 리다이렉트
			return "redirect:/admin_cs_notice_list";
		}else {	// 실패
			model.addAttribute("msg", "글쓰기 실패");
			return "fail_back";
		}
		
//		// DB 생성 전까지 오류를 방지하기 위함(나중에 없앨 예정)
//		return "admin/admin_cs_notice_list";
		
	}
	
	// 고객센터관리 - admin_cs_notice_modify_form.jsp로 디스패치
	@GetMapping("admin_cs_notice_modify_form")
	public String adminCsNoticeModifyForm(@RequestParam int cs_idx, HttpSession session, Model model) {
		System.out.println("AdminController - adminCsNoticeModifyForm");
		
		CsVO cs = service.getCs(cs_idx);
		model.addAttribute("cs", cs);
		
		return "admin/admin_cs_notice_modify_form";
	}
	
	// 고객센터관리 - 공지사항 글수정
	@PostMapping("admin_cs_notice_modify_pro")
	public String adminCsNoticeModifyPro(CsVO cs, HttpSession session, Model model) {
		System.out.println("AdminController - adminCsNoticeModifyPro");
		System.out.println(cs);
		
		String uploadDir = "/resources/upload"; 
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		System.out.println("실제 업로드 경로 : " + saveDir);
		
		String subDir = "";	// 서브디렉토리(날자 구분)
		
		// -------------------------------------------------------------------------------------------
		try {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			subDir = sdf.format(date);
			saveDir += "/" + subDir;
			// --------------------------------------------------------------------------------------------
			Path path = Paths.get(saveDir);
			
			Files.createDirectories(path);
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile = cs.getFile();
		System.out.println("원본파일명1 : " + mFile.getOriginalFilename());
		
		String uuid = UUID.randomUUID().toString();
		System.out.println(uuid.substring(0, 8));
		
		cs.setCs_file("");
		
		String fileName = uuid.substring(0, 8) + "_" + mFile.getOriginalFilename();
		
		if(!mFile.getOriginalFilename().equals("")) {
			cs.setCs_file(subDir + "/" + fileName);			
		}
		System.out.println("실제 업로드 파일명1 : " + cs.getCs_file());
		
		// -----------------------------------------------------------------------------------------------
		// CsService - updateNotice() 메서드를 호출하여 게시물 등록 작업 요청
		// => 파라미터 : CsVO 객체    리턴타입 : int(insertCount)
		int updateCount = service.updateNotice(cs);
		
		// 게시물 등록 작업 요청 결과 판별
		// => 성공 시 업로드 파일을 실제 디렉토리에 이동시킨 후 BoardList 서블릿 리다이렉트
		// => 실패 시 "글 쓰기 실패!" 메세지 출력 후 이전페이지 돌아가기 처리
		if(updateCount > 0 ) {	// 성공
			try {
				if(!mFile.getOriginalFilename().equals("")) {
					mFile.transferTo(new File(saveDir, fileName));
				}
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 글수정 작업 성공 시 글목록(BoardList)으로 리다이렉트
			return "redirect:/admin_cs_notice_list";
		}else {	// 실패
			model.addAttribute("msg", "글쓰기 실패");
			return "fail_back";
		}
		
//		// DB 생성전까지 오류를 방지하기 위함(나중에 없앨 예정)
//		return "admin/admin_cs_notice_list";
	}
	
	
	// 고객센터관리 - 공지사항 글삭제
	@PostMapping("admin_cs_notice_delete")
	public String adminCsNoticeDelete(@RequestParam int cs_idx, Model model) {
		System.out.println("AdminController - adminCsNoticeDelete()");
		System.out.println(cs_idx);
		
		int deleteCount = service.removeNotice(cs_idx);
		
		if(deleteCount > 0) {
			return "redirect:/admin_cs_notice_list";			
		} else {
			model.addAttribute("msg", "글쓰기 실패");
			return "fail_back";
		}
		
//		// DB 생성전까지 오류를 방지하기 위함(나중에 없앨 예정)
//		return "admin/admin_cs_notice_list";
		
		
	}
	
	
	// 고객센터 관리 - 1:1 문의 게시판 으로 이동하기
	@GetMapping("admin_cs_qna")
	public String adminCsQnA(CsVO cs, HttpSession session, Model model) {
		System.out.println("AdminController - admin_cs_qna");
		
		List<CsVO> csQnAList = service.getCsQnAList();
		System.out.println("csQnAList : " + csQnAList);
		
		model.addAttribute("csQnAList", csQnAList);
		
		return "admin/admin_cs_qna_list";
	}
	
	
	// 고객센터 관리 - 1:1 문의글 상세페이지로 이동하기
	@GetMapping("admin_cs_qna_detail")
	public String adminCsQnADetail(HttpSession session, Model model, @RequestParam int cs_idx, @RequestParam int cs_info_idx) {
		System.out.println("AdminController - adminCsQnADetail");
		
		CsVO cs = service.getCsQnADetail(cs_idx, cs_info_idx);
		model.addAttribute("cs", cs);
		
		return "admin/admin_cs_qna_detail";
	}

	// 고객센터 관리 - 1:1 문의 답변 등록하기
	@PostMapping("admin_cs_qna_reply")
	public String adminCsQnAReply(HttpSession session, Model model, CsVO cs, @RequestParam int cs_idx, @RequestParam int cs_info_idx) {
		System.out.println("AdminController - admin_cs_qna_reply");
		System.out.println("CsVO : " + cs);
		System.out.println("cs_idx : " + cs_idx + "cs_info_idx : " + cs_info_idx);

		int updateCount = service.replyCsQnADetail(cs);
		
		if(updateCount > 0) {
			return "redirect:/admin_cs_qna";			
		} else {
			model.addAttribute("msg", "1:1 문의글 답변 등록 실패!");
			return "fail_back";
		}
	}
	
	// 고객센터 관리 - 1:1 문의 답변 수정하기
	@PostMapping("admin_cs_qna_reply_modify")
	public String adminCsQnAReplyModify(HttpSession session, Model model, CsVO cs, @RequestParam int cs_idx, @RequestParam int cs_info_idx) {
		System.out.println("AdminController - admin_cs_qna_reply_modify");
		System.out.println("CsVO : " + cs);
		System.out.println("cs_idx : " + cs_idx + "cs_info_idx : " + cs_info_idx);
		
		int updateReplyCount = service.replyModifyCsQnADetail(cs);
		
		if(updateReplyCount > 0) {
			return "redirect:/admin_cs_qna";			
		} else {
			model.addAttribute("msg", "1:1 문의글 답변 등록 실패!");
			return "fail_back";
		}
		
	}
	
	// 고객센터 관리 - 1:1 문의글 삭제하기
	@GetMapping("admin_cs_qna_delete")
	public String adminCsQnADelete(HttpSession session, Model model, @RequestParam int cs_idx) {
		System.out.println("AdminController - admin_cs_qna_delete");
		
		int deleteCount = service.removeCsQnA(cs_idx);
		
		if(deleteCount > 0) {
			return "redirect:/admin_cs_qna";
		} else {
			model.addAttribute("msg", "1:1 문의글 삭제 실패!");
			return "fail_back";
		}
	}
	
	// 고객센터 관리 - 자주 묻는 질문 게시판으로 이동하기
	@GetMapping("admin_cs_faq")
	public String adminCsFaq(HttpSession session, Model model, CsVO cs) {
		System.out.println("AdminController - admin_cs_faq");
		
		List<CsVO> csFaqList = service.getCsFaqList();
		System.out.println("csFaqList : " + csFaqList);
		
		model.addAttribute("csFaqList", csFaqList);
		
		return "admin/admin_cs_faq_list";
	}
	
	// 고객센터 관리 - 자주 묻는 질문 등록 뷰페이지로 이동하기
	@GetMapping("cs_faq_form")
	public String adminCsFaqForm() {
		System.out.println("AdminController - adminCsFaqForm");
		
		return "admin/admin_cs_faq_form";
	}
	
	// 고객센터 관리 - 자주 묻는 질문 등록하기
	@PostMapping("admin_cs_faq_write_pro")
	public String adminCsFaqWritePro(HttpServletRequest request, HttpSession session, Model model, CsVO cs) {
		System.out.println("AdminController - admin_cs_faq_write_pro");
		
		// ===================== 파일 처리 시작 =====================
		// 프로젝트 상 업로드 폴더의 실제 경로 알아내기(request or session 객체 필요)
			String uploadDir = "/resources/upload"; // 현재 폴더상 경로
			String saveDir = request.getServletContext().getRealPath(uploadDir); // 실제 경로
			System.out.println("csQnaFormPro - 실제업로드경로 : " + saveDir);
			
			String subDir = ""; // 서브 디렉토리 ( 업로드 날짜에 따라 디렉토리 구분하기 )
			
			try {
				// 1. Date 객체 생성
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); // 날짜 형식 포맷 지정 ( / 로 디렉토리 구분 )
				// 실제 업로드 경로에 날짜 경로 결합
				subDir = sdf.format(date); // 날짜 디렉토리
				saveDir += "/" + subDir;
				
				// 실제 경로를 관리하는 객체 리턴받기 
				Path path = Paths.get(saveDir);
				
				// path 객체로 관리하는 경로를 생성
				Files.createDirectories(path);
			} catch (IOException e) {
				System.out.println("1:1 문의 게시판 파일 업로드 : e 이거 오류");
				e.printStackTrace();
			}
			
			// 파라미터로 받은 CsVO cs 에서 전달된 MultipartFile 객체 꺼내기
			MultipartFile mFile = cs.getFile(); // CsVo 객체의 MultipartFile의 변수명 private MultipartFile file;
			System.out.println("csQnaFormPro 원본파일명1 : " + mFile.getOriginalFilename());
			
			// 파일명 중복 방지 처리 - 랜덤 ID (8글자) 붙이기 ( ex. 랜덤ID_파일명.확장자)
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			
			// 파일명이 존재하는 경우에만 파일명 생성(없을 경우를 대비하여 기본 파일명 널스트링으로 처리)
			cs.setCs_file("");
			
			// 파일명을 저장할 변수 선언
			String fileName = uuid.substring(0, 8) + "_" + mFile.getOriginalFilename();
			
			if(!mFile.getOriginalFilename().equals("")) {
				cs.setCs_file(subDir + "/" + fileName);			
			}
			System.out.println("실제 업로드 파일명1 : " + cs.getCs_file());
		// ===================== 파일 처리 끝 =====================
		
		int insertCount = service.registCsFaQ(cs);
				
		if(insertCount > 0) { // 글쓰기 성공
			try {
				if(!mFile.getOriginalFilename().equals("")) {
					mFile.transferTo(new File(saveDir, fileName));
				}
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return "redirect:/admin_cs_faq";
//			return "admin/admin_cs_faq_list";
		} else { // 글쓰기 실패 
			model.addAttribute("msg", "자주묻는질문 등록 실패!");

			return "fail_back";
		}	
			
	}
	
	// 고객센터 관리 - 자주 묻는 질문 상세페이지로 이동하기
	@GetMapping("admin_cs_faq_detail")
	public String adminCsFaqDetail(HttpSession session, Model model, @RequestParam int cs_idx, @RequestParam int cs_info_idx) {
		System.out.println("AdminController - adminCsFaqDetail");
		
		CsVO cs = service.getCsFaqDetail(cs_idx, cs_info_idx);
		model.addAttribute("cs", cs);
		
		return "admin/admin_cs_faq_detail";
	}
	
	
	// 고객센터 관리 - 자주 묻는 질문 수정하기
	@PostMapping("admin_cs_faq_modify")
	public String adminCsFaqModify(HttpSession session, Model model, CsVO cs, @RequestParam int cs_idx, @RequestParam int cs_info_idx) {
		System.out.println("AdminController - admin_cs_faq_modify");
		System.out.println("CsVO : " + cs);
		System.out.println("cs_idx : " + cs_idx + "cs_info_idx : " + cs_info_idx);
		
		int updateReplyCount = service.modifyFaqDetail(cs);
		System.out.println("updateReplyCount - " + updateReplyCount);
		
		if(updateReplyCount > 0) {
			return "redirect:/admin_cs_faq";			
		} else {
			model.addAttribute("msg", "1:1 문의글 답변 등록 실패!");
			return "fail_back";
		}

	}
	
	// 고객센터 관리 - 자주 묻는 질문 삭제하기
	@GetMapping("admin_cs_faq_delete")
	public String adminCsFaqDelete(HttpSession session, Model model, @RequestParam int cs_idx) {
		System.out.println("AdminController - admin_cs_faq_delete");
		
		int deleteCount = service.removeCsFaq(cs_idx);
		
		if(deleteCount > 0) {
			return "redirect:/admin_cs_faq";
		} else {
			model.addAttribute("msg", "1:1 문의글 삭제 실패!");
			return "fail_back";
		}
	}
	
	
	
	
	
	
	
}
