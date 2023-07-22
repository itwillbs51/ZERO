package com.itwillbs.zero.controller;

import java.util.List;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {
	
	
	
	// 관리자 - 메인페이지로 디스패치
	@GetMapping("admin_main")
	public String adminMain() {
		System.out.println("AdminController - adminMain");
		
		return "admin/admin_main";
	}
	
	// 관리자 - 회원목록 페이지로 디스패치
	@GetMapping("admin_member_list")
	public String adminMemberList() {
		System.out.println("AdminController - adminMemberList");
		
		return "admin/admin_member_list";
	}
	
	// 관리자 - 회원목록 페이지에 회원목록 가져오기
//	@ResponseBody
//	@GetMapping("GetMemberList")
//	public String getMemberList() {
//		System.out.println("AdminController - getMemberList()");
//		
//		List<MemberVO> memberList = service.getMemebrList();
//		System.out.println(memberList);
//		
//		JSONArray json = new JSONArray(memberList);
//		System.out.println(json);
//		
//		return json.toString();
//		
//	}
//	
//	// 관리자 - 회원 정보 조회
//	@GetMapping("GetMember")
//	public String getMemebr(String member_idx, Model model) {
//		System.out.println("AdminController - getMemebr");
//		
//		int memberIdx =  Integer.parseInt(member_idx);
//		
//		MemberVO member = service.getMember(memberIdx);
//		System.out.println(member);
//		model.addAttribute("member", member);
//		
//		return "admin/admin_member_detail";
//	}
	
	// 관리자 - 회원신고 페이지로 디스패치
	@GetMapping("admin_member_report")
	public String adminMemberReport() {
		System.out.println("AdminController - adminMemberReport");
		
		return "admin/admin_member_report";
	}
	
	// 관리자 - zman 목록 페이지로 디스패치
	@GetMapping("admin_zman_list")
	public String adminZmanList() {
		System.out.println("AdminController - adminZmanList");
		
		return "admin/admin_zman_list";
	}
	
	// 관리자 - zman 배달 내역 페이지로 디스패치
	@GetMapping("admin_zman_delivery_list")
	public String adminZmanDeliveryList() {
		System.out.println("AdminController - adminZmanDeliveryList");
		
		return "admin/admin_zman_delivery_list";
	}

	// 관리자 - zman 신고 페이지로 디스패치
	@GetMapping("admin_zman_report")
	public String adminZmanReport() {
		System.out.println("AdminController - adminZmanReport");
		
		return "admin/admin_zman_report";
	}

	// 관리자 - 중고거래 목록 페이지로 디스패치
	@GetMapping("admin_secondhand_list")
	public String adminSecondhandList() {
		System.out.println("AdminController - adminSecondhandList");
		
		return "admin/admin_secondhand_list";
	}
	
	// 부트스트랩 테이블 예제
	@GetMapping("tables_ex")
	public String tables_ex() {
		System.out.println("AdminController - tables_ex");
		
		return "admin/tables_ex";
	}
	
	// 부트스트랩 파이차트 예제
	@GetMapping("charts_ex")
	public String charts_ex() {
		System.out.println("AdminController - charts_ex");
		
		return "admin/charts_ex";
	}
}
