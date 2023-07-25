package com.itwillbs.zero.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	// 멤버 메인화면
	@GetMapping("member_mypage_main")
	public String memberMypageHome() {
		return "member/member_mypage_main";
	}
	
	// 멤버 중고상품 구매내역
	@GetMapping("member_mypage_buyList")
	public String memberMypageBuyList() {
		return "member/member_mypage_buyList";
	}
	
	// 멤버 경매 내역
	@GetMapping("member_mypage_auctionList")
	public String memberMypageAuctionList() {
		return "member/member_mypage_auctionList";
	}

	// 회원가입
	@GetMapping("join")
	public String join() {
		return "member/member_join";
	}
	
	// 회원가입 완료
	@PostMapping("join_pro")
	public String memberJoinPro() {
		return "member/member_join_pro";
	}
	
	
	// Z-MAN 신청
	@GetMapping("zman_join")
	public String zmanJoin() {
		return "member/member_zman_join";
	}
	
}













