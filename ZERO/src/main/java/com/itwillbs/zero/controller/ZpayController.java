package com.itwillbs.zero.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.zero.vo.BankAccountDetailVO;
import com.itwillbs.zero.vo.MemberVO;
import com.itwillbs.zero.vo.ResponseTokenVO;
import com.itwillbs.zero.vo.ResponseUserInfoVO;
import com.itwillbs.zero.vo.ZpayHistoryVO;
import com.itwillbs.zero.vo.ZpayVO;
import com.itwillbs.zero.vo.OrderSecondhandVO;
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
	@GetMapping("zpay_main")
	public String zpayMain(Map<String, String> map, Model model, HttpSession session) {
		System.out.println("ZpayController - zpayMain()");
		
		String member_id = (String)session.getAttribute("member_id");
		MemberVO member = memberService.getMember(member_id);
		
		// 토큰 정보 조회 => 세션에 저장
		ResponseTokenVO token = bankService.getTokenForBankAuth(member_id);	
		if(token != null) {
			session.setAttribute("access_token", token.getAccess_token());
			session.setAttribute("user_seq_no", token.getUser_seq_no());
		}		

		// ZPAY 사용자 여부 조회
		ZpayVO zpay = service.isZpayUser(member_id);
		if(zpay == null) {
			model.addAttribute("member", member);	
			return "zpay/zpay_regist_form";
		}
		
		// ZPAY 사용자일 경우 ZPAY 이용 내역 정보 조회 후 zpay_main 페이지로 이동
		List<ZpayHistoryVO> zpayHistoryList = service.getZpayHistory(member_id);
		System.out.println(zpayHistoryList);
		System.out.println(member_id);
		
		// ZPAY 잔액 조회
		Integer zpay_balance = service.getZpayBalance(member_id);
		System.out.println(zpay_balance);
		
		model.addAttribute("zpayHistoryList", zpayHistoryList);
		model.addAttribute("zpay_balance", zpay_balance);
		
		return "zpay/zpay_main";
	}
	
//	@GetMapping("zpay_regist")
//	public String zpayRegist(Map<String, String> map, Model model, HttpSession session) {
//		String member_id = (String)session.getAttribute("member_id");
//		MemberVO member = memberService.getMember(member_id);
//		
//		// 세션에 저장된 엑세스토큰 및 사용자번호를 변수에 저장 => 핀테크 이용자 정보 조회
//		String access_token = (String)session.getAttribute("access_token");
//		String user_seq_no = (String)session.getAttribute("user_seq_no");
//		ResponseUserInfoVO userInfo = bankApiService.requestUserInfo(access_token, user_seq_no);
//		
//		map.put("access_token", (String)session.getAttribute("access_token"));
//		map.put("user_name", userInfo.getUser_name());
//		
//		// BankApiService - requestAccountDetail() 메서드 호출하여 계좌 상세정보 조회 요청
//		// => 파라미터 : Map 객체   리턴타입 : BankAccountDetailVO(accountDetail)
//		BankAccountDetailVO accountDetail = bankApiService.requestAccountDetail(map);
//		
//		// 핀테크 이용자 정보를 ZPAY 테이블에 추가 => 이용자의 ZPAY 등록
//		ZpayVO zpay = new ZpayVO();
//		zpay.setMember_id(member_id);
//		zpay.setZpay_bank_name(accountDetail.getBank_name());
//		zpay.setZpay_bank_account(map.get("account_num_masked"));
//		
//		int insertCount = service.registZpay(zpay);
//		
//		if(insertCount > 0) {
////			model.addAttribute("accountDetail", accountDetail);
//			return "zpay/zpay_main";			
//		} else {
//			model.addAttribute("msg", "ZPAY 등록 실패");
//			return "bank_auth_fail_back";
//		}
		
//	}
	
	@PostMapping("zpay_regist")
	public String zpayRegist(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		MemberVO member = memberService.getMember(member_id);
		
//		// 세션에 저장된 엑세스토큰 및 사용자번호를 변수에 저장 => 핀테크 이용자 정보 조회
//		String access_token = (String)session.getAttribute("access_token");
//		String user_seq_no = (String)session.getAttribute("user_seq_no");
//		ResponseUserInfoVO userInfo = bankApiService.requestUserInfo(access_token, user_seq_no);
//		
		
		map.put("access_token", (String)session.getAttribute("access_token"));
		
		// BankApiService - requestAccountDetail() 메서드 호출하여 계좌 상세정보 조회 요청
		// => 파라미터 : Map 객체   리턴타입 : BankAccountDetailVO(accountDetail)
		BankAccountDetailVO accountDetail = bankApiService.requestAccountDetail(map);
		
		// 핀테크 이용자 정보를 ZPAY 테이블에 추가 => 이용자의 ZPAY 등록
		ZpayVO zpay = new ZpayVO();
		zpay.setMember_id(member_id);
		zpay.setZpay_bank_name(accountDetail.getBank_name());
		zpay.setZpay_bank_account(map.get("account_num_masked"));
		
		int insertCount = service.registZpay(zpay);
		
		if(insertCount > 0) {
//			model.addAttribute("accountDetail", accountDetail);
			return "zpay/zpay_main";			
		} else {
			model.addAttribute("msg", "ZPAY 등록 실패");
			return "bank_auth_fail_back";
		}
		
		
	}
	
	
	// zpay_charge_form.jsp 페이지로 디스페치
	@GetMapping("zpay_charge_form")
	public String zpayChargeForm() {
		System.out.println("ZpayController - zpayChargeForm()");
		
		return "zpay/zpay_charge_form2";
	}
	
	// ZPAY 충전
	@PostMapping("zpay_charge_pro")
	public String zpayChargePro(ZpayHistoryVO zpayHistory, 
								@RequestParam String member_id, 
								@RequestParam String zpayAmount, 
								Model model) {
		System.out.println("ZpayController - zpayChargePro()");
		
		zpayHistory.setZpay_amount(Integer.parseInt(zpayAmount));
		
		// ZPAY 테이블에서 member_id에 일치하는 zpay_idx 조회
		int zpay_idx = service.getZpayIdx(member_id);
		System.out.println(zpay_idx);
		
		// ZPAY_HISTORY 테이블에서 잔액조회
		Integer zpay_balance = service.getZpayBalance(member_id);
		
		zpayHistory.setZpay_idx(zpay_idx);
		zpayHistory.setZpay_amount(Integer.parseInt(zpayAmount));
		zpayHistory.setZpay_balance(zpay_balance);
		
		// ZPYA_HISTORY 테이블에 충전내역 추가
		int insertCount = service.chargeZpay(zpayHistory);
		
		if(insertCount > 0) {
			return "zpay/zpay_charge_success";			
		} else {
			model.addAttribute("msg", "ZPAY 충전 실패");
			return "fail_back";
		}
		
	}

	// zpay_charge_form.jsp 페이지로 디스페치
	@GetMapping("zpay_refund_form")
	public String zpayRefundForm() {
		System.out.println("ZpayController - zpayRefundForm()");
				
		return "zpay/zpay_refund_form";
	}
	
	@PostMapping("zpay_refund_pro")
	public String zpayRefundPro(ZpayHistoryVO zpayHistory, 
			@RequestParam String member_id, 
			@RequestParam String zpayAmount, 
			Model model) {
		System.out.println("ZpayController - zpayChargePro()");
		
		zpayHistory.setZpay_amount(Integer.parseInt(zpayAmount));
		
		// ZPAY 테이블에서 member_id에 일치하는 zpay_idx 조회
		int zpay_idx = service.getZpayIdx(member_id);
		System.out.println(zpay_idx);
		
		// ZPAY_HISTORY 테이블에서 잔액조회
		Integer zpay_balance = service.getZpayBalance(member_id);
		
		zpayHistory.setZpay_idx(zpay_idx);
		zpayHistory.setZpay_amount(Integer.parseInt(zpayAmount));
		zpayHistory.setZpay_balance(zpay_balance);
		
		// ZPYA_HISTORY 테이블에 충전내역 추가
		int insertCount = service.refundZpay(zpayHistory);
		
		if(insertCount > 0) {
			zpay_balance = service.getZpayBalance(member_id);
			
			model.addAttribute("zpayHistory", zpayHistory);
			model.addAttribute("zpay_balance", zpay_balance);
			return "zpay/zpay_refund_success";				
		} else {
			model.addAttribute("msg", "ZPAY 환급 실패");
			return "fail_back";
		}
		
	}

	
	// zpay_send_form.jsp 페이지로 디스페치
//	@GetMapping("zpay_send_form")
//	public String zpaySendForm(@RequestParam int order_secondhand_idx, Model model) {
//		System.out.println("ZpayController - zpaySendForm()");
//		
//		OrderSecondhandVO order_secondhand = service.getOrderSecondhand(order_secondhand_idx);
//		
//		model.addAttribute("order_secondhand", order_secondhand);
//		
//		return "zpay/zpay_send_form";
//	}
//	
//	// 송금 및 수취
//	@PostMapping("zpay_send_pro")
//	public String zpaySendPro(@RequestParam int order_secondhand_idx, Model model) {
//		System.out.println("ZpayController - zpaySendPro()");
//		
//		OrderSecondhandVO order_secondhand = service.getOrderSecondhand(order_secondhand_idx);
//		
//		String seller_id = order_secondhand.getOrder_secondhand_seller();
//		String buyer_id = order_secondhand.getOrder_secondhand_buyer();
//		long zpay_amount = order_secondhand.getOrder_secondhand_price();
//		
//		// ZPAY 테이블에서 buyer_id에 일치하는 zpay_idx 조회
//		int buyer_zpay_idx = service.getZpayIdx(buyer_id);
//		// ZPAY_HISTORY 테이블에서 seller_id의 잔액조회
//		Integer buyer_zpay_balance = service.getZpayBalance(buyer_id);
//		
//		
//		// zpaySellerHistory 객체에 저장
//		ZpayHistoryVO zpayBuyerHistory = new ZpayHistoryVO();
//		zpayBuyerHistory.setZpay_idx(buyer_zpay_idx);
//		zpayBuyerHistory.setMember_id(buyer_id);
//		zpayBuyerHistory.setZpay_amount(zpay_amount);
//		zpayBuyerHistory.setZpay_balance(buyer_zpay_balance);
//
//		// ZPYA_HISTORY 테이블에 송금내역 추가
//		int insertSendCount = service.sendZpay(zpayBuyerHistory);
//		
//		// -----------------------------------------------------------------
//		
//		
//		// ZPAY 테이블에서 seller_id에 일치하는 zpay_idx 조회
//		int seller_zpay_idx = service.getZpayIdx(seller_id);
//		// ZPAY_HISTORY 테이블에서 seller_id의 잔액조회
//		Integer seller_zpay_balance = service.getZpayBalance(seller_id);
//		
//		// zpayBuyerHistory 객체에 저장
//		ZpayHistoryVO zpaySellerHistory = new ZpayHistoryVO();
//		zpaySellerHistory.setZpay_idx(seller_zpay_idx);
//		zpaySellerHistory.setMember_id(seller_id);
//		zpaySellerHistory.setZpay_amount(zpay_amount);
//		zpaySellerHistory.setZpay_balance(seller_zpay_balance);
//				
//		// ZPYA_HISTORY 테이블에 수취내역 추가
//		int insertReceiveCount = service.receiveZpay(zpaySellerHistory);
//		
//		// -------------------------------------------------------------------
//		
//		if(insertSendCount > 0 && insertReceiveCount >0) {
//			buyer_zpay_balance = service.getZpayBalance(buyer_id);
//			
//			model.addAttribute("zpaySellerHistory", zpayBuyerHistory);
//			model.addAttribute("zpaySellerHistory", zpayBuyerHistory);
//			return "zpay/zpay_main";			
////			return "zpay/zpay_send_success";			
//		} else {
//			model.addAttribute("msg", "ZPAY 송금 실패");
//			return "fail_back";
//		}
//		
//	}
}
