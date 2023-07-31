package com.itwillbs.zero.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.zero.email.EmailErrorResponse;
import com.itwillbs.zero.email.SuccessResponse;
import com.itwillbs.zero.handler.MyPasswordEncoder;
import com.itwillbs.zero.service.MemberService;
import com.itwillbs.zero.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private ApplicationContext ctx;
	
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
		
		Map<String, String> member = service.isMemberCheck(column, member_id);
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
		
		return "member/member_callback_naver";
	}
	
	
	// 네이버 정보 전달
	@PostMapping("ajax/checkUserNaver")
	@ResponseBody	// Json 형태의 응답을 반환하도록 지정
	public String checkUserNaver(HttpSession session
							, Model model
							, @RequestParam Map map
							) {
		
		  System.out.println("map : "+ map);
		  
		  // 임시 고정값 설정 
		  Iterator<String> iterator = map.keySet().iterator();
		  String column = iterator.next();
		  System.out.println(column);
		  System.out.println(iterator.next());
		  System.out.println(map.get(column).toString());
		  // 회원정보 가져오기
		  Map<String, String> member = service.isMemberCheck(column, map.get(column).toString());
		  System.out.println(member);
		  
		// 네이버에서 전달받은 이메일 값으로 회원가입 여부 판별
		if (member != null) {
//			// DB에 네이버에서 전달받은 이메일이 아이디로 존재할 때
			System.out.println("존재하는 회원");
//				
//			// 이미 가입된 회원이므로 세션에 유저의 아이디 저장
			session.setAttribute("member_id", member.get("member_id"));
			session.setAttribute("member_type", member.get("member_type"));
			return "existing";
//		 
		} else {
//			// DB에 아이디가 존재하지 않는 경우 -> 회원가입으로 넘어가기
			System.out.println("회원가입 넘어가기 : " + map.get(column).toString() + "," +map.get("member_name").toString());
//			session.setAttribute("no_member_id", map.get(column).toString());
//			session.setAttribute("no_member_name", map.get("member_name").toString());
			return "new";
		}
		  
//		  return "";
		
	}

	// 구글 로그인 콜백 
	@GetMapping("callback_login_google")
	public String callbackLoginGoogle(HttpSession session
			, Model model
			) {
		
		
		System.out.println("MemberController - callback_login_google");
		
		return "member/member_callback";
	}
	
	// ajax로 로그인 정보 가져오기
	@PostMapping("ajax/checkUser")
	@ResponseBody	// Json 형태의 응답을 반환하도록 지정
	public String checkUser(HttpSession session
							, Model model
							, @RequestParam Map map
							) {
		
		  System.out.println("map : "+ map);
		  
		  // 임시 고정값 설정 
		  Iterator<String> iterator = map.keySet().iterator();
		  String column = iterator.next();
		  System.out.println(column);
		  System.out.println(iterator.next());
		  System.out.println(map.get(column).toString());
		  // 회원정보 가져오기
		  Map<String, String> member = service.isMemberCheck(column, map.get(column).toString());
		  System.out.println(member);
		  
		// 전달받은 이메일 값으로 회원가입 여부 판별
		if (member != null) {
//			// DB에 네이버에서 전달받은 이메일이 아이디로 존재할 때
			System.out.println("존재하는 회원");
//				
//			// 이미 가입된 회원이므로 세션에 유저의 아이디 저장
			session.setAttribute("member_id", member.get("member_id"));
			session.setAttribute("member_type", member.get("member_type"));
			return "existing";
//		 
		} else {
//			// DB에 아이디가 존재하지 않는 경우 -> 회원가입으로 넘어가기
			System.out.println("회원가입 넘어가기 : " + map.get(column).toString() + "," +map.get("member_name").toString());
//			session.setAttribute("no_member_id", map.get(column).toString());
//			session.setAttribute("no_member_name", map.get("member_name").toString());
			return "new";
		}
		  
		
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
		
		String column = "member_id";
		String member_id = (String)session.getAttribute("member_id");
		  // 임시 고정값 설정 
		  
		  System.out.println(column);
		  System.out.println(member_id);
		  // 회원정보 가져오기
		  Map<String, String> member = service.isMemberCheck(column, member_id);
		  System.out.println(member);
		
		  model.addAttribute("member", member);
		
		return "member/member_profile";
	}
	
	
	// ajax로 프로필 이미지 변경
	@PostMapping("ajax/profileUpdate")
	@ResponseBody	// Json 형태의 응답을 반환하도록 지정
	public String profileUpdate(HttpSession session
							, Model model
							, @RequestParam MultipartFile profile
							) {
		//  MultipartFile 객체 확인
		  System.out.println("profile : "+ profile);
		  
		  
		  String column1 = "member_id";
		  String member_id = (String)session.getAttribute("member_id");
		  
		  // 변경할 컬럼
		  String column2 = "member_image";
		  // 임시 고정값 설정 
//		  Iterator<String> iterator = map.keySet().iterator();
//		  String column = iterator.next();
//		  System.out.println(column);
//		  System.out.println(iterator.next());
//		  System.out.println(map.get(column).toString());
		  // 회원정보 가져오기
		  
//			System.out.println(request.getRealPath("/resources/upload")); // Deprecated 처리된 메서드
			String uploadDir = "/resources/upload"; 
//			String saveDir = request.getServletContext().getRealPath(uploadDir); // 사용 가능
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			System.out.println("실제 업로드 경로 : "+ saveDir);
			// 실제 업로드 경로 : D:\Shared\Spring\workspace_spring5\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Spring_MVC_Board\resources\ upload
			
			String subDir = ""; // 서브디렉토리(날짜 구분)
			
			try {
				// ------------------------------------------------------------------------------

				Date date = new Date(); // Mon Jun 19 11:26:52 KST 2023
//			System.out.println(date);

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				// 기존 업로드 경로에 날짜 경로 결합하여 저장
				subDir = sdf.format(date);
				saveDir += "/" + subDir;
				// --------------------------------------------------------------

				// => 파라미터 : 실제 업로드 경로
				Path path = Paths.get(saveDir);
				
				// Files 클래스의 createDirectories() 메서드를 호출하여
				// Path 객체가 관리하는 경로 생성(존재하지 않으면 거쳐가는 경로들 중 없는 경로 모두 생성)
				Files.createDirectories(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
//			MultipartFile mFile1 = csInfo.getFile1();
//			System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());
			

			// "랜덤ID값_파일명.확장자" 형식으로 중복 파일명 처리
			String uuid = UUID.randomUUID().toString();
//			System.out.println("uuid : " + uuid);
			
			// 파일명이 존재하는 경우에만 파일명 생성(없을 경우를 대비하여 기본 파일명 널스트링으로 처리)
//			csInfo.setCs_file("");
			
			// 파일명을 저장할 변수 선언
			String fileName1 = uuid.substring(0, 8) + "_" + profile.getOriginalFilename();
			
			String fileRealName = subDir + "/" + fileName1;
			System.out.println("실제 업로드 파일명1 : " + fileRealName);
			
			// -----------------------------------------------------------------------------------
			// MemberService - updateMember() 메서드를 호출하여 회원정보 변경 작업 요청
			// => 파라미터 : fileName1    리턴타입 : int(updateCount)
			int updateCount = service.updateMember(column1, member_id, column2, fileRealName);
			
			
			// 프로필 변경 작업 요청 결과 판별
			if(updateCount > 0) { // 성공
				try {
					// 업로드 된 파일은 MultipartFile 객체에 의해 임시 디렉토리에 저장
					if(!profile.getOriginalFilename().equals("")) {
						profile.transferTo(new File(saveDir, fileName1));
					}

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				// 프로필 변경 작업 성공 시 "성공" 출력
				return "성공";
			} else { // 실패
				return "프로필 변경 실패";
			}
		  
	}
	
	// ajax로 프로필 정보 변경
	@ResponseBody
	@PostMapping("/ajax/profileUpdateInfo")
	public String profileUpdateInfo(HttpSession session
							, Model model
							, @RequestParam Map<String, String> map
							) {
		
		System.out.println("profileUpdatePost:" + map);
		
		String column1 = "member_id";
		String member_id = (String)session.getAttribute("member_id");
		
		String column2 = map.get("column2");
		String value2 = map.get("value2");
		
		// -----------------------------------------------------------------------------------
		// MemberService - updateMember() 메서드를 호출하여 회원정보 변경 작업 요청
		// => 파라미터 : fileName1    리턴타입 : int(updateCount)
		int updateCount = service.updateMember(column1, member_id, column2, value2);
		
		
		// 프로필 변경 작업 요청 결과 판별
		if(updateCount > 0) { // 성공
						
			// 프로필 변경 작업 성공 시 "성공" 출력
			return "성공";
		} else { // 실패
			return "프로필 정보 변경 실패";
		}
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
	
	// 멤버 이메일 인증 요청
	@GetMapping("member_find_emailAuth")
	public String memberFindEmailAuth(HttpSession session
			, Model model) {
		System.out.println("MemberController - memberFindEmailAuth");
		
		return "member/member_find_emailAuth";
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
	
	
	@PostMapping("sendAuthCode")
	@ResponseBody
	public ResponseEntity<?> sendAuthCode(@RequestParam("email") String email, HttpSession session) {
		// 메일 보내기위한 코드 수정
		JavaMailSenderImpl mailSender = (JavaMailSenderImpl)ctx.getBean("mailSender");
		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		session.setAttribute("emailAuthCode", checkNum);
		
		// 메일 제목, 내용
		String subject = "ZERO 회원가입 인증 메일입니다";
		String content = "아래의 인증 번호를 입력해주세요 인증코드 : " + checkNum;
		
		// 보내는 사람
		String from = "zero_market_itwb@naver.com";
		
		// 받는 사람
		String[] to = new String[]{email};
		
		try {
			// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

			// 메일 내용을 채워줌
			mailHelper.setFrom(from);	// 보내는 사람 셋팅
			mailHelper.setTo(to);		// 받는 사람 셋팅
			mailHelper.setSubject(subject);	// 제목 셋팅
			mailHelper.setText(content);	// 내용 셋팅

			// 메일 전송
			mailSender.send(mail);
			
		}  catch(Exception e) {
	        e.printStackTrace();
	        return new ResponseEntity<>(new EmailErrorResponse("이메일 발송에 실패했습니다. 다시 시도해주세요."),
	                HttpStatus.INTERNAL_SERVER_ERROR);
	    }

	    // 반환할 JSON 형식 (성공 시)
	    return new ResponseEntity<>(new SuccessResponse("이메일이 성공적으로 전송되었습니다."), HttpStatus.OK);
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
	
	// Z-MAN 신청폼
	@PostMapping("zman_join_form")
	public String zmanJoinPro() {
		return "member/member_zman_join_form";
	}
	
	// Z-MAN 신청완료
	@PostMapping("zman_join_complete")
	public String zmanJoinComplete() {
		return "member/member_zman_join_complete";
	}
	
	// 마이페이지 작성한 후기
	@GetMapping("member_mypage_write_review")
	public String mypageWriteReview() {
		return "member/member_mypage_write_review";
	}
	
	
	
}






















