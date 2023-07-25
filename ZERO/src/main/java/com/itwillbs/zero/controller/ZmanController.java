package com.itwillbs.zero.controller;

import org.springframework.stereotype.Controller;
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
}
