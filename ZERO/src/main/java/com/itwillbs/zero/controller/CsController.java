package com.itwillbs.zero.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.zero.service.AdminService;
import com.itwillbs.zero.vo.CsVO;

@Controller
public class CsController {
	
	@Autowired
	private AdminService adminService;
	
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
	public String csNotice(Model model) {
		System.out.println("CsController - csNotice");
		
//		List<CsVO> csList = adminService.getCsList();
//		System.out.println(csList);
//		model.addAttribute("csList", csList);
		
		return "cs/cs_notice";
	}
	
	// 고객센터관리 - cs_notice_view.jsp로 디스패치
	@GetMapping("cs_notice_view")
	public String csNoticeView(@RequestParam int cs_idx, HttpSession session, Model model) {
		System.out.println("CsController - csNoticeView");
		
//		CsVO cs = adminService.getCs(cs_idx);
//		model.addAttribute("cs", cs);
		
		return "cs/cs_notice_view";
	}
	// cs_qna 페이지로 디스패치
	@GetMapping("cs_qna_form")
	public String csQna() {
		System.out.println("CsController - csQna");
		
		return "cs/cs_qna_form";
	}
}
