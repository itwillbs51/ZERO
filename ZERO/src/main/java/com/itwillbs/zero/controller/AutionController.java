package com.itwillbs.zero.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class AutionController {
	
	
	
	// 경매중 목록 페이지로 이동
	@GetMapping("autionList_present")
	public String autionList_present() {
		
		
		return "aution/aution_list_present";
	}
	
	// 입찰예정경매 목록 페이지로 이동
	@GetMapping("autionList_prepare")
	public String autionList_prepare() {
		
		return "aution/aution_list_prepare";
	}
	
	// 경매 종료 목록 페이지로 이동
	@GetMapping("autionList_end")
	public String autionList_end() {
		
		return "aution/aution_list_end";
	}
}
