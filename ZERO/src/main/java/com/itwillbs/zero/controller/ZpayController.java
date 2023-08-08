package com.itwillbs.zero.controller;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.itwillbs.zero.vo.ZmanAccountVO;
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
//			@RequestParam(defaultValue = "") String searchType, 
//			@RequestParam(defaultValue = "") String startDate, 
//			@RequestParam(defaultValue = "") String endDate, 
//			@RequestParam(defaultValue = "1") int pageNum, 
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
			model.addAttribute("member", member);	
			return "zpay/zpay_regist_form";
		}
		
//		// 일반회원 - ZPAY 미사용자의 경우 ZPAY 등록폼으로 이동
//		if(member.getMember_type().equals("회원") && zpay == null) {
//			model.addAttribute("member", member);	
//			return "zpay/zpay_regist_form";
//		}
//		
//		// ZMAN - 1) ZPAY 미사용자 & 계좌등록X	=> 계좌 등록
//		//        2) ZPAY 사용자 => ZPAY 등록 계좌 자동 등록
//		if(member.getMember_type().equals("Z맨") && zpay == null) {
//			model.addAttribute("member", member);	
//			return "zpay/zman_account_regist_form";
//		}
		
		// ------------------------------------------------------------------------------------------
//		int listLimit = 5; //한페이지 표시 목록갯수
//		int startRow = (pageNum - 1) * listLimit; //조회시작 행번호
//		
//		//페이징 계산작업
//		//1.전체게시물 수 조회 작업 요청
//		int listCount = service.getZpayHistoryListCount(member_id, searchType, startDate, endDate);
//		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //3. 전체 페이지 목록갯수
//		
//		// -----------------------------------------------------------------------------------------
//		
//		// ZPAY 사용자일 경우 ZPAY 이용 내역 정보 조회 후 zpay_main 페이지로 이동
//		List<ZpayHistoryVO> zpayHistoryList = service.getZpayHistory(member_id);
//		System.out.println(zpayHistoryList);
//		System.out.println(member_id);
//		
//		Integer zpay_balance = service.getZpayBalance(member_id);
//		System.out.println(zpay_balance);
//		
//		model.addAttribute("zpayHistoryList", zpayHistoryList);
//		model.addAttribute("zpay_balance", zpay_balance);
//		model.addAttribute("listCount", listCount);
		
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
	
	// ZPAY 등록
	@PostMapping("zpay_regist")
	public String zpayRegist(@RequestParam Map<String, String> map, 
							Model model, 
							HttpSession session) {
		
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
		
		// 핀테크 이용자 정보를 ZPAY 테이블에 추가 => 이용자의 ZPAY 등록
		ZpayVO zpay = new ZpayVO();
		zpay.setMember_id(member_id);
		zpay.setZpay_bank_name(map.get("bank_name"));
		zpay.setZpay_bank_account(map.get("account_num_masked"));
		zpay.setAccess_token(access_token);
		zpay.setFintech_use_num(map.get("fintech_use_num"));
		
		int insertCount = service.registZpay(zpay);
		
		if(insertCount > 0) {
			return "redirect:/zpay_main";			
		} else {
			model.addAttribute("msg", "ZPAY 등록 실패");
			return "bank_auth_fail_back";
		}
		
		
	}

//	// ZMAN 계좌 등록
//	@PostMapping("zman_account_regist")
//	public String zmanAccountRegist(@RequestParam Map<String, String> map, 
//			Model model, 
//			HttpSession session) {
//		
//		String member_id = (String)session.getAttribute("member_id");
//		
//		// 세션에 저장된 엑세스토큰 및 사용자번호를 변수에 저장
//		// => 핀테크 이용자 정보 조회
//		// => 예금주명, 계좌번호(마스킹), 핀테크이용번호 조회하여 ZPAY테이블에 정보 추가(ZPAY 등록)
//		String access_token = (String)session.getAttribute("access_token");
//		
//		// 엑세스토큰이 없을 경우 "계좌인증필수" 출력 후 이전페이지로 돌아가기
//		if(session.getAttribute("member_id") == null || session.getAttribute("access_token") == null) {
//			model.addAttribute("msg", "권한이 없습니다!");
//			return "bank_auth_fail_back";
//		}
//		
//		// 핀테크 이용자 정보를 ZMAN_ACCOUNT 테이블에 추가
//		ZmanAccountVO zmanAccount = new ZmanAccountVO();
//		zmanAccount.setZman_id(member_id);
//		zmanAccount.setZman_bank_name(map.get("bank_name"));
//		zmanAccount.setZman_bank_account(map.get("account_num_masked"));
//		zmanAccount.setAccess_token(access_token);
//		zmanAccount.setFintech_use_num(map.get("fintech_use_num"));
//		
//		int insertCount = service.registZmanBankAccount(zmanAccount);
//		
//		if(insertCount > 0) {
//			return "redirect:/zpay_main";			
//		} else {
//			model.addAttribute("msg", "ZPAY 등록 실패");
//			return "bank_auth_fail_back";
//		}
//		
//		
//	}
	
	// zpay_charge_form.jsp 페이지로 디스페치
	@GetMapping("zpay_charge_form")
	public String zpayChargeForm(Model model, HttpSession session) {
		System.out.println("ZpayController - zpayChargeForm()");
		
		ZpayVO zpay = service.getZpay((String)session.getAttribute("member_id"));
		model.addAttribute("zpay", zpay);
				
		return "zpay/zpay_charge_form";
	}
	
	// ZPAY 충전 비즈니스 로직 요청
	@PostMapping("zpay_charge_pro")
	public String zpayChargePro(ZpayHistoryVO zpayHistory, 
								@RequestParam String member_id, 
								@RequestParam String zpayAmount, 
								Map<String, String> map,
								Model model) {
		System.out.println("ZpayController - zpayChargePro()");
		System.out.println(zpayAmount);
		
		// 출금이체 요청을 위한 계좌정보(ZPAY테이블 - fintech_use_num, access_token) 조회 => Map 객체에 저장
		ZpayVO zpay = service.getZpay(member_id);
		map.put("access_token", zpay.getAccess_token());
		map.put("fintech_use_num", zpay.getFintech_use_num());
		// 금결원 테스트데이터 등록 후
		map.put("zpayAmount", zpayAmount);
		
		// BankApiService - requestWithdraw() 메서드를 호출하여 출금이체 요청
		// => 파라미터 : Map 객체   리턴타입 : ResponseWithdrawVO
		ResponseWithdrawVO withdrawResult = bankApiService.requestWithdraw(map);
		
		// Model 객체에 ResponseWithdrawVO 객체 저장
		model.addAttribute("withdrawResult", withdrawResult);
		
		// ---------------------------------------------------------------------------------------------------------------
		// ZPAY_HISTORY 테이블에서 잔액조회
		Integer zpay_balance = service.getZpayBalance(member_id);
		
		zpayHistory.setZpay_idx(zpay.getZpay_idx());
//		zpayHistory.setZpay_amount(Integer.parseInt(zpayAmount));
		zpayHistory.setZpay_amount(withdrawResult.getTran_amt());
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
//			int insertZeroCount = service.depositZeroAccount(zeroAccount);
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
	
	// zpay_refund_form.jsp 페이지로 디스페치
	@GetMapping("zpay_refund_form")
	public String zpayRefundForm(Model model, HttpSession session) {
		System.out.println("ZpayController - zpayRefundForm()");
		
		// 환급받을 계좌 정보와 환급가능한 금액(zpay 잔액) 조회
		ZpayVO zpay = service.getZpay((String)session.getAttribute("member_id"));
		Integer zpay_balance = service.getZpayBalance((String)session.getAttribute("member_id"));
				
		model.addAttribute("zpay", zpay);
		model.addAttribute("zpay_balance", zpay_balance);
		return "zpay/zpay_refund_form";
	}
	
	
	// ZPAY 환급 비즈니스 로직 요청
	@PostMapping("zpay_refund_pro")
	public String zpayRefundPro(ZpayHistoryVO zpayHistory, 
			@RequestParam String member_id, 
			@RequestParam String zpayAmount, 
			@RequestParam int zpay_balance, 
			Map<String, String> map,
			Model model) {
		System.out.println("ZpayController - zpayRefundPro()");
		
		
		// ============================================ 환급 불가 ===================================================================
		// 잔액을 초과할 경우 환급 진행 불가 
		if(zpay_balance < Integer.parseInt(zpayAmount)) {
			model.addAttribute("msg", "ZPAY 잔액을 초과하였습니다.\\n금액을 다시 입력해주세요.");
			return "fail_back";
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

		// =========================================================================================================================
		// 입금이체 요청을 위한 계좌정보(ZPAY테이블 - fintech_use_num, access_token) 조회 => Map 객체에 저장
		ZpayVO zpay = service.getZpay(member_id);
		map.put("access_token", zpay.getAccess_token());
		map.put("fintech_use_num", zpay.getFintech_use_num());
		// 금결원 테스트데이터 등록 후
		map.put("zpayAmount", zpayAmount);
		
		// BankApiService - requestWithdraw() 메서드를 호출하여 출금이체 요청
		// => 파라미터 : Map 객체   리턴타입 : ResponseWithdrawVO
		ResponseDepositVO depositResult = bankApiService.requestDeposit(map);
		
		// Model 객체에 ResponseWithdrawVO 객체 저장
		model.addAttribute("depositResult", depositResult);
		
		// --------------------------------------------------------------------------------------------------------------------------
		// ZPAY_HISTORY 테이블에서 잔액조회
//		Integer zpay_balance = service.getZpayBalance(member_id);
		
		zpayHistory.setZpay_idx(zpay.getZpay_idx());
//		zpayHistory.setZpay_amount(Integer.parseInt(zpayAmount));
		zpayHistory.setZpay_amount(depositResult.getRes_list() == null? 0 : depositResult.getRes_list().get(0).getTran_amt());
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

	// zpay_send_form.jsp 페이지로 디스페치
	@GetMapping("zpay_send_form")
	public String zpaySendForm(@RequestParam(defaultValue = "0") int order_secondhand_idx, 
							@RequestParam(defaultValue = "0") int order_auction_idx, 
							Model model) {
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
	
	// 중고거래 송금/수취
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
		if(order_secondhand.getOrder_secondhand_type().equals("Z맨") || order_secondhand.getOrder_secondhand_type().equals("택배")) {
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
					model.addAttribute("msg", "중고상품 구매완료 상태변경 실패");
					return "fail_back";
				}
			} else {
				model.addAttribute("msg", "ZPAY 송금 실패");
				return "fail_back";
			}
		}			
		
		// ----------------------- seller의 ZPAY_HISTORY 추가 -----------------------------------------------------------------------
		// 거래방법이 ZMAN / 택배 가 아닐 경우(직거래 경우) buyer 와 seller 에 동시에 ZPAY_HISTORY 추가
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
//		int insertReceiveCount = service.receiveZpay(zpaySellerHistory);
		
		// ==================================================================================
		
		if(insertSendCount > 0 && insertReceiveCount >0) {
			// 중고상품 결제 완료 시 "결제완료"로 변경
			int updateOrderSecondhandStatusCount = service.modifyOrderSecondhandStatus(order_secondhand_idx);
			
			if(updateOrderSecondhandStatusCount > 0) {
				buyer_zpay_balance = service.getZpayBalance(buyer_id);
				
				model.addAttribute("buyer_zpay_balance", buyer_zpay_balance);
				model.addAttribute("seller_id", seller_id);
				model.addAttribute("buyer_zpay", buyer_zpay);
				model.addAttribute("zpayBuyerHistory", zpayBuyerHistory);
				
				return "zpay/zpay_send_success";							
			} else {
				model.addAttribute("msg", "중고상품 구매완료 상태변경 실패");
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
		
//		return "zpay/order_secondhand_compelete";
//		return "zpay/secondhand_delivery_success";
	}
	
	
	// 경매 거래 송금/수취
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
		
		if(insertSendCount > 0 && insertReceiveCount >0) {
				
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
	
	// zpay_refund_form.jsp 페이지로 디스페치
	@GetMapping("zman_refund_form")
	public String zmanRefundForm(Model model, HttpSession session) {
		System.out.println("ZpayController - zmanRefundForm()");
		
		// 환급받을 계좌 정보와 환급가능한 금액(zpay 잔액) 조회
		ZpayVO zpay = service.getZpay((String)session.getAttribute("member_id"));
//		Integer zpay_balance = service.getZpayBalance((String)session.getAttribute("member_id"));
		// => 정산 받을 balance
				
		model.addAttribute("zpay", zpay);
//		model.addAttribute("zpay_balance", zpay_balance);
		return "zpay/zpay_refund_form";
	}
	
	// ZMAN 정산
	@PostMapping("zman_refund_pro")
	public String zmanRefundPro(ZpayHistoryVO zpayHistory, 
			@RequestParam String member_id, 
			@RequestParam String zpayAmount, 
			@RequestParam int zpay_balance, 
			Map<String, String> map,
			Model model) {
		System.out.println("ZpayController - zmanRefundPro()");
		
		// 입금이체 요청을 위한 계좌정보(ZPAY테이블 - fintech_use_num, access_token) 조회 => Map 객체에 저장
		ZpayVO zpay = service.getZpay(member_id);
		map.put("access_token", zpay.getAccess_token());
		map.put("fintech_use_num", zpay.getFintech_use_num());
		// 금결원 테스트데이터 등록 후
		map.put("zpayAmount", zpayAmount);
		
		// BankApiService - requestDeposit() 메서드를 호출하여 입금이체 요청
		// => 파라미터 : Map 객체   리턴타입 : requestDeposit
		ResponseDepositVO depositResult = bankApiService.requestDeposit(map);
		
		// Model 객체에 ResponseDepositVO 객체 저장
		model.addAttribute("depositResult", depositResult);
		
		// --------------------------------------------------------------------------------------------------------------------------
		// ZPAY_HISTORY 테이블에서 잔액조회
//		Integer zpay_balance = service.getZpayBalance(member_id);
		
		zpayHistory.setZpay_idx(zpay.getZpay_idx());
//		zpayHistory.setZpay_amount(Integer.parseInt(zpayAmount));
		zpayHistory.setZpay_amount(depositResult.getRes_list() == null? 0 : depositResult.getRes_list().get(0).getTran_amt());
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

	
//	// 송금 및 수취
//	@PostMapping("zpay_send_pro")
//	public String zpaySendPro(@RequestParam(required = false) int order_secondhand_idx, 
//			@RequestParam(required = false) int order_auction_idx, 
//			Model model) {
//		System.out.println("ZpayController - zpaySendPro()");
//		
//		String seller_id = "";
//		String buyer_id = "";
//		long product_price = 0;
//		int order_delivery_commission = 0;
//		
//		if(order_secondhand_idx != 0) {	// 중고주문의 경우
//			OrderSecondhandVO order_secondhand = service.getOrderSecondhand(order_secondhand_idx);
//			seller_id = order_secondhand.getOrder_secondhand_seller();
//			buyer_id = order_secondhand.getOrder_secondhand_buyer();
//			product_price = order_secondhand.getOrder_secondhand_price();
//			order_delivery_commission = order_secondhand.getOrder_delivery_commission();
//			
//			// order_delivery_commission이 존재할 경우(0이 아닐 경우)
////			if(order_secondhand.getOrder_delivery_commission() != 0) {
////				zpay_amount = order_secondhand.getOrder_secondhand_price() + order_secondhand.getOrder_delivery_commission();
////			}
//			
//		} else if(order_auction_idx != 0) {	// 경매주문의 경우
//			OrderAuctionVO order_auction = service.getOrderAuction(order_auction_idx);
//			seller_id = order_auction.getOrder_auction_seller();
//			buyer_id = order_auction.getOrder_auction_buyer();
//			product_price = order_auction.getOrder_auction_price();
//		}		
//		
//		
//		// ----------------------- buyer의 ZPAY_HISTORY 추가 --------------------------------
//		// ZPAY 테이블에서 buyer_id에 일치하는 zpay_idx 조회
//		int buyer_zpay_idx = service.getZpayIdx(buyer_id);
//		ZpayVO buyer_zpay = service.getZpay(buyer_id);
//		// ZPAY_HISTORY 테이블에서 seller_id의 잔액조회
//		Integer buyer_zpay_balance = service.getZpayBalance(buyer_id);
//		
//		// 잔액을 초과할 경우 송금 진행 불가
//		if(buyer_zpay_balance < product_price) {
//			model.addAttribute("msg", "ZPAY 잔액을 초과하였습니다.\\n추가 충전이 필요합니다");
//			model.addAttribute("targetURL", "zpay_charge_form");
//			return "fail_location";
//		}
//		
//		// 경매입찰 중일 경우 입찰한 금액 빼고 환급 가능
//		
//		// zpaySellerHistory 객체에 저장
//		ZpayHistoryVO zpayBuyerHistory = new ZpayHistoryVO();
//		zpayBuyerHistory.setZpay_idx(buyer_zpay_idx);
//		zpayBuyerHistory.setMember_id(buyer_id);
//		zpayBuyerHistory.setZpay_amount(product_price + order_delivery_commission);
//		zpayBuyerHistory.setZpay_balance(buyer_zpay_balance);
//		if(order_secondhand_idx != 0) {
//			zpayBuyerHistory.setZpay_deal_type("중고출금");	
//			zpayBuyerHistory.setOrder_secondhand_idx(order_secondhand_idx);
//		} else if(order_auction_idx != 0) {
//			zpayBuyerHistory.setZpay_deal_type("경매출금");
//			zpayBuyerHistory.setOrder_auction_idx(order_auction_idx);
//		}
//		
//		// ZPYA_HISTORY 테이블에 송금내역 추가
//		int insertSendCount = service.insertSendReceiveHistory(zpayBuyerHistory);
////		int insertSendCount = service.sendZpay(zpayBuyerHistory);
//		
//		
//		// ----------------------- seller의 ZPAY_HISTORY 추가 --------------------------------
//		// ZPAY 테이블에서 seller_id에 일치하는 zpay_idx 조회
//		int seller_zpay_idx = service.getZpayIdx(seller_id);
//		// ZPAY_HISTORY 테이블에서 seller_id의 잔액조회
//		Integer seller_zpay_balance = service.getZpayBalance(seller_id);
//		
//		// zpayBuyerHistory 객체에 저장
//		ZpayHistoryVO zpaySellerHistory = new ZpayHistoryVO();
//		zpaySellerHistory.setZpay_idx(seller_zpay_idx);
//		zpaySellerHistory.setMember_id(seller_id);
//		zpaySellerHistory.setZpay_amount(product_price);
//		zpaySellerHistory.setZpay_balance(seller_zpay_balance);
//		if(order_secondhand_idx != 0) {
//			zpaySellerHistory.setZpay_deal_type("중고입금");
//			zpaySellerHistory.setOrder_secondhand_idx(order_secondhand_idx);
//		} else if(order_auction_idx != 0) {
//			zpaySellerHistory.setZpay_deal_type("경매입금");
//			zpaySellerHistory.setOrder_auction_idx(order_auction_idx);
//		}
//		
//		// ZPYA_HISTORY 테이블에 수취내역 추가
//		int insertReceiveCount = service.insertSendReceiveHistory(zpaySellerHistory);
////		int insertReceiveCount = service.receiveZpay(zpaySellerHistory);
//		
//		// ==================================================================================
//		
//		if(insertSendCount > 0 && insertReceiveCount >0) {
//			// 중고상품 결제 완료 시 "결제완료"로 변경
//			int updateOrderSecondhandStatusCount = service.modifyOrderSecondhandStatus(order_secondhand_idx);
//			
//			if(updateOrderSecondhandStatusCount > 0) {	// => 이렇게 하면 경매는...?
//				buyer_zpay_balance = service.getZpayBalance(buyer_id);
//				
//				model.addAttribute("buyer_zpay_balance", buyer_zpay_balance);
//				model.addAttribute("seller_id", seller_id);
//				model.addAttribute("buyer_zpay", buyer_zpay);
//				model.addAttribute("zpayBuyerHistory", zpayBuyerHistory);
//				
//				return "zpay/zpay_send_success";							
//			} else {
//				model.addAttribute("msg", "중고상품 구매완료 상태변경 실패");
//				return "fail_back";
//			}
//		} else {
//			model.addAttribute("msg", "ZPAY 송금 실패");
//			return "fail_back";
//		}
//		
//	}
}

