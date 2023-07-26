package com.itwillbs.zero.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.zero.service.AdminService;
import com.itwillbs.zero.service.CsService;
import com.itwillbs.zero.vo.CsVO;

@Controller
public class CsController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CsService csService;
	
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
	// cs_qna_form 페이지로 디스패치
	@GetMapping("cs_qna_form")
	public String csQnaForm() {
		System.out.println("CsController - csQnaForm");
		// 회원만 접근할 수 있도록 설정 - 세션
		
		// csService - insertQnA()
		// 파라미터 : 아이디	리턴타입 : int(insertCount)
//		int insertCount = csService.insertQnA(id);
		
		
		return "cs/cs_qna_form";
	}
}
