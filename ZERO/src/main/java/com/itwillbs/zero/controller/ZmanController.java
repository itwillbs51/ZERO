	package com.itwillbs.zero.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.zero.service.MemberService;
import com.itwillbs.zero.service.ZmanDeliveryService;
import com.itwillbs.zero.vo.MemberVO;
import com.itwillbs.zero.vo.ZmanDeliveryVO;
import com.itwillbs.zero.vo.ZmanVO;

@Controller
public class ZmanController {
	
	@Autowired
	private ZmanDeliveryService service;
	
	// 멤버 은행등록여부 조회 및 ZMAN 신청 데이터 가져오기위한 서비스 추가 - 정의효 
	@Autowired
	private MemberService member_service;
	
	// ZMAN 메인 페이지로 이동
	@GetMapping("zman_main")
	public String zmanMain(HttpSession session, Model model) {
		System.out.println("ZmanController - zman_main");
		
		// 세션에 저장된 zman 아이디를 파라미터로 넘기
//		ZmanVO zman = service.getZmanList();
//		model.addAttribute("zman", zman);
		
		String member_type = (String) session.getAttribute("member_type");
		System.out.println(member_type);
		if(member_type.equals("Z맨") || member_type.equals("직원")) {
			return "zman/zman_main";
		} else {
			return "zpay_main";
		}
	}
	
	// ZMAN 정산내역 페이지로 이동
	@GetMapping("zman_earning")
	public String zmanEarning() {
		return "zman/zman_earning";
	}
	
	// ZMAN 배달 예정 페이지로 이동
	@GetMapping("zman_delivery_want")
	public String zmanDeliveryWant(HttpSession session, Model model) {
		System.out.println("ZmanController - zman_delivery_want");
		
		ZmanDeliveryVO zd = service.getDeliveryYetList();
		System.out.println("ZmanDeliveryVO : " + zd);
		model.addAttribute("zd", zd);
		
		return "zman/zman_delivery_want";
	}
	
	// ZMAN 중고물품 오더 배달 수락하기
	@PostMapping("zman_delivery_want_pro")
	public String zmanDeliveyAccept(HttpSession session, Model model, 
									@RequestParam int zman_delivery_idx, @RequestParam String zman_id) {
		System.out.println("ZmanController - zman_delivery_want_pro");
		System.out.println("zman_id - " + zman_id);
		
		ZmanDeliveryVO zd = service.acceptDelivery(zman_delivery_idx, zman_id);
		
		return "zman/zman_delivery_ing";
	}
	
	// ZMAN 배달 완료 페이지로 이동
	@GetMapping("zman_delivery_done")
	public String zmanDeliveryDone() {
		return "zman/zman_delivery_done";
	}
	
	// ZMAN 마이페이지로 이동
	@GetMapping("zman_myPage")
	public String zmanMyPage() {
		return "zman/zman_myPage";
	}
	
	// ZMAN 지도 test 페이지로 이동하기
	@GetMapping("zman_test_location")
	public String zman_test_location(Model model) {
		
		System.out.println("Zmancontroller -zman_test_location ");
		
		// DB 에 저장된 출발지와 도착지 가져오기 - 파라미터 zman_delivery_idx
//		ZmanDeliveryVO zd = service.getDeliveryLocation();
//		System.out.println("zd - " + zd);
		
//		model.addAttribute("depart", zd.getZman_delivery_startspot());
//		model.addAttribute("arrive", zd.getZman_delivery_endspot());
		
		model.addAttribute("depart", " 부산광역시 부산진구 중앙대로 658"); // zman_delivery_startspot 
		model.addAttribute("arrive", "부산광역시 부산진구 범전로5번길 13"); // zman_delivery_endspot
		
		return "zman/zman_test_location";
	}
	
	// 신청 폼
	@GetMapping("zero_report_form")
	public String zmanReportForm() {
		
		return "zero_report_form";
	}
	
	// 정의효 - Z-MAN관련
	// Z-MAN 가입 신청폼
	@GetMapping("zman_join_form")
	public String zmanJoinForm(HttpSession session, Model model, MemberVO member) {
		
		// 세션 아이디가 없을 경우 " 로그인이 필요합니다!" 출력 후 이전페이지로 돌아가기
		String member_id = (String) session.getAttribute("member_id");
//			if(member_id == null) {
//				model.addAttribute("msg", " 로그인이 필요합니다!");
//				model.addAttribute("targetURL", "member_login_form");
//									
//				return "fail_location";
//			}
		
		// member_id로 member 데이터 조회후 member_bank_auth 유무에 따른 이동
		MemberVO memberBankAuth = member_service.isValidBank(member_id);
		
		if(memberBankAuth.getMember_bank_auth().equals("N")) {
			model.addAttribute("msg", "계좌등록이 완료된 상태여야합니다!");
			model.addAttribute("targetURL", "member_account");
			return "fail_location";
		} else {
			return "member/member_zman_join_form";
		}
	}
	
	// Z-MAN 신청 메인 - 신청하기 버튼 클릭시 확인 절차 후 리다이렉트 -> 완료창
	@PostMapping("zman_join_pro")
	public String zmanJoinPro(HttpSession session, MemberVO member, Model model) {
		
		
		// 세션 아이디가 없을 경우 " 로그인이 필요합니다!" 출력 후 이전페이지로 돌아가기
//		String member_id = (String) session.getAttribute("member_id");
//				if(member_id == null) {
//					model.addAttribute("msg", " 로그인이 필요합니다!");
//					model.addAttribute("targetURL", "member_login_form");
//									
//					return "fail_location";
//				}
				
//		int insertCount = service.registZman(member);
		
//		if(insertCount > 0) {
//			return "redirect:/member/member_zman_join_complete";
//		} else {
//			model.addAttribute("msg", "Z-MAN 신청 실패 다시 작성해주세요");
			return "fail_back";
//		}
		
	}
	
	
	// Z-MAN 신청완료 이동
	@GetMapping("zman_join_complete")
	public String zmanJoinComplete() {
		return "member/member_zman_join_complete";
	}
	
}
