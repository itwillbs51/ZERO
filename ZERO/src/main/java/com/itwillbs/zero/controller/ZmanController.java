	package com.itwillbs.zero.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
		
		return "zman/zman_main";
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
		
		model.addAttribute("depart", " 부산광역시 부산진구 중앙대로 658"); // zman_delivery_startspot 
		model.addAttribute("arrive", "부산광역시 부산진구 범전로5번길 13"); // zman_delivery_endspot
		
		return "zman/zman_test_location";
	}
	
	// 신청 폼
	@GetMapping("zero_report_form")
	public String zmanReportForm() {
		
		return "zero_report_form";
	}
	
}
