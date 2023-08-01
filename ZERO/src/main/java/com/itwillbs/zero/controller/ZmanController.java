package com.itwillbs.zero.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ZmanController {
	
	// ZMAN 메인 페이지로 이동
	@GetMapping("zman_main")
	public String zmanMain() {
		return "zman/zman_main";
	}
	
	// ZMAN 정산내역 페이지로 이동
	@GetMapping("zman_earning")
	public String zmanEarning() {
		return "zman/zman_earning";
	}
	
	// ZMAN 배달 예정 페이지로 이동
	@GetMapping("zman_delivery_want")
	public String zmanDeliveryWant() {
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
}
