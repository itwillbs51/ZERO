package com.itwillbs.zero.controller;

import java.util.Map;

import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AuctionController2 {
	
	
	
	// 경매 상세 페이지로 이동
	@GetMapping("auction_detail")
	public String auction_detail(Model model) {
		
		model.addAttribute("userid", "test");
		
		return "aution/auction_detail";
	}
	
	// 경매 예정 상세 페이지로 이동
	@GetMapping("auction_prepare_detail")
	public String auction_prepare_detail() {
		
		return "aution/auction_prepare_detail";
	}

	// 경매 상품 등록폼
	@GetMapping("auction_regist_form")
	public String auction_regist_form() {
		
		return "aution/auction_regist_form";
	}
	// 경매 상품 등록
	
	@ResponseBody
	@PostMapping ("auction_regist_pro")
	public String auction_regist_pro(@RequestParam Map<String, Object> allParameters, @RequestParam Map<String, MultipartFile> Parameters) {
			System.out.println("allParameters :"+allParameters);
			System.out.println("Parameters :"+Parameters);
		return "true";
	}
	
	
	
	

}
