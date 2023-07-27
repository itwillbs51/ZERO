package com.itwillbs.zero.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.zero.handler.MyPasswordEncoder;
import com.itwillbs.zero.service.MemberService;
import com.itwillbs.zero.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 멤버 로그인
	@GetMapping("member_login")
	public String memberLogin(HttpSession session
			, Model model
			) {
		System.out.println("MemberController - memberlogin");
		
		return "member/member_login";
	}
	
	// 멤버 로그인 프로
	@PostMapping("member_login_pro")
	public String memberLoginPro(HttpSession session
			, Model model
			, HttpServletResponse response
			, @RequestParam String member_id
			, @RequestParam String member_passwd
			, @RequestParam(defaultValue = "false") boolean remember_me
			) {
		
		System.out.println("MemberController - memberloginPro");
		System.out.println(member_id);
		System.out.println(member_passwd);
		
		// DB 조회할 컬럼명
		String column = "member_id";
		
		HashMap<String, String> member = service.isMemberCheck(column, member_id);
		System.out.println(member);
	
		// 2. BcryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
//		MyPasswordEncoder passwordEncoder = new MyPasswordEncoder();
		// 2. getCryptoPassword() 메서드에 평문 전달하여 암호문 얻어오기
		String securePasswd = member.get("member_passwd");
		
		// 3. BcryptPasswordEncoder 객체의 matches() 메서드 호출해서 암호 비교
		// => 파라미터 : 평문, 암호화 된 암호 		리턴타입 : boolean
		// 로그인 성공/ 실패 여부 판별하여 포워딩
		// => 성공 : MemberVO 객체에 데이터가 저장되어 있고 입력받은 패스워드가 같음
		// => 실패 : MemberVO 객체가 null 이거나 입력받은 패스워드와 다름
		
//		System.out.println("securePasswd : " + securePasswd);
		
		// 임시 암호화 패스워드
//		System.out.println("securePasswd :" + securePasswd);
//		System.out.println("member_passwd:" + member_passwd);
//		System.out.println(passwordEncoder.matches(member_passwd, member.get("member_passwd").trim()));
		
		if(member.isEmpty()) {		
//			// 아이디로 조회 시 없는 아이디일 때
			model.addAttribute("msg", "없는 아이디 입니다. "
					+ "입력하신 내용을 다시 확인해주세요.");
			return "fail_back";
		} else if (member.get("member_passwd") ==  null || !passwordEncoder.matches(member_passwd, member.get("member_passwd"))) {
//			// 패스워드가 member.getPasswd와 다를 때(비밀번호가 틀림)
			model.addAttribute("msg", "아이디 또는 비밀번호를 잘못 입력했습니다. "
					+ "입력하신 내용을 다시 확인해주세요.");
			return "fail_back";
		} else {
//			// 로그인 성공 시
//			// ------------------------- 메일 인증 확인 기능 추가 ---------------------------
			if(member.get("member_mail_auth").equals("N")) { // 메일 미인증 회원
			// "fail_back.jsp" 페이지 포워딩("이메일 인증 후 로그인이 가능합니다." 출력)
			model.addAttribute("msg", "이메일 인증 후 로그인이 가능합니다.");
			return "fail_back";
			}
			
//			// 탈퇴한 회원인 경우(member_status가 "탈퇴") 탈퇴한 회원입니다 하고 돌려보내기
			if(member.get("member_status").equals("탈퇴")) {
				model.addAttribute("msg", "탈퇴한 회원입니다. 로그인이 불가능합니다.");
				return "fail_back";
			}
			
			session.setAttribute("member_id", member.get("member_id"));
			session.setAttribute("member_type", member.get("member_type"));
//			
//			// 만약, "아이디 저장" 체크박스 버튼이 눌려진 경우 cookie에 member_id 저장
			Cookie cookie = new Cookie("member_id", member.get("member_id"));
//			
			if(remember_me) {
//				// Cookie에 로그인 성공한 member_id 저장 (name : "member_id")
//				// cookie 유지 시간 지정 (초 단위)
				cookie.setMaxAge(60 * 60 * 24 * 15); // 15일 유지 (초 * 분 * 시 * 일)
			} else if (!remember_me) {
//				// "아이디 저장" 체크박스 버튼이 눌려져 있지 않을 때 => cookie에 member_id 제거
//				// cookie 유지 시간 지정 (초 단위)
				cookie.setMaxAge(0); // 삭제
			}
			response.addCookie(cookie);
			
			return "redirect:/";	// 메인페이지(루트)로 리다이렉트 (href="./" 와 같음)
		}
	}

	
	// 3. 네이버 로그인 클릭
	@PostMapping("/ajax/checkUserNaver")
	@ResponseBody	// Json 형태의 응답을 반환하도록 지정
	public String checkUser(HttpSession session
							, Model model
							, @RequestParam("email") String email
							, @RequestParam(value = "column", required = false) String column 
							) {
		
		  System.out.println("email : "+ email);
		  
		  // 임시 고정값 설정 
		  column = "member_id";
		  
		  // 회원정보 가져오기
		  HashMap<String, String> member = service.isMemberCheck(column, email);
		  System.out.println(member);
		  
		// 네이버에서 전달받은 이메일 값으로 회원가입 여부 판별
		if (!member.isEmpty()) {
			// DB에 네이버에서 전달받은 이메일이 아이디로 존재할 때
			System.out.println("존재하는 회원");
				
			// 이미 가입된 회원이므로 세션에 유저의 아이디 저장
			session.setAttribute("member_id", email);
			return "existing";
		 
		} else {
			// DB에 아이디가 존재하지 않는 경우 -> 회원가입으로 넘어가기
			return "new";
		}
		
	}
	
	// 로그아웃 작업 후 메인으로 돌아가기
	@GetMapping("member_logout")
	public String member_logout(HttpSession session
			, Model model
			) {
		// 세션에 저장한 member_id(저장한 정보들) 초기화
		session.invalidate();
		
		// 세션 초기화 후 main 화면으로 돌아가기
		return "redirect:/";
	}
	
	// 네이버 로그인 콜백 
	@GetMapping("callback_login_naver")
	public String callbackLoginNaver(HttpSession session
			, Model model) {
		System.out.println("MemberController - callback_login_naver");
		
		return "member/member_callback";
	}

	// 멤버 로그인정보
	@GetMapping("member_loginInfo")
	public String memberLoginInfo(HttpSession session
			, Model model) {
		System.out.println("MemberController - memberloginInfo");
		
		return "member/member_loginInfo";
	}
	
	
	// 멤버 주소 등록
	@GetMapping("member_address")
	public String memberAddress(HttpSession session
			, Model model) {
		System.out.println("MemberController - memberlogin");
		
		return "member/member_address";
	}	
	
	// 멤버 계좌 등록
	@GetMapping("member_account")
	public String memberAccount(HttpSession session
			, Model model) {
		System.out.println("MemberController - memberAccount");
		
		return "member/member_account";
	}
	
	// 멤버 마이스토어
	@GetMapping("member_mystore")
	public String memberMyStore(HttpSession session
			, Model model) {
		System.out.println("MemberController - memberMyStore");
		
		return "member/member_mystore";
	}
	
	// 멤버 프로필
	@GetMapping("member_profile")
	public String memberProfile(HttpSession session
			, Model model) {
		System.out.println("MemberController - memberProfile");
		
		return "member/member_profile";
	}
	
	// 멤버 아이디 찾기
	@GetMapping("member_find_id")
	public String memberFindId(HttpSession session
			, Model model) {
		System.out.println("MemberController - memberFindId");
		
		return "member/member_find_id";
	}
	
	// 멤버 패스워드 찾기
	@GetMapping("member_find_passwd")
	public String memberFindPasswd(HttpSession session
			, Model model) {
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
		return "member/member_zman_join_identification";
	}
	
	@PostMapping("zman_join_pro")
	public String zmanJoinPro() {
		return "member/member_zman_join";
	}
	
	// 마이페이지 작성한 후기
	@GetMapping("member_mypage_write_review")
	public String mypageWriteReview() {
		return "member/member_mypage_write_review";
	}
	
}













