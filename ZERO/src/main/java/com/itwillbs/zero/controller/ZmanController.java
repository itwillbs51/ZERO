	package com.itwillbs.zero.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.zero.service.ZmanDeliveryService;
import com.itwillbs.zero.vo.ZmanDeliveryVO;
import com.itwillbs.zero.vo.ZmanVO;

@Controller
public class ZmanController {
	
	@Autowired
	private ZmanDeliveryService service;
	
	// ZMAN 메인 페이지로 이동
	@GetMapping("zman_main")
	public String zmanMain(HttpSession session, Model model) {
		System.out.println("ZmanController - zman_main");
		
		// 세션에 저장된 zman 아이디를 파라미터로 넘기
//		ZmanVO zman = service.getZmanList();
//		model.addAttribute("zman", zman);
		
		return "member/member_zman_join_identification";
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
	// Z-MAN 신청폼
	@GetMapping("zman_join_form")
	public String zmanJoinPro() {
		return "member/member_zman_join_form";
	}
	
}
