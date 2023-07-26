package com.itwillbs.zero.controller;

import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
	
	
	
	

}
