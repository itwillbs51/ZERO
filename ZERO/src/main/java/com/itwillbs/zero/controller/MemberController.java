package com.itwillbs.zero.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	
	
	// 멤버 로그인
	@GetMapping("member_login")
	public String memberLogin() {
		System.out.println("MemberController - memberlogin");
		
		return "member/member_login";
	}

	// 멤버 로그인정보
	@GetMapping("member_loginInfo")
	public String memberLoginInfo() {
		System.out.println("MemberController - memberloginInfo");
		
		return "member/member_loginInfo";
	}
	
	
	// 멤버 주소 등록
	@GetMapping("member_address")
	public String memberAddress() {
		System.out.println("MemberController - memberlogin");
		
		return "member/member_address";
	}	
	
	// 멤버 계좌 등록
	@GetMapping("member_account")
	public String memberAccount() {
		System.out.println("MemberController - memberAccount");
		
		return "member/member_account";
	}
	
	// 멤버 마이스토어
	@GetMapping("member_myStore")
	public String memberMyStore() {
		System.out.println("MemberController - memberMyStore");
		
		return "member/member_myStore";
	}
	
	// 멤버 프로파일
	@GetMapping("member_profile")
	public String memberProfile() {
		System.out.println("MemberController - memberProfile");
		
		return "member/member_profile";
	}

}
