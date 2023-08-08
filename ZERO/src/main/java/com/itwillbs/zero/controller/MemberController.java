package com.itwillbs.zero.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.spi.FileSystemProvider;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.zero.email.EmailErrorResponse;
import com.itwillbs.zero.email.SuccessResponse;
import com.itwillbs.zero.handler.MyPasswordEncoder;
import com.itwillbs.zero.service.MemberService;
import com.itwillbs.zero.service.TestService;
import com.itwillbs.zero.vo.MemberVO;
import com.itwillbs.zero.vo.OrderSecondhandVO;
import com.itwillbs.zero.vo.SecondhandVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 메일 인증을위한 Autowired
	@Autowired
	private ApplicationContext ctx;
	
	// 핸드폰 인증을 위한 Autowired
	@Autowired
	private TestService testService; 
	
	
	
	// 멤버 로그인 - 수정
	@GetMapping("member_login")
	public String memberLogin(HttpSession session
			, Model model
			) {
		System.out.println("MemberController - memberlogin");
		
		return "member/member_login";
	}
	
	// 멤버 로그인 프로  - 수정
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
		
		
		Map<String, String> member = service.isMemberCheck("member_id", member_id);
		System.out.println(member);
		
		if(member == null) {
			model.addAttribute("msg", "등록되지 않은 아이디 입니다. "
					+ "입력하신 내용을 다시 확인해주세요.");
			return "fail_back";
		}
	
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
		
		if (member.get("member_passwd") ==  null || !passwordEncoder.matches(member_passwd, member.get("member_passwd"))) {
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

	
	// 로그아웃 작업 후 메인으로 돌아가기  - 수정
	@GetMapping("member_logout")
	public String member_logout(HttpSession session
			, Model model
			) {
		// 세션에 저장한 member_id(저장한 정보들) 초기화
		session.invalidate();
		
		// 세션 초기화 후 main 화면으로 돌아가기
		return "redirect:/";
	}
	
	// 네이버 로그인 콜백  - 수정
	@GetMapping("callback_login_naver")
	public String callbackLoginNaver(HttpSession session
			, Model model) {
		System.out.println("MemberController - callback_login_naver");
		
		return "member/member_callback_naver";
	}
	
	 
	// 네이버 정보 전달  - 수정
	@PostMapping("/ajax/checkUserNaver")
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

	// 구글 로그인 콜백  - 수정
	@GetMapping("callback_login_google")
	public String callbackLoginGoogle(HttpSession session
			, Model model
			) {
		
		System.out.println("MemberController - callback_login_google");
		
		return "member/member_callback";
	}
	
	// ajax로 로그인 정보 가져오기  - 수정
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
	
	// 멤버 로그인정보  - 수정
	@GetMapping("member_Info")
	public String memberLoginInfo(HttpSession session
			, Model model) {
		
		System.out.println("MemberController - memberloginInfo");
		
		String column = "member_id";
		String member_id = (String)session.getAttribute("member_id");
		// 임시 고정값 설정 
		
		System.out.println(column);
		System.out.println(member_id);
		// 회원정보 가져오기
		Map<String, String> member = service.isMemberCheck(column, member_id);
		System.out.println(member);
		
		model.addAttribute("member", member);
		
		return "member/member_Info";
	}
	
//	// 멤버 마케팅 수신 동의 변경
//	@PostMapping("ajax/chgMarketing")
//	@ResponseBody
//	public JSONObject chgMarketing(HttpSession session
//			, Model model
//			, @RequestParam Map<String, String> map
//			) {
//		System.out.println("/ajax/chgMarketing" + map);
//		// 조건 파라미터 - 아이디
//		String column1 = "member_id";
//		String member_id = (String)session.getAttribute("member_id");
//		  
//		// 변경할 컬럼( member_agreement_marketing)
//		String column2 = map.get("column");
//		String value2 = map.get("value");
//		int updateCount = service.updateMember(column1, member_id, column2, value2);
//		
//		JSONObject jo = new JSONObject();
//		jo.put(column2, value2);
//		
//		return jo;
//	}
	
	// 패스워드 일치여부 확인  - 수정
	public String checkPasswd(String column,String member_id, String column1,String value1) {
		System.out.println("checkPasswd");

		
		// 회원정보 가져오기
		Map<String, String> member = service.isMemberCheck(column, member_id);
		
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		MyPasswordEncoder passwordEncoder = new MyPasswordEncoder();
		// 2. getCryptoPassword() 메서드에 평문 전달하여 암호문 얻어오기
//		String securePasswd = member.get("member_passwd");
		
//		if (member.get("member_passwd") ==  null || !passwordEncoder.matches(member_passwd, member.get("member_passwd"))) {
		
		if(!passwordEncoder.isSameCryptoPassword(value1, member.get("member_passwd"))) {
			System.out.println("비밀번호 불일치");
			// 패스워드가 member.getPasswd와 다를 때(비밀번호가 틀림)
//			model.addAttribute("msg", "아이디 또는 비밀번호를 잘못 입력했습니다. "
//					+ "입력하신 내용을 다시 확인해주세요.");
			return "false"; // 회원정보 불일치
		}
			return "true"; // 회원정보 일치
			
		
	
	}
	
	// 멤버 패스워드, 폰번호 변경  - 수정
	@PostMapping("ajax/chgInfo")
	@ResponseBody
	public String chgInfo(HttpSession session
			, Model model
			, @RequestParam Map<String, String> map
			) {
		System.out.println("ajax/chgInfo:" + map + ", session");
		
		String column = "member_id";
		String member_id = (String)session.getAttribute("member_id");
		
		String column1 = map.get("column"); // 변경할 정보 컬럼
		String value1 = map.get("value"); // 변경할 정보 값
		
		String column2 = map.get("column2"); // 이전 패스워드
		String value2 = map.get("value2"); // 이전 패스워드 값
		
		MyPasswordEncoder passwordEncoder = new MyPasswordEncoder();
		
		System.out.println(column + "," + member_id + "," + column1 + "," + value1);
		
		System.out.println("암호화 : " + column1.equals("member_passwd2"));
		if(column1.equals("member_passwd2")) { // 비밀번호 변경 시 암호화
			
			// 1. 이전 비밀번호 일치 여부 확인
			String result = checkPasswd(column, member_id, column2, value2);
			if(result.equals("false")) { // 비밀번호 불일치 시
				return "false";
			}
			
			// 2. getCryptoPassword() 메서드에 평문 전달하여 암호문 얻어오기
			String securePasswd = passwordEncoder.getCryptoPassword(value1);
			System.out.println("암호화된 비밀번호 : " + securePasswd);
			// 3. 리턴받은 암호문을 value1 덮어쓰기
			value1 = securePasswd;
			column1 = "member_passwd";
			System.out.println("value1:" + value1);
		}
		
		int updateCount = service.updateMember(column, member_id, column1, value1);
		
		return column1;
	}
	
	// 멤버 패스워드, 폰번호 변경
//	@PostMapping("zero/ajax/chgInfo")
//	@ResponseBody
//	public String chgInfo2(HttpSession session
//			, Model model
//			, @RequestParam Map<String, String> map
//			) {
//		System.out.println("ajax/chgInfo2" + map);
//		
//		
//		
//		return "ajax 끝";
//	}
	
	// 멤버 주소 등록  - 수정
	@GetMapping("member_address")
	public String memberAddress(HttpSession session
			, Model model) {
		System.out.println("MemberController - memberAddress");
		
		String column = "member_id";
		String member_id = (String)session.getAttribute("member_id");
		// 임시 고정값 설정 
		
		System.out.println(column);
		System.out.println(member_id);
		// 회원정보 가져오기
		Map<String, String> member = service.isMemberCheck(column, member_id);
		System.out.println(member);
		
		model.addAttribute("member", member);
		
		return "member/member_address";
	}	
	
	// 멤버 개인 계좌 등록 
	@GetMapping("member_account")
	public String memberAccount(HttpSession session
			, Model model) {
		System.out.println("MemberController - memberAccount");
		
		String column = "member_id";
		String member_id = (String)session.getAttribute("member_id");
		// 임시 고정값 설정 
		
		System.out.println(column);
		System.out.println(member_id);
		// 회원 계좌 정보 가져오기
		Map<String, String> member = service.selectMemberInfo(column, member_id);
		System.out.println(member);
		
		model.addAttribute("member", member);
		
		return "member/member_account";
	}
	
	// 멤버 프로필  - 수정
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
	 
	// ajax로 프로필 이미지 변경 - 수정
	@PostMapping("ajax/checkUserEmail")
	@ResponseBody	// Json 형태의 응답을 반환하도록 지정
	public String checkUserEmail(HttpSession session
								, Model model
								, @RequestParam Map<String, String> map
								) {
		
		System.out.println("ajax/checkUserEmail : " + map);	
		String phone = "false";
		
		String column = "member_phone";
		String value = map.get("phone");
		
		// 핸드폰번호와 일치하는 이메일 주소가 있을 경우 이메일 주소 리턴
		Map result = service.isMemberCheck(column, value);
		System.out.println(result);
		System.out.println(result.get("member_id"));
		if(result != null) {
			phone = result.get("member_id").toString();
		}
		
		return phone;
		 
	 }
	
	
	
	// ajax로 프로필 이미지 변경  - 수정
	@PostMapping("ajax/profileUpdate")
	@ResponseBody	// Json 형태의 응답을 반환하도록 지정
	public String profileUpdate(HttpSession session
							, Model model
							, @RequestParam MultipartFile profile
							) {
		//  MultipartFile 객체 확인
		  System.out.println("profile : "+ profile);
		  
		  // 조건 파라미터 - 아이디
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
	
	// ajax로 프로필 정보 변경  - 수정
	@ResponseBody
	@PostMapping("/ajax/profileUpdateInfo")
	public String profileUpdateInfo(HttpSession session
							, Model model
							, @RequestParam Map<String, String> map
							) {
		
		System.out.println("profileUpdatePost:" + map);
		
		// 조건 파라미터 - 아이디
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
	
	// 멤버 아이디 찾기  - 수정
	@GetMapping("member_find_id")
	public String memberFindId(HttpSession session
			, Model model) {
		System.out.println("MemberController - memberFindId");
		
		return "member/member_find_id";
	}
	
	// 멤버 패스워드 찾기 폼  - 수정
	@GetMapping("member_find_passwd")
	public String memberFindPasswd(HttpSession session
			, Model model) {
		System.out.println("MemberController - memberFindPasswd");
		
		return "member/member_find_passwd";
	}
	
	// 회원 탈퇴 확인 페이지 이동  - 수정
	@GetMapping("member_find_emailAuth")
	public String memberFindEmailAuth(HttpSession session
			, Model model
			, @RequestParam Map<String, String> map
			) {
		
		System.out.println("memberWithdrawal:" + map);
	
		return "member/member_find_emailAuth";
	}
	
	
	
	// 멤버 이메일 인증 요청 - 작업중
	@PostMapping("request_authMail_find_passwd")
	public String memberFindEmailAuthPro(HttpSession session
			, Map<String, String> map
			, Model model) {
		System.out.println("MemberController - memberFindEmailAuth");
		System.out.println("메일 인증:" + map);
		// 인증 메일 발송 요청
		String sId = (String)model.getAttribute("sId");
		
			// Service - getId() 메서드를 호출하여
			// member 테이블에서 email 에 해당하는 id 값 조회
			// => 파라미터 : 이메일(email)    리턴타입 : String(id)
//			String id = service.getId(email);
//			System.out.println(id);
			
			// SendAuthMail 인스턴스 생성 후 sendMail() 메서드 호출하여 메일 발송 요청
			// => 파라미터 : 아이디, 이메일   리턴타입 : boolean(isSendSuccess)
//			SendMailService mailService = new SendMailService();
//			String authCode = mailService.sendAuthMail(id, email);
//			System.out.println("메일 발송 결과 인증코드 : " + authCode);
			
			// MemberService - registAuthInfo() 메서드를 호출하여 
			// 인증 메일에 포함된 아이디와 인증코드를 인증정보 테이블에 추가
			// => 파라미터 : 아아디, 인증코드   리턴타입 : void
			// => 단, 메일 발송 후 리턴받은 인증코드가 있을 경우에만 작업 수행
//			if(!authCode.equals("")) {
//				// 인증 코드 DB 작업 요청
//				service.registAuthInfo(id, authCode);
//				
//				// AJAX 요청에 대한 응답으로 "true" 값 리턴
//				return "true";
//			}
//			
//			return "false";
		
		return "member/member_find_emailAuth";
	}
	
	// 회원 탈퇴 확인 페이지 이동  - 수정
	@GetMapping("member_withdrawal")
	public String memberWithdrawal(HttpSession session
			, Model model
			, @RequestParam Map<String, String> map
			) {
		
		System.out.println("memberWithdrawal:" + map);
	
		return "member/member_withdrawal";
	}
	
	// 회원 탈퇴 요청/ajax/checkWithrawal  - 수정
	@GetMapping("/ajax/checkWithrawal")
	@ResponseBody
	public String checkWithrawal(HttpSession session
			, Model model
			) {
		System.out.println("ajax/checkWithrawal");
		
		// 세션 파라미터 없을 경우 리턴(구현중)

		
		// 조건 파라미터 - 아이디
		String column1 = "member_id";
		String member_id = (String)session.getAttribute("member_id");
		
		// 변경할 컬럼 파라미터
		String column2 ="member_status";
		String value2 = "탈퇴";
		
		// 옥션 판매중이거나 낙찰진행중인 경우 탈퇴 불가
		String column3 = "";
		
		if(false) { // 중고거래 z맨 호출중이거나 옥션 판매중이거나 입찰 진행중인 경우(구현중)
			
			return "false";
		}
		// -----------------------------------------------------------------------------------
		// MemberService - updateMember() 메서드를 호출하여 회원정보 상태 탈퇴 변경 작업 요청
		// => 파라미터 : column2, value2    리턴타입 : int(updateCount)
		int updateCount = service.updateMember(column1, member_id, column2, value2);
		
		
		// 회원상태 탈퇴 변경 작업 요청 결과 판별
		if(updateCount > 0) { // 성공
			
			return "true";
			
		} else { // 실패

			return "false";
			
		}
		
	}
	
	
	// 멤버 마이스토어 - 수정
	@GetMapping("member_mystore")
	public String memberMyStore(HttpSession session
			, @RequestParam(required = false) String member_id
			, Model model) {
		System.out.println("MemberController - memberMyStore");
		// 임시 고정값 설정 
		String column = "member_id";
		
		if(member_id == null ) { // 파라미터 member_id가 없을경우 세션 아이디 설정
			member_id = (String)session.getAttribute("member_id");
		}  
		
		System.out.println(column);
		System.out.println(member_id);
		//상단 프로필 회원정보 가져오기
		Map<String, String> member = service.isMemberCheck(column, member_id);
		System.out.println(member);
		
		// COUNT 함수 값 가져오기
		
		model.addAttribute("member", member);
		
		// 중고 상품 회원정보 가져오기
		List<Map<String, String>> sellList = service.selectSecondhandList(member_id);
		System.out.println("sellList:" + sellList);
		model.addAttribute("sellList", sellList);
		
		return "member/member_mystore";
	}

	
	// 등록한 중고 상품 리스트 - 수정
	@ResponseBody
	@GetMapping("/ajax/mySecondhandList")
	public String myStoreSecondHandList(HttpSession session
							, Model model
							, @RequestParam(required = false) String member_id
							, @RequestParam Map<String, String> map
							) {
		System.out.println("/ajax/mySecondhandList - myStoreSecondHandList ");
		// 임시 고정값 설정 
		if(member_id == null ) { // 파라미터 member_id가 없을경우 세션 아이디 설정
			member_id = (String)session.getAttribute("member_id");
		}  
		System.out.println(member_id);

		List<Map<String, String>> sellList = service.selectSecondhandList(member_id);
		System.out.println("sellList:" + sellList);
		JSONArray myStore = new JSONArray();

		for (Map<String, String> item : sellList) {
		    JSONObject jsonItem = new JSONObject(item);
		    myStore.put(jsonItem);
		}

//		JSONObject resultObject = new JSONObject();
//		resultObject.put("myStore", jsonArray);
		
		return myStore.toString();
	}
	
	// 등록한 중고 상품 후기 리스트 - 수정
	@ResponseBody
	@GetMapping("/ajax/sell_secondhand_reviews")
	public String sellSecondhand_reviews(HttpSession session
							, Model model
							, @RequestParam(required = false) String member_id
							, @RequestParam Map<String, String> map
							) {
		
		System.out.println();
		// 임시 고정값 설정 
		if(member_id == null ) { // 파라미터 member_id가 없을경우 세션 아이디 설정
			member_id = (String)session.getAttribute("member_id");
		}  
		System.out.println(member_id);
		
		List<Map<String, String>> sellReviewList = service.selectsellReviewList(member_id);
		System.out.println("sellReviewList:" + sellReviewList);
		JSONArray myStore = new JSONArray();

		for (Map<String, String> item : sellReviewList) {
		    JSONObject jsonItem = new JSONObject(item);
		    myStore.put(jsonItem);
		}

//		JSONObject resultObject = new JSONObject();
//		resultObject.put("myStore", jsonArray);
		
		return myStore.toString();
	}
	
	// 등록한 경매 상품 리스트 - 수정
	@ResponseBody
	@GetMapping("/ajax/sell_auctionList")
	public String sellAuctionList(HttpSession session
							, Model model
							, @RequestParam(required = false) String member_id
							, @RequestParam Map<String, String> map
							) {
		
		System.out.println();
		
		if(member_id == null ) { // 파라미터 member_id가 없을경우 세션 아이디 설정
			member_id = (String)session.getAttribute("member_id");
		}  
		System.out.println(member_id);

		List<Map<String, String>> auctionList = service.selectAuctionList(member_id);
		System.out.println("auctionList:" + auctionList);
		JSONArray myStore = new JSONArray();

		for (Map<String, String> item : auctionList) {
		    JSONObject jsonItem = new JSONObject(item);
		    myStore.put(jsonItem);
		}

//		JSONObject resultObject = new JSONObject();
//		resultObject.put("myStore", jsonArray);
		System.out.println(myStore.toString());
		return myStore.toString();
	}
	
	// 등록한 찜목록 리스트  - 수정
	@ResponseBody
	@GetMapping("/ajax/myLikeList")
	public String myLikeList(HttpSession session
							, Model model
							, @RequestParam(required = false) String member_id
							, @RequestParam Map<String, String> map
							) {
		
		System.out.println();
		if(member_id == null ) { // 파라미터 member_id가 없을경우 세션 아이디 설정
			member_id = (String)session.getAttribute("member_id");
		} 
		System.out.println(member_id);

		List<Map<String, String>> likeList = service.selectLikeList(member_id);
		System.out.println("likeList:" + likeList);
		JSONArray myStore = new JSONArray();

		for (Map<String, String> item : likeList) {
		    JSONObject jsonItem = new JSONObject(item);
		    myStore.put(jsonItem);
		}

//		JSONObject resultObject = new JSONObject();
//		resultObject.put("myStore", jsonArray);
		
		return myStore.toString();
	}
	
	// 등록한 찜 삭제  - 수정
//	@ResponseBody
//	@GetMapping("/ajax/deleteMyLikeList")
//	public String deleteMyLikeList(HttpSession session
//			, Model model
//			, @RequestParam Map<String, String> map
//			) {
//	
//		System.out.println("/ajax/deleteMyLikeList");
//
//		
//		return "선택학 찜 목록이 삭제되었습니다";
//	}
	
	// 멤버 메인화면
	@GetMapping("member_mypage_main")
	public String memberMypageHome(HttpSession session, Model model) {
		
		// 세션 아이디가 없을 경우 " 로그인이 필요합니다!" 출력 후 이전페이지로 돌아가기
		String member_id = (String) session.getAttribute("member_id");
//		if(member_id == null) {
//			model.addAttribute("msg", " 로그인이 필요합니다!");
//			model.addAttribute("targetURL", "member_login_form");
//			
//			return "fail_location";
//		}
		
		// 세션 아이디로 구매내역 받아오기(최근 세개),(myOrderSecondhandList 줄임)
		List<OrderSecondhandVO> myOdShList = service.getMyOdShList(member_id, 0, 3); 
//		Map으로 하면 order_secondhand_date 값 = [unread] 다음에수정하기 
//		List<Map<String, Object>> myOdShList = service.getMyOdShList(member_id, 0, 2);
		
		// 세션 아이디로 판매내역 받아오기(최근 두개)
		List<SecondhandVO> myShList = service.getmyShList(member_id, 0, 3);
		
		model.addAttribute("myOdShList", myOdShList);
		model.addAttribute("myShList", myShList);
		
		return "member/member_mypage_main";
	}
	
	// 멤버 중고상품 구매내역
	@GetMapping("member_mypage_buyList")
	public String memberMypageBuyList(HttpSession session, Model model) {
		
		// 세션 아이디가 없을 경우 " 로그인이 필요합니다!" 출력 후 이전페이지로 돌아가기
		String member_id = (String) session.getAttribute("member_id");
//				if(member_id == null) {
//					model.addAttribute("msg", " 로그인이 필요합니다!");
//					model.addAttribute("targetURL", "member_login_form");
//					
//					return "fail_location";
//				}
		
		// 세션 아이디로 구매내역 받아오기(myOrderSecondhandList 줄임), 페이징처리해야됨
		List<OrderSecondhandVO> myOdShList = service.getMyOdShList(member_id, 0, 5);
		
		model.addAttribute("myOdShList", myOdShList);
		
		return "member/member_mypage_buyList";
	}
	
	// 멤버 중고상품 판매내역
	@GetMapping("member_mypage_sellList")
	public String memberMypageSellList(HttpSession session, Model model) {
		
		// 세션 아이디가 없을 경우 " 로그인이 필요합니다!" 출력 후 이전페이지로 돌아가기
		String member_id = (String) session.getAttribute("member_id");
//				if(member_id == null) {
//					model.addAttribute("msg", " 로그인이 필요합니다!");
//					model.addAttribute("targetURL", "member_login_form");
//							
//					return "fail_location";
//				}
		
		// 세션 아이디로 판매내역 받아오기
		List<SecondhandVO> myShList = service.getmyShList(member_id, 0, 5);
		
		model.addAttribute("myShList", myShList);
		
		return "member/member_mypage_sellList";
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
	
	// 회원가입 메일인증
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
	
	// 메일인증 코드 확인
	@PostMapping("checkAuthCode")
	@ResponseBody
	public ResponseEntity<?> checkAuthCode(@RequestParam("inputAuthCode") String inputAuthCode,
	                                       HttpSession session) {
	    Integer storedAuthCode = (Integer) session.getAttribute("emailAuthCode");

	    if (storedAuthCode == null) {
	        return new ResponseEntity<>(new EmailErrorResponse("세션에 인증코드 정보가 없습니다."), HttpStatus.BAD_REQUEST);
	    }

	    if (storedAuthCode.toString().equals(inputAuthCode)) {
	        return new ResponseEntity<>(new SuccessResponse("인증코드가 일치합니다."), HttpStatus.OK);
	    } else {
	        // 인증코드 불일치
	        return new ResponseEntity<>(new EmailErrorResponse("인증코드가 일치하지 않습니다!"), HttpStatus.OK);
	    }
	}

	// 핸드폰 인증
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

		testService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		
		return Integer.toString(randomNumber);
		
	}
	
	// 회원가입 폼에서 아이디 중복확인
	@PostMapping("/idCheck")
	@ResponseBody // json 값을 가져오기 위한 어노테이션 @ResponseBody
	public int idCheck(@RequestParam("id") String id) { // id 값을 받아오기 위한 @RequestParam
		int cnt = service.idCheck(id);
		return cnt;
	}
	
	// 회원가입 폼에서 닉네임 중복확인
	@PostMapping("/nickCheck")
	@ResponseBody // json 값을 가져오기 위한 어노테이션 @ResponseBody
	public int nickCheck(@RequestParam("nickname") String nickname) { // id 값을 받아오기 위한 @RequestParam
		int cnt = service.nickCheck(nickname);
		return cnt;
	}
	
	// 회원가입 폼에서 핸드폰 중복확인
	@PostMapping("/phoneCheck")
	@ResponseBody // json 값을 가져오기 위한 어노테이션 @ResponseBody
	public int phoneCheck(@RequestParam("phone") String phone) { // id 값을 받아오기 위한 @RequestParam
		int cnt = service.phoneCheck(phone);
		return cnt;
	}
	
	
	// 회원가입 완료 이동
	@GetMapping("join_complete")
	public String memberJoinComplete() {
		return "member/member_join_complete";
	}
	
	// Z-MAN 신청
	@GetMapping("zman_join")
	public String zmanJoin() {
		return "member/member_zman_join_identification";
	}
	
//	-------------------- ZMAN 컨트롤러 이동후 삭제예정 정의효 -----------------
	// Z-MAN 신청폼
//	@GetMapping("zman_join_form")
//	public String zmanJoinPro() {
//		return "member/member_zman_join_form";
//	}
//	
//	// Z-MAN 신청완료
//	@PostMapping("zman_join_complete")
//	public String zmanJoinComplete() {
//		return "member/member_zman_join_complete";
//	}
//	-------------------- ZMAN 컨트롤러 이동후 삭제예정 정의효 -----------------
	
	// 마이페이지 작성한 후기
	@GetMapping("member_mypage_write_review")
	public String mypageWriteReview() {
		return "member/member_mypage_write_review";
	}
	
	
	
}






















