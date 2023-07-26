package com.itwillbs.zero.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.zero.service.MemberService;
import com.itwillbs.zero.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
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
	@GetMapping("member_mystore")
	public String memberMyStore() {
		System.out.println("MemberController - memberMyStore");
		
		return "member/member_mystore";
	}
	
	// 멤버 프로필
	@GetMapping("member_profile")
	public String memberProfile() {
		System.out.println("MemberController - memberProfile");
		
		return "member/member_profile";
	}
	
	// 멤버 아이디 찾기
	@GetMapping("member_find_id")
	public String memberFindId() {
		System.out.println("MemberController - memberFindId");
		
		return "member/member_find_id";
	}
	
	// 멤버 패스워드 찾기
	@GetMapping("member_find_passwd")
	public String memberFindPasswd() {
		System.out.println("MemberController - memberFindPasswd");
		
		return "member/member_find_passwd";
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

	// 회원가입 메인창
	@GetMapping("join")
	public String join() {
		return "member/member_join";
	}
	
	// 회원가입 메인 - 회원가입 버튼 클릭시 확인 절차후 리다이렉트 -> 완료창 이메일인증해주세요
	@PostMapping("join_pro")
	public String memberJoinPro(MemberVO member, Model model) {
		
		// MemberService(registMember()) - Member_mapper(insertMember())
		int insertCount = service.registMember(member);
		
		if(insertCount > 0) {
			return "redirect:/join_complete";
		} else {
			model.addAttribute("msg", "회원가입 실패 다시 작성해주세요");
			return "fail_back";
		}
	}
	
	@GetMapping("join_complete")
	public String memberJoinComplete() {
		return "member/member_join_complete";
	}
	
	
	// Z-MAN 신청
	@GetMapping("zman_join")
	public String zmanJoin() {
		return "member/member_zman_join";
	}
	
	// 마이페이지 작성한 후기
	@GetMapping("member_mypage_write_review")
	public String mypageWriteReview() {
		return "member/member_mypage_write_review";
	}
	
}













