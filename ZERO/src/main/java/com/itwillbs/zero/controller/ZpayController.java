package com.itwillbs.zero.controller;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.zero.vo.BankAccountDetailVO;
import com.itwillbs.zero.vo.MemberVO;
import com.itwillbs.zero.vo.OrderAuctionVO;
import com.itwillbs.zero.vo.ResponseTokenVO;
import com.itwillbs.zero.vo.ResponseUserInfoVO;
import com.itwillbs.zero.vo.ResponseWithdrawVO;
import com.itwillbs.zero.vo.ZpayHistoryVO;
import com.itwillbs.zero.vo.ZpayVO;
import com.itwillbs.zero.vo.OrderSecondhandVO;
import com.itwillbs.zero.vo.PageInfoVO;
import com.itwillbs.zero.vo.ResponseDepositVO;
import com.itwillbs.zero.vo.ZeroAccountHistoryVO;
import com.itwillbs.zero.vo.ZmanEarningVO;
import com.itwillbs.zero.vo.ZmanRefundHistoryVO;
import com.itwillbs.zero.handler.MyPasswordEncoder;
import com.itwillbs.zero.service.BankApiService;
import com.itwillbs.zero.service.BankService;
import com.itwillbs.zero.service.MemberService;
import com.itwillbs.zero.service.ZpayService;

@Controller
public class ZpayController {
	
	@Autowired
	private ZpayService service;
	
	@Autowired
	private BankService bankService;
	
	@Autowired
	private BankApiService bankApiService;
	
	@Autowired
	private MemberService memberService;
	
	// zpay_main.jsp 페이지로 디스페치
	// ZPAY 사용 내역(목록) 조회
	// ZPAY 잔액 조회	
	@GetMapping("zpay_main")
	public String zpayMain(
			Model model, HttpSession session) {
		System.out.println("ZpayController - zpayMain()");
		
		String member_id = (String)session.getAttribute("member_id");
		
//		if(member_id == null) {
//			model.addAttribute("msg", "로그인이 필요합니다.");
//			model.addAttribute("targetURL", "./");
//			
//			return "fail_location";
//		}
		MemberVO member = memberService.getMember(member_id);
		
		// 토큰 정보 조회 => 세션에 저장
		ResponseTokenVO token = bankService.getTokenForBankAuth(member_id);	
		if(token != null) {
			session.setAttribute("access_token", token.getAccess_token());
			session.setAttribute("user_seq_no", token.getUser_seq_no());
		}		
		
		// ZPAY 사용자 여부 조회 = > 미사용자인 경우 ZPAY 등록 폼으로 이동
		ZpayVO zpay = service.isZpayUser(member_id);
		if(zpay == null) {
//			session.setAttribute("previousPage", "zpay_main");
			model.addAttribute("member", member);	
			return "zpay/zpay_regist_form";
		}
		
		model.addAttribute("member", member);
		return "zpay/zpay_main_scroll";
	}
	
	@ResponseBody
	@GetMapping("zpay_main_ajax")
	public String zpayMainAjax(
			@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String startDate, 
			@RequestParam(defaultValue = "") String endDate, 
			@RequestParam(defaultValue = "1") int pageNum, 
			Model model, HttpSession session) {
		System.out.println("ZpayController - zpayMainAjax()");
		System.out.println(pageNum);
		
		String member_id = (String)session.getAttribute("member_id");
		MemberVO member = memberService.getMember(member_id);
		
		// ------------------------------------------------------------------------------------------------------
		int listLimit = 5; //한페이지 표시 목록갯수
		int startRow = (pageNum - 1) * listLimit; //조회시작 행번호
		
		//페이징 계산작업
		//1.전체게시물 수 조회 작업 요청
		int listCount = service.getZpayHistoryListCount(member_id, searchType, startDate, endDate);
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //3. 전체 페이지 목록갯수
		
		// ------------------------------------------------------------------------------------------------------
		// ZPAY 사용자일 경우 ZPAY 이용 내역 정보 조회 후 zpay_main 페이지로 이동
		List<ZpayHistoryVO> zpayHistoryList = service.getZpayHistoryList(member_id, searchType, startDate, endDate, startRow, listLimit);
		System.out.println(zpayHistoryList);
		System.out.println(member_id);
		
		Integer zpay_balance = service.getZpayBalance(member_id);
		System.out.println(zpay_balance);
		
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("zpayHistoryList", zpayHistoryList);
		jsonObject.put("maxPage", maxPage);
		jsonObject.put("zpay_balance", zpay_balance);
		jsonObject.put("listCount", listCount);
		System.out.println(jsonObject.toString());
		
		return jsonObject.toString();
	}
	
	// ZPAY 비밀번호 등록 페이지로 이동
	@PostMapping("zpay_passwd_regist")
	public String zpayPasswdRegist(@RequestParam Map<String, String> map,
									Model model, 
									HttpSession session) {
		
		model.addAttribute("user_name", map.get("user_name"));
		model.addAttribute("fintech_use_num", map.get("fintech_use_num"));
		model.addAttribute("bank_name", map.get("bank_name"));
		model.addAttribute("account_num_masked", map.get("account_num_masked"));
		
		return "zpay/zpay_passwd_regist";
	}
	
	// ZPAY 등록
	@PostMapping("zpay_regist")
	public String zpayRegist(@RequestParam Map<String, String> map, 
							Model model, 
							HttpSession session) {
		System.out.println("ZpayController - zpayRegist");
		String member_id = (String)session.getAttribute("member_id");
		
		// 세션에 저장된 엑세스토큰 및 사용자번호를 변수에 저장
		// => 핀테크 이용자 정보 조회
		// => 예금주명, 계좌번호(마스킹), 핀테크이용번호 조회하여 ZPAY테이블에 정보 추가(ZPAY 등록)
		String access_token = (String)session.getAttribute("access_token");
		
		// 엑세스토큰이 없을 경우 "계좌인증필수" 출력 후 이전페이지로 돌아가기
		if(session.getAttribute("member_id") == null || session.getAttribute("access_token") == null) {
			model.addAttribute("msg", "권한이 없습니다!");
			return "bank_auth_fail_back";
		}
		
		// 패스워드 암호화(해싱)--------------
		// => MyPasswordEncoder  클래스에 덮어쓰기
		MyPasswordEncoder passwordEncoder = new MyPasswordEncoder();
		
		// 2. getCtyptoPassword() 메서드에 평문 전달하며 암호문 얻어오기
		String securePasswd = passwordEncoder.getCryptoPassword(map.get("zpay_passwd1"));
		
		// 3. 리턴받은 암호문을 MemberVO 객체에 덮어쓰기
//		member.setMember_pass(securePasswd);
		
		// --------------------------------------
		
		// 핀테크 이용자 정보를 ZPAY 테이블에 추가 => 이용자의 ZPAY 등록
		ZpayVO zpay = new ZpayVO();
		zpay.setMember_id(member_id);
		zpay.setZpay_bank_name(map.get("bank_name"));
		zpay.setZpay_bank_account(map.get("account_num_masked"));
		zpay.setAccess_token(access_token);
		zpay.setFintech_use_num(map.get("fintech_use_num"));
		zpay.setZpay_passwd(securePasswd);
//		zpay.setZpay_passwd(map.get("zpay_passwd1"));
		
		int insertCount = service.registZpay(zpay);
		
		System.out.println(session.getAttribute("previousPage"));
		System.out.println(session.getAttribute("previousPage") == null);
		if(insertCount > 0) {
			if(session.getAttribute("previousPage") != null) {
				return "redirect:/" + session.getAttribute("previousPage");				
			} else {
				return "redirect:/zpay_main";
			}
		} else {
			model.addAttribute("msg", "ZPAY 등록 실패");
			return "bank_auth_fail_back";
		}
	}
	

	// 비밀번호 확인 페이지로 이동
	@PostMapping("zpay_passwd_check_form")
	public String zpayPasswdCheck(@RequestParam String member_id, 
								@RequestParam String zpayAmount, 
								@RequestParam(defaultValue = "0") int order_secondhand_idx, 
								@RequestParam(defaultValue = "0") int order_auction_idx, 
								@RequestParam(defaultValue = "0") int zman_earning_idx, 
								@RequestParam String targetURL,
								Model model) {
		System.out.println("ZpayController - zpayPasswdCheck()");
		model.addAttribute("zpayAmount", zpayAmount);
		model.addAttribute("targetURL", targetURL);
		
		if(order_secondhand_idx != 0) {
			model.addAttribute("order_secondhand_idx", order_secondhand_idx);
		} else if(order_auction_idx != 0) {
			model.addAttribute("order_auction_idx", order_auction_idx);
		} else if(zman_earning_idx != 0) {
			model.addAttribute("zman_earning_idx", zman_earning_idx);	
		}
		
		return "zpay/zpay_passwd_check_form";
	}
	
	
	// AJAX를 통한 비밀번호확인 비즈니스 로직
	@ResponseBody
	@PostMapping("zpay_passwd_check_pro")
	public String zpayPasswdCheckPro(@RequestParam String zpay_passwd, Model model, HttpSession session) {
		
		String member_id = (String)session.getAttribute("member_id");
		
		// 암호화된 ZPAY 비번 조회
		String securePasswd = service.getZpayPasswd(member_id);
		System.out.println(securePasswd);
		System.out.println("zpay_passwd : " + zpay_passwd);
	
		// 2. BcryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		// 3. BcryptPasswordEncoder 객체의 matches() 메서드 호출해서 암호 비교
		System.out.println("securePasswd : " + securePasswd);
	
		if (zpay_passwd ==  null || !passwordEncoder.matches(zpay_passwd, securePasswd)) {
			// 패스워드가 zpay_passwd와 다를 때(비밀번호가 틀림)
			return "false";
		} else {
		
			return "true";
		}
	}
	
	
	// zpay_charge_form.jsp 페이지로 디스페치
	@GetMapping("zpay_charge_form")
	public String zpayChargeForm(Model model, HttpSession session) {
		System.out.println("ZpayController - zpayChargeForm()");
		
		String access_token = (String)session.getAttribute("access_token");

		// 엑세스토큰이 없을 경우 "계좌인증필수" 출력 후 이전페이지로 돌아가기
		if(access_token == null) {
			model.addAttribute("msg", "계좌 인증 필수!");
			return "bank_auth_fail_back";
		}
		
		ZpayVO zpay = service.getZpay((String)session.getAttribute("member_id"));
		model.addAttribute("zpay", zpay);
		
		// 계좌 여러개 등록 시 사용
		List<ZpayVO> myAccountList = service.getMyAccountList((String)session.getAttribute("member_id"));
		model.addAttribute("myAccountList", myAccountList);
		
		return "zpay/zpay_charge_form";
	}
	
	
	// ZPAY 충전 비즈니스 로직 요청
	@PostMapping("zpay_charge_pro")
	public String zpayChargePro(ZpayHistoryVO zpayHistory, 
								@RequestParam String member_id, 
								@RequestParam String zpayAmount, 
								@RequestParam String zpay_passwd,
								Map<String, String> map,
								Model model) {
		System.out.println("ZpayController - zpayChargePro()");
		System.out.println(zpayAmount);
		
		// 암호화된 ZPAY 비번 조회
		String securePasswd = service.getZpayPasswd(member_id);
		System.out.println(securePasswd);
		System.out.println(zpay_passwd);
	
		// 2. BcryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		// 3. BcryptPasswordEncoder 객체의 matches() 메서드 호출해서 암호 비교
		// => 파라미터 : 평문, 암호화 된 암호 		리턴타입 : boolean
		// 로그인 성공/ 실패 여부 판별하여 포워딩
		// => 성공 : ZpayVO 객체에 데이터가 저장되어 있고 입력받은 패스워드가 같음
		// => 실패 : ZpayVO 객체가 null 이거나 입력받은 패스워드와 다름
		System.out.println("securePasswd : " + securePasswd);
	
		if (zpay_passwd ==  null || !passwordEncoder.matches(zpay_passwd, securePasswd)) {
			// 패스워드가 zpay_passwd와 다를 때(비밀번호가 틀림)
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다."
					+ "입력하신 내용을 다시 확인해주세요.");
			return "fail_back";
		} else {
		
			// 출금이체 요청을 위한 계좌정보(ZPAY테이블 - fintech_use_num, access_token) 조회 => Map 객체에 저장
			ZpayVO zpay = service.getZpay(member_id);
			map.put("access_token", zpay.getAccess_token());
			map.put("fintech_use_num", zpay.getFintech_use_num());
			// 금결원 테스트데이터 등록 후
			map.put("zpayAmount", zpayAmount);
			
			// BankApiService - requestWithdraw() 메서드를 호출하여 출금이체 요청
			// => 파라미터 : Map 객체   리턴타입 : ResponseWithdrawVO
//			ResponseWithdrawVO withdrawResult = bankApiService.requestWithdraw(map);
			
			// Model 객체에 ResponseWithdrawVO 객체 저장
//			model.addAttribute("withdrawResult", withdrawResult);
			
			// ---------------------------------------------------------------------------------------------------------------
			// ZPAY_HISTORY 테이블에서 잔액조회
			Integer zpay_balance = service.getZpayBalance(member_id);
			
			zpayHistory.setZpay_idx(zpay.getZpay_idx());
			zpayHistory.setZpay_amount(Integer.parseInt(zpayAmount));
//			zpayHistory.setZpay_amount(withdrawResult.getTran_amt());
			zpayHistory.setZpay_balance(zpay_balance);
			zpayHistory.setZpay_deal_type("충전");
			System.out.println(zpayHistory);
			
			// ZPYA_HISTORY 테이블에 충전내역 추가
			int insertCount = service.chargeZpay(zpayHistory);
			
			if(insertCount > 0) {
				// -------------------------- ZERO 약정계좌 거래(입금)내역 추가 --------------------------------------
				// - 포인트 충전시 1% 추가 충전이기 때문에 ZERO 약정계좌에는 99%만 입금되어야 함
				ZpayHistoryVO zpayHistoryInserted = new ZpayHistoryVO();
				zpayHistoryInserted = service.getzpayHistoryInserted();
				
				Integer zero_account_balance = service.getZeroAccountBalance();
				
				ZeroAccountHistoryVO zeroAccount = new ZeroAccountHistoryVO();
				zeroAccount.setMember_id(member_id);
				zeroAccount.setZpay_history_idx(zpayHistoryInserted.getZpay_history_idx());
				zeroAccount.setZero_account_amount(Integer.parseInt(zpayAmount));
				zeroAccount.setZero_account_balance(zero_account_balance);
				zeroAccount.setZero_account_type("충전");
				
				int insertZeroCount = service.depositWithdrawZeroAccount(zeroAccount);
//				int insertZeroCount = service.depositZeroAccount(zeroAccount);
				// --------------------------------------------------------------------------------------------------
				
				if(insertZeroCount > 0) {
					zpay_balance = service.getZpayBalance(member_id);
					
					model.addAttribute("zpayHistory", zpayHistory);
					model.addAttribute("zpay_balance", zpay_balance);
					return "zpay/zpay_charge_success";							
				} else {
					model.addAttribute("msg", "ZERO 계좌 입금 실패");
					return "fail_back";
				}
			} else {
				model.addAttribute("msg", "ZPAY 충전 실패");
				return "fail_back";
			}
		}
		
	}
	
	// zpay_refund_form.jsp 페이지로 디스페치
	@GetMapping("zpay_refund_form")
	public String zpayRefundForm(Model model, HttpSession session) {
		System.out.println("ZpayController - zpayRefundForm()");
		
		String member_id = (String)session.getAttribute("member_id");
		
		// 환급받을 계좌 정보와 환급가능한 금액(zpay 잔액) 조회
		ZpayVO zpay = service.getZpay(member_id);
		Integer zpay_balance = service.getZpayBalance(member_id);
		
		// 경매입찰 중일 경우 입찰한 금액 빼고 환급 가능 ----------------------------------------------------------------------------
		// 현재 참여하고 있는 경매 입찰이 있는 지 확인
		List<Map<String, Object>> isAuctionParticipant = service.isAuctionParticipant(member_id);
		// 현재 참여하고 있는 경매 입찰이 있을 경우 
		// (balance - 입찰한 금액의 합)과 zpayAmount를 비교하여 
		// (balance - 입찰한 금액의 합) < zpayAmount 일 경우 환급 불가
		if(isAuctionParticipant.size() > 0) {
			
			long auction_log_bid_sum = 0;
			for (Map<String, Object> participant : isAuctionParticipant) {
			    Integer maxBid = (Integer) participant.get("max_auction_log_bid");
			    auction_log_bid_sum += maxBid;
			}
			
	        long auctionLogBidSum = auction_log_bid_sum;
	        long availableBalance = zpay_balance - auction_log_bid_sum < 0 ? 0 : zpay_balance - auction_log_bid_sum;
	        
			model.addAttribute("auctionLogBidSum", auctionLogBidSum);
			model.addAttribute("availableBalance", availableBalance);
		}
				
		model.addAttribute("zpay", zpay);
		model.addAttribute("zpay_balance", zpay_balance);
		return "zpay/zpay_refund_form";
	}
	
	
	// ZPAY 환급 비즈니스 로직 요청
	@PostMapping("zpay_refund_pro")
	public String zpayRefundPro(ZpayHistoryVO zpayHistory, 
			@RequestParam String member_id, 
			@RequestParam String zpayAmount, 
			@RequestParam String zpay_passwd,
			Map<String, String> map,
			Model model) {
		System.out.println("ZpayController - zpayRefundPro()");
		Integer zpay_balance = service.getZpayBalance(member_id);
		
		// ============================================ 환급 불가 ===================================================================
		// 잔액을 초과할 경우 환급 진행 불가 
		if(zpay_balance < Integer.parseInt(zpayAmount)) {
			model.addAttribute("msg", "ZPAY 잔액을 초과하였습니다.\\n금액을 다시 입력해주세요.");
		}

		// 경매입찰 중일 경우 입찰한 금액 빼고 환급 가능 ----------------------------------------------------------------------------
		// 현재 참여하고 있는 경매 입찰이 있는 지 확인
		List<Map<String, Object>> isAuctionParticipant = service.isAuctionParticipant(member_id);
		// 현재 참여하고 있는 경매 입찰이 있을 경우 
		// (balance - 입찰한 금액의 합)과 zpayAmount를 비교하여 
		// (balance - 입찰한 금액의 합) < zpayAmount 일 경우 환급 불가
		if(isAuctionParticipant.size() > 0) {
			
			long auction_log_bid_sum = 0;
			for (Map<String, Object> participant : isAuctionParticipant) {
			    Integer maxBid = (Integer) participant.get("max_auction_log_bid");
			    auction_log_bid_sum += maxBid;
			}
			
			if(zpay_balance - auction_log_bid_sum < Integer.parseInt(zpayAmount)) {
				
				Locale koreanLocale = new Locale("ko", "KR");
		        NumberFormat koreanFormat = NumberFormat.getInstance(koreanLocale);
		        
		        String auctionLogBidSum = koreanFormat.format(auction_log_bid_sum);
		        String availableBalance 
		        	= koreanFormat.format(zpay_balance - auction_log_bid_sum < 0 ? 0 : zpay_balance - auction_log_bid_sum);
		        
				model.addAttribute("msg", "출금 가능한 금액을 초과하였습니다.\\n입찰금액 합 : " 
											+ auctionLogBidSum + "원\\n출금가능 금액 : "
											+ availableBalance + "원");
				return "fail_back";
			}
			
		}

		// 입금이체 요청을 위한 계좌정보(ZPAY테이블 - fintech_use_num, access_token) 조회 => Map 객체에 저장 =======================
		
		// 암호화된 ZPAY 비번 조회
		String securePasswd = service.getZpayPasswd(member_id);
		System.out.println(securePasswd);
		System.out.println("zpay_passwd : " + zpay_passwd);
	
		// 2. BcryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		// 3. BcryptPasswordEncoder 객체의 matches() 메서드 호출해서 암호 비교
		// => 파라미터 : 평문, 암호화 된 암호 		리턴타입 : boolean
		// 로그인 성공/ 실패 여부 판별하여 포워딩
		// => 성공 : ZpayVO 객체에 데이터가 저장되어 있고 입력받은 패스워드가 같음
		// => 실패 : ZpayVO 객체가 null 이거나 입력받은 패스워드와 다름
		System.out.println("securePasswd : " + securePasswd);
	
		if (zpay_passwd ==  null || !passwordEncoder.matches(zpay_passwd, securePasswd)) {
			// 패스워드가 zpay_passwd와 다를 때(비밀번호가 틀림)
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다."
					+ "입력하신 내용을 다시 확인해주세요.");
			return "fail_back";
		} else {
		
			ZpayVO zpay = service.getZpay(member_id);
			map.put("access_token", zpay.getAccess_token());
			map.put("fintech_use_num", zpay.getFintech_use_num());
			// 금결원 테스트데이터 등록 후
			map.put("zpayAmount", zpayAmount);
			
			// BankApiService - requestWithdraw() 메서드를 호출하여 출금이체 요청
			// => 파라미터 : Map 객체   리턴타입 : ResponseWithdrawVO
//			ResponseDepositVO depositResult = bankApiService.requestDeposit(map);
			
			// Model 객체에 ResponseWithdrawVO 객체 저장
//			model.addAttribute("depositResult", depositResult);
			
			// ZPAY_HISTORY 테이블에서 잔액조회 ========================================================================================
//			Integer zpay_balance = service.getZpayBalance(member_id);
			
			zpayHistory.setZpay_idx(zpay.getZpay_idx());
			zpayHistory.setZpay_amount(Integer.parseInt(zpayAmount));
//			zpayHistory.setZpay_amount(depositResult.getRes_list() == null? 0 : depositResult.getRes_list().get(0).getTran_amt());
			zpayHistory.setZpay_balance(zpay_balance);	// 기존 잔액 =>ZpayMapper.xml에서 zpay_amount를 더할 예정
			zpayHistory.setZpay_deal_type("환급");
			System.out.println(zpayHistory);
			
			// ZPYA_HISTORY 테이블에 환급내역 추가
			int insertCount = service.refundZpay(zpayHistory);
			
			if(insertCount > 0) {
				// ----------------- ZERO 약정계좌 거래(출금)내역 추가 ----------------------------------------------
				ZpayHistoryVO zpayHistoryInserted = new ZpayHistoryVO();
				zpayHistoryInserted = service.getzpayHistoryInserted();
				
				Integer zero_account_balance = service.getZeroAccountBalance();
				
				ZeroAccountHistoryVO zeroAccount = new ZeroAccountHistoryVO();
				zeroAccount.setMember_id(member_id);
				zeroAccount.setZpay_history_idx(zpayHistoryInserted.getZpay_history_idx());
				zeroAccount.setZero_account_amount(Integer.parseInt(zpayAmount));
				zeroAccount.setZero_account_balance(zero_account_balance);
				zeroAccount.setZero_account_type("환급");
				
				int insertZeroCount = service.depositWithdrawZeroAccount(zeroAccount);
	//			int insertZeroCount = service.withdrawZeroAccount(zeroAccount);
				// --------------------------------------------------------------------------------------------------
				zpay_balance = service.getZpayBalance(member_id);
				
				model.addAttribute("zpay", zpay);
				model.addAttribute("zpayHistory", zpayHistory);
				model.addAttribute("zpay_balance", zpay_balance);
				return "zpay/zpay_refund_success";				
			} else {
				model.addAttribute("msg", "ZPAY 환급 실패");
				return "fail_back";
			}
		}
		
	}

	// zpay_send_form.jsp 페이지로 디스페치
	@GetMapping("zpay_send_form")
	public String zpaySendForm(@RequestParam(defaultValue = "0") int order_secondhand_idx, 
							@RequestParam(defaultValue = "0") int order_auction_idx, 
							Model model, HttpSession session) {
		System.out.println("ZpayController - zpaySendForm()");
		
		if(order_secondhand_idx != 0) {
			OrderSecondhandVO order_secondhand = service.getOrderSecondhand(order_secondhand_idx);
			ZpayVO zpay = service.getZpay(order_secondhand.getOrder_secondhand_buyer());
			
			model.addAttribute("order_secondhand", order_secondhand);
			model.addAttribute("zpay", zpay);
			return "zpay/zpay_secondhand_send_form";			
		} else {
			OrderAuctionVO order_auction = service.getOrderAuction(order_auction_idx);
			ZpayVO zpay = service.getZpay(order_auction.getOrder_auction_buyer());
			
			model.addAttribute("order_auction", order_auction);
			model.addAttribute("zpay", zpay);
			return "zpay/zpay_auction_send_form";						
		}
		
	}
	
	// 중고거래 송금(구매자 출금)
	@PostMapping("zpay_send_pro")
	public String zpaySendPro(@RequestParam int order_secondhand_idx, 
							Model model) {
		System.out.println("ZpayController - zpaySendPro()");
		
		String seller_id = "";
		String buyer_id = "";
		long product_price = 0;
		int order_delivery_commission = 0;
		
		// order_secondhand_idx를 이용하여 중고거래 내역 조회 => ZPAY_HISTORY 내역 추가를 위한 정보 조회
		OrderSecondhandVO order_secondhand = service.getOrderSecondhand(order_secondhand_idx);
		seller_id = order_secondhand.getOrder_secondhand_seller();
		buyer_id = order_secondhand.getOrder_secondhand_buyer();
		product_price = order_secondhand.getOrder_secondhand_price();
		order_delivery_commission = order_secondhand.getOrder_delivery_commission();		
		
		// ----------------------- buyer의 ZPAY_HISTORY 추가 -----------------------------------------------------------------------
		// ZPAY 테이블에서 buyer_id에 일치하는 zpay_idx 조회
		int buyer_zpay_idx = service.getZpayIdx(buyer_id);
		ZpayVO buyer_zpay = service.getZpay(buyer_id);
		// ZPAY_HISTORY 테이블에서 seller_id의 잔액조회
		Integer buyer_zpay_balance = service.getZpayBalance(buyer_id);
		
		
		// ============================================ 송금 불가 ============================================================		
		// 잔액을 초과할 경우 송금 진행 불가
		if(buyer_zpay_balance < product_price + order_delivery_commission) {
			model.addAttribute("msg", "ZPAY 잔액을 초과하였습니다.\\n추가 충전이 필요합니다");
			model.addAttribute("targetURL", "zpay_charge_form");
			return "fail_location";
		}

		// 경매입찰 중일 경우 입찰한 금액 빼고 송금 가능 --------------------------------------------------------------------
		// 현재 참여하고 있는 경매 입찰이 있는 지 확인
		List<Map<String, Object>> isAuctionParticipant = service.isAuctionParticipant(buyer_id);
		// 현재 참여하고 있는 경매 입찰이 있을 경우 
		// (balance - 입찰한 금액의 합)과 (product_price + order_delivery_commission)를 비교하여 
		// (balance - 입찰한 금액의 합) < (product_price + order_delivery_commission) 일 경우 환급 불가
		if(isAuctionParticipant.size() > 0) {
			
			long auction_log_bid_sum = 0;
			for (Map<String, Object> participant : isAuctionParticipant) {
			    Integer maxBid = (Integer) participant.get("max_auction_log_bid");
			    auction_log_bid_sum += maxBid;
			}
			
			if(buyer_zpay_balance - auction_log_bid_sum < product_price + order_delivery_commission) {
				
				Locale koreanLocale = new Locale("ko", "KR");
		        NumberFormat koreanFormat = NumberFormat.getInstance(koreanLocale);
		        
		        String auctionLogBidSum = koreanFormat.format(auction_log_bid_sum);
		        String availableBalance 
		        	= koreanFormat.format(buyer_zpay_balance - auction_log_bid_sum < 0 ? 0 : buyer_zpay_balance - auction_log_bid_sum);
		        
				model.addAttribute("msg", "송금 가능한 금액을 초과하였습니다.\\n입찰금액 합 : " 
											+ auctionLogBidSum + "원\\n송금가능 금액 : "
											+ availableBalance + "원");
				return "fail_back";
			}
			
		}
		// =================================================================================================================
		
		// zpayBuyerHistory 객체에 저장
		ZpayHistoryVO zpayBuyerHistory = new ZpayHistoryVO();
		zpayBuyerHistory.setZpay_idx(buyer_zpay_idx);
		zpayBuyerHistory.setMember_id(buyer_id);
		zpayBuyerHistory.setZpay_amount(product_price + order_delivery_commission);
		zpayBuyerHistory.setZpay_balance(buyer_zpay_balance);
		zpayBuyerHistory.setZpay_deal_type("중고출금");	
		zpayBuyerHistory.setOrder_secondhand_idx(order_secondhand_idx);

		// ZPYA_HISTORY 테이블에 송금내역 추가
		int insertSendCount = service.insertSendReceiveHistory(zpayBuyerHistory);
//		int insertSendCount = service.sendZpay(zpayBuyerHistory);
		
		// 거래방법이 ZMAN / 택배 일 경우 송금(구매자에게서 출금)만 진행하고
		// 판매자에게 입금은 [거래완료]버튼 클릭 시 진행되도록 zpay/zpay_send_success.jsp로 이동
		if(insertSendCount > 0) {
			// 중고상품 결제 완료 시 "결제완료"로 변경
			int updateOrderSecondhandStatusCount = service.modifyOrderSecondhandStatus(order_secondhand_idx);
			
			if(updateOrderSecondhandStatusCount > 0) {					
				// -------------------------- ZERO 약정계좌 배달비 거래내역 추가 ---------------------------------------
				ZpayHistoryVO zpayHistoryInserted = new ZpayHistoryVO();
				zpayHistoryInserted = service.getzpayHistoryInserted();
				
				Integer zero_account_balance = service.getZeroAccountBalance();
				
				ZeroAccountHistoryVO zeroAccount = new ZeroAccountHistoryVO();
				zeroAccount.setMember_id(buyer_id);
				zeroAccount.setZpay_history_idx(zpayHistoryInserted.getZpay_history_idx());
				zeroAccount.setOrder_secondhand_idx(order_secondhand_idx);
				zeroAccount.setZero_account_amount(order_delivery_commission);
				zeroAccount.setZero_account_balance(zero_account_balance);
				zeroAccount.setZero_account_type("배달비");
				
				int insertZeroCount = service.depositWithdrawZeroAccount(zeroAccount);
//					int insertZeroCount = service.depositZeroAccount(zeroAccount);
				// --------------------------------------------------------------------------------------------------
				if(insertZeroCount > 0) {
					buyer_zpay_balance = service.getZpayBalance(buyer_id);
					
					model.addAttribute("buyer_zpay_balance", buyer_zpay_balance);
					model.addAttribute("seller_id", seller_id);
					model.addAttribute("buyer_zpay", buyer_zpay);
					model.addAttribute("zpayBuyerHistory", zpayBuyerHistory);
				}
				
				return "zpay/zpay_send_success";							
			} else {
				model.addAttribute("msg", "중고상품 결제완료 상태변경 실패");
				return "fail_back";
			}
		} else {
			model.addAttribute("msg", "ZPAY 송금 실패");
			return "fail_back";
		}
	}
	
	
	// 중고거래 - [거래완료] 버튼 클릭 시 판매자에게 송금
	@PostMapping("zpay_send_to_seller")
	public String zpaySendToSeller(@RequestParam int order_secondhand_idx, 
								Model model) {
		System.out.println("ZpayController - zpaySendToSeller");
		
		String seller_id = "";
		String buyer_id = "";
		long product_price = 0;
		int order_delivery_commission = 0;
		
		// order_secondhand_idx를 이용하여 중고거래 내역 조회 => ZPAY_HISTORY 내역 추가를 위한 정보 조회
		OrderSecondhandVO order_secondhand = service.getOrderSecondhand(order_secondhand_idx);
		seller_id = order_secondhand.getOrder_secondhand_seller();
		buyer_id = order_secondhand.getOrder_secondhand_buyer();
		product_price = order_secondhand.getOrder_secondhand_price();
		order_delivery_commission = order_secondhand.getOrder_delivery_commission();
		
		// ZPAY 테이블에서 seller_id에 일치하는 zpay_idx 조회
		int seller_zpay_idx = service.getZpayIdx(seller_id);
		// ZPAY_HISTORY 테이블에서 seller_id의 잔액조회
		Integer seller_zpay_balance = service.getZpayBalance(seller_id);
		
		// zpayBuyerHistory 객체에 저장
		ZpayHistoryVO zpaySellerHistory = new ZpayHistoryVO();
		zpaySellerHistory.setZpay_idx(seller_zpay_idx);
		zpaySellerHistory.setMember_id(seller_id);
		zpaySellerHistory.setZpay_amount(product_price);
		zpaySellerHistory.setZpay_balance(seller_zpay_balance);
		zpaySellerHistory.setZpay_deal_type("중고입금");
		zpaySellerHistory.setOrder_secondhand_idx(order_secondhand_idx);
				
		// ZPYA_HISTORY 테이블에 수취내역 추가
		int insertReceiveCount = service.insertSendReceiveHistory(zpaySellerHistory);
//				int insertReceiveCount = service.receiveZpay(zpaySellerHistory);
		
		// ==================================================================================
		
		if(insertReceiveCount >0) {			
			return "./";							
		} else {
			model.addAttribute("msg", "ZPAY 송금 실패");
			return "fail_back";
		}
		
	}
	
	
	// 경매 거래 송금(구매자 출금)
	@PostMapping("zpay_auction_send_pro")
	public String zpayAuctionSendPro(@RequestParam int order_auction_idx, 
							Model model) {
		System.out.println("ZpayController - zpayAuctionSendPro()");
		
		String seller_id = "";
		String buyer_id = "";
		long product_price = 0;
		long order_auction_commission = 0;
		
		OrderAuctionVO order_auction = service.getOrderAuction(order_auction_idx);
		seller_id = order_auction.getOrder_auction_seller();
		buyer_id = order_auction.getOrder_auction_buyer();
		product_price = order_auction.getOrder_auction_price();
		order_auction_commission = order_auction.getOrder_auction_commission();
		
		// ----------------------- buyer의 ZPAY_HISTORY 추가 --------------------------------
		// ZPAY 테이블에서 buyer_id에 일치하는 zpay_idx 조회
		int buyer_zpay_idx = service.getZpayIdx(buyer_id);
		ZpayVO buyer_zpay = service.getZpay(buyer_id);
		// ZPAY_HISTORY 테이블에서 seller_id의 잔액조회
		Integer buyer_zpay_balance = service.getZpayBalance(buyer_id);
		
		// 잔액을 초과할 경우 송금 진행 불가
		if(buyer_zpay_balance < product_price) {
			model.addAttribute("msg", "ZPAY 잔액을 초과하였습니다.\\n추가 충전이 필요합니다");
			model.addAttribute("targetURL", "zpay_charge_form");
			return "fail_location";
		}
		
		// 경매입찰 중일 경우 입찰한 금액 빼고 송금 가능
		
		// zpaySellerHistory 객체에 저장
		ZpayHistoryVO zpayBuyerHistory = new ZpayHistoryVO();
		zpayBuyerHistory.setZpay_idx(buyer_zpay_idx);
		zpayBuyerHistory.setMember_id(buyer_id);
		zpayBuyerHistory.setZpay_amount(product_price);
		zpayBuyerHistory.setZpay_balance(buyer_zpay_balance);
		zpayBuyerHistory.setZpay_deal_type("경매출금");
		zpayBuyerHistory.setOrder_auction_idx(order_auction_idx);
		
		// ZPYA_HISTORY 테이블에 송금내역 추가
		int insertSendCount = service.insertSendReceiveHistory(zpayBuyerHistory);
//		int insertSendCount = service.sendZpay(zpayBuyerHistory);
		
		// -------------------------- ZERO 약정계좌 배달비 거래내역 추가 ---------------------------------------
		ZpayHistoryVO zpayHistoryInserted = new ZpayHistoryVO();
		zpayHistoryInserted = service.getzpayHistoryInserted();
		
		Integer zero_account_balance = service.getZeroAccountBalance();
		
		ZeroAccountHistoryVO zeroAccount = new ZeroAccountHistoryVO();
		zeroAccount.setMember_id(buyer_id);
		zeroAccount.setZpay_history_idx(zpayHistoryInserted.getZpay_history_idx());
		zeroAccount.setOrder_secondhand_idx(order_auction_idx);
		zeroAccount.setZero_account_amount(order_auction_commission);
		zeroAccount.setZero_account_balance(zero_account_balance);
		zeroAccount.setZero_account_type("경매수수료");
		
		int insertZeroCount = service.depositWithdrawZeroAccount(zeroAccount);
//		int insertZeroCount = service.depositZeroAccount(zeroAccount);
		// --------------------------------------------------------------------------------------------------
				
		if(insertSendCount > 0) {
				
			model.addAttribute("buyer_zpay_balance", buyer_zpay_balance);
			model.addAttribute("seller_id", seller_id);
			model.addAttribute("buyer_zpay", buyer_zpay);
			model.addAttribute("zpayBuyerHistory", zpayBuyerHistory);
			
			return "zpay/zpay_send_success";
			
		} else {
			model.addAttribute("msg", "ZPAY 송금 실패");
			return "fail_back";
		}
		
	}
	
	
	// 경매 거래 수취(판매자 입금)
	@PostMapping("zpay_auction_send_to_seller")
	public String zpayAuctionSendToSeller(@RequestParam int order_auction_idx, 
			Model model) {
		System.out.println("ZpayController - zpayAuctionSendPro()");
		
		String seller_id = "";
		String buyer_id = "";
		long product_price = 0;
		long order_auction_commission = 0;
		
		OrderAuctionVO order_auction = service.getOrderAuction(order_auction_idx);
		seller_id = order_auction.getOrder_auction_seller();
		buyer_id = order_auction.getOrder_auction_buyer();
		product_price = order_auction.getOrder_auction_price();
		order_auction_commission = order_auction.getOrder_auction_commission();
		
		
		// ----------------------- seller의 ZPAY_HISTORY 추가 --------------------------------
		// ZPAY 테이블에서 seller_id에 일치하는 zpay_idx 조회
		int seller_zpay_idx = service.getZpayIdx(seller_id);
		// ZPAY_HISTORY 테이블에서 seller_id의 잔액조회
		Integer seller_zpay_balance = service.getZpayBalance(seller_id);
		
		// zpayBuyerHistory 객체에 저장
		ZpayHistoryVO zpaySellerHistory = new ZpayHistoryVO();
		zpaySellerHistory.setZpay_idx(seller_zpay_idx);
		zpaySellerHistory.setMember_id(seller_id);
		zpaySellerHistory.setZpay_amount(product_price - order_auction_commission);
		zpaySellerHistory.setZpay_balance(seller_zpay_balance);
		zpaySellerHistory.setZpay_deal_type("경매입금");
		zpaySellerHistory.setOrder_auction_idx(order_auction_idx);
		
		// ZPYA_HISTORY 테이블에 수취내역 추가
		int insertReceiveCount = service.insertSendReceiveHistory(zpaySellerHistory);
//		int insertReceiveCount = service.receiveZpay(zpaySellerHistory);
		// ==================================================================================
		
		if(insertReceiveCount >0) {
			return "./";
			
		} else {
			model.addAttribute("msg", "ZPAY 송금 실패");
			return "fail_back";
		}
		
	}
	
	// zman_refund_form.jsp 페이지로 디스페치
	@GetMapping("zman_refund_form")
	public String zmanRefundForm(@RequestParam int  zman_earning_idx, 
							Model model, HttpSession session) {
		System.out.println("ZpayController - zmanRefundForm()");
		
		// 정산받을 계좌 정보 조회
		ZpayVO zpay = service.getZpay((String)session.getAttribute("member_id"));
		
		// ZmanEarning 조회
		ZmanEarningVO zmanEarning = service.getZmanEarning(zman_earning_idx);
		
		model.addAttribute("zpay", zpay);
		model.addAttribute("zmanEarning", zmanEarning);
		return "zpay/zpay_refund_form";
	}
	
	// ZMAN 정산
	@PostMapping("zman_refund_pro")
	public String zmanRefundPro(ZmanRefundHistoryVO zmanRefundHistory,
			@RequestParam int  zman_earning_idx, 
			@RequestParam String member_id, 
			@RequestParam int zman_net_profit, 
			Map<String, String> map,
			Model model) {
		System.out.println("ZpayController - zmanRefundPro()");
		
		// 입금이체 요청을 위한 계좌정보(ZPAY테이블 - fintech_use_num, access_token) 조회 => Map 객체에 저장
		ZpayVO zpay = service.getZpay(member_id);
		map.put("access_token", zpay.getAccess_token());
		map.put("fintech_use_num", zpay.getFintech_use_num());
		// 금결원 테스트데이터 등록 후
		String zmanNetProfit = String.valueOf(zman_net_profit);
		map.put("zpayAmount", zmanNetProfit);
		
		// BankApiService - requestDeposit() 메서드를 호출하여 입금이체 요청
		// => 파라미터 : Map 객체   리턴타입 : requestDeposit
		ResponseDepositVO depositResult = bankApiService.requestDeposit(map);
		
		// Model 객체에 ResponseDepositVO 객체 저장
		model.addAttribute("depositResult", depositResult);
		
		// --------------------------------------------------------------------------------------------------------------------------
		zmanRefundHistory.setZman_id(member_id);
		zmanRefundHistory.setZman_earning_idx(zman_earning_idx);
		zmanRefundHistory.setZman_net_profit(depositResult.getRes_list() == null? 0 : depositResult.getRes_list().get(0).getTran_amt());
//		zmanRefundHistory.setZman_balance(zpay_balance);	// 기존 잔액 =>ZpayMapper.xml에서 zpay_amount를 더할 예정
		System.out.println(zmanRefundHistory);
		
		// ZPYA_HISTORY 테이블에 환급내역 추가
		int insertCount = service.zmanRefund(zmanRefundHistory);
		
		if(insertCount > 0) {
			// ----------------- ZERO 약정계좌 ZMAN 정산 내역 추가 ----------------------------------------------
			Integer zero_account_balance = service.getZeroAccountBalance();
			
			ZeroAccountHistoryVO zeroAccount = new ZeroAccountHistoryVO();
			zeroAccount.setMember_id(member_id);
			zeroAccount.setZero_account_amount(zman_net_profit);
			zeroAccount.setZero_account_balance(zero_account_balance);
			zeroAccount.setZero_account_type("Z맨정산");
			
			int insertZeroCount = service.zeroAccountZmanHistory(zeroAccount);
			// --------------------------------------------------------------------------------------------------
			
			model.addAttribute("zpay", zpay);
			model.addAttribute("zmanRefundHistory", zmanRefundHistory);
			return "zpay/zpay_refund_success";				
		} else {
			model.addAttribute("msg", "ZMAN 정산 실패");
			return "fail_back";
		}
		
	}
	
	
	// 경매 취소 수수료 10% + 환불 90%
	@PostMapping("zpay_auction_cancel")
	public String zpayAuctionCancel(@RequestParam int order_auction_idx, Model model) {
		// ORDER_AUCTION 테이블에서 경매 주문 정보 조회
		System.out.println("ZpayController - zpayAuctionCancel()");
		
		String seller_id = "";
		String buyer_id = "";
		long product_price = 0;
		long order_auction_commission = 0;
		
		OrderAuctionVO order_auction = service.getOrderAuction(order_auction_idx);
		seller_id = order_auction.getOrder_auction_seller();
		buyer_id = order_auction.getOrder_auction_buyer();
		product_price = order_auction.getOrder_auction_price();
		order_auction_commission = order_auction.getOrder_auction_commission();
		
		// 취소자(낙찰자) ZPAY로 입금해주기
		// ----------------------- buyer의 ZPAY_HISTORY 추가 --------------------------------
		// ZPAY 테이블에서 buyer_id에 일치하는 zpay_idx 조회
		int buyer_zpay_idx = service.getZpayIdx(buyer_id);
		ZpayVO buyer_zpay = service.getZpay(buyer_id);
		// ZPAY_HISTORY 테이블에서 buyer_id의 잔액조회
		Integer buyer_zpay_balance = service.getZpayBalance(buyer_id);
				
		// zpaySellerHistory 객체에 저장
		ZpayHistoryVO zpayBuyerHistory = new ZpayHistoryVO();
		zpayBuyerHistory.setZpay_idx(buyer_zpay_idx);
		zpayBuyerHistory.setMember_id(buyer_id);
		zpayBuyerHistory.setZpay_amount(product_price);
		zpayBuyerHistory.setZpay_balance(buyer_zpay_balance);
		zpayBuyerHistory.setZpay_deal_type("경매취소환불");
		zpayBuyerHistory.setOrder_auction_idx(order_auction_idx);
		
		// ZPYA_HISTORY 테이블에 경매취소환불 내역 추가
		int insertSendCount = service.insertSendReceiveHistory(zpayBuyerHistory);
//				int insertSendCount = service.sendZpay(zpayBuyerHistory);
		
		// -------------------------- ZERO 약정계좌 경매취소환불 내역 추가 ---------------------------------------
		ZpayHistoryVO zpayHistoryInserted = new ZpayHistoryVO();
		zpayHistoryInserted = service.getzpayHistoryInserted();
		
		Integer zero_account_balance = service.getZeroAccountBalance();
		
		ZeroAccountHistoryVO zeroAccount = new ZeroAccountHistoryVO();
		zeroAccount.setMember_id(buyer_id);
		zeroAccount.setZpay_history_idx(zpayHistoryInserted.getZpay_history_idx());
		zeroAccount.setOrder_auction_idx(order_auction_idx);
		zeroAccount.setZero_account_amount(order_auction_commission);
		zeroAccount.setZero_account_balance(zero_account_balance);
		zeroAccount.setZero_account_type("경매취소환불");
		
		int insertZeroCount = service.depositWithdrawZeroAccount(zeroAccount);
//				int insertZeroCount = service.depositZeroAccount(zeroAccount);
		// --------------------------------------------------------------------------------------------------
				
		if(insertSendCount > 0) {
			return "./";
			
		} else {
			model.addAttribute("msg", "ZPAY 송금 실패");
			return "fail_back";
		}
	}
	
}

