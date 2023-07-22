package com.itwillbs.zero.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CsController {
	
	// CS - 메인페이지로 디스패치
	@GetMapping("cs_main")
	public String csMain() {
		System.out.println("CsController - csMain");
		
		return "cs/cs_main";
	}
	
	// cs_faq 페이지로 디스패치
	@GetMapping("cs_faq")
	public String csFaq() {
		System.out.println("CsController - csFaq");
		
		return "cs/cs_faq";
	}
	// cs_notice 페이지로 디스패치
	@GetMapping("cs_notice")
	public String csNotice() {
		System.out.println("CsController - csNotice");
		
		return "cs/cs_notice";
	}
	// cs_qna 페이지로 디스패치
	@GetMapping("cs_qna")
	public String csQna() {
		System.out.println("CsController - csQna");
		
		return "cs/cs_qna";
	}
}
