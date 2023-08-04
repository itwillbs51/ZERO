package com.itwillbs.zero.controller;

import java.util.List;
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
import com.itwillbs.zero.vo.ResponseTokenVO;
import com.itwillbs.zero.vo.ResponseUserInfoVO;
import com.itwillbs.zero.vo.ResponseWithdrawVO;
import com.itwillbs.zero.vo.ZpayHistoryVO;
import com.itwillbs.zero.vo.ZpayVO;
import com.itwillbs.zero.vo.OrderSecondhandVO;
import com.itwillbs.zero.vo.PageInfoVO;
import com.itwillbs.zero.vo.ResponseDepositVO;
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
			@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String startDate, 
			@RequestParam(defaultValue = "") String endDate, 
			@RequestParam(defaultValue = "1") int pageNum, 
			Model model, HttpSession session) {
		System.out.println("ZpayController - zpayMain()");
		
		String member_id = (String)session.getAttribute("member_id");
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
		
		// ------------------------------------------------------------------------------------------
		int listLimit = 10; //한페이지 표시 목록갯수
		int startRow = (pageNum - 1) * listLimit; //조회시작 행번호
		
		//페이징 계산작업
		//1.전체게시물 수 조회 작업 요청
		int listCount = service.getZpayHistoryListCount(member_id, searchType, startDate, endDate);
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //3. 전체 페이지 목록갯수
		
		// -----------------------------------------------------------------------------------------
		
		// ZPAY 사용자일 경우 ZPAY 이용 내역 정보 조회 후 zpay_main 페이지로 이동
		List<ZpayHistoryVO> zpayHistoryList = service.getZpayHistory(member_id);
		System.out.println(zpayHistoryList);
		System.out.println(member_id);
		
		Integer zpay_balance = service.getZpayBalance(member_id);
		System.out.println(zpay_balance);
		
		model.addAttribute("zpayHistoryList", zpayHistoryList);
		model.addAttribute("zpay_balance", zpay_balance);
		model.addAttribute("listCount", listCount);
		
		return "zpay/zpay_main";
	}
	
	@ResponseBody
	@GetMapping("zpay_main_ajax")
	public String zpayMainAjax(
			@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String startDate, 
			@RequestParam(defaultValue = "") String endDate, 
			@RequestParam(defaultValue = "1") int pageNum, 
			Model model, HttpSession session) {
		System.out.println("ZpayController - zpayMain()");
		
		String member_id = (String)session.getAttribute("member_id");
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
		
		
		// ------------------------------------------------------------------------------------------
		int listLimit = 10; //한페이지 표시 목록갯수
		int startRow = (pageNum - 1) * listLimit; //조회시작 행번호
		
		//페이징 계산작업
		//1.전체게시물 수 조회 작업 요청
		int listCount = service.getZpayHistoryListCount(member_id, searchType, startDate, endDate);
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //3. 전체 페이지 목록갯수
		
		// -----------------------------------------------------------------------------------------
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
		jsonObject.put("listCount", zpayHistoryList.size());
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
		
		// 출금이체 요청을 위한 계좌정보(ZPAY테이블 - fintech_use_num, access_token) 조회 => Map 객체에 저장
		ZpayVO zpay = service.getZpay(member_id);
		map.put("access_token", zpay.getAccess_token());
		map.put("fintech_use_num", zpay.getFintech_use_num());
		
		// BankApiService - requestWithdraw() 메서드를 호출하여 출금이체 요청
		// => 파라미터 : Map 객체   리턴타입 : ResponseWithdrawVO
		ResponseWithdrawVO withdrawResult = bankApiService.requestWithdraw(map);
		
		// Model 객체에 ResponseWithdrawVO 객체 저장
		model.addAttribute("withdrawResult", withdrawResult);
		
		// ---------------------------------------------------------------------------------------------------------------
		// ZPAY_HISTORY 테이블에서 잔액조회
		Integer zpay_balance = service.getZpayBalance(member_id);
		
		zpayHistory.setZpay_idx(zpay.getZpay_idx());
		zpayHistory.setZpay_amount(withdrawResult.getTran_amt());
		zpayHistory.setZpay_balance(zpay_balance);
		zpayHistory.setZpay_deal_type("충전");
		System.out.println(zpayHistory);
		
		// ZPYA_HISTORY 테이블에 충전내역 추가
		int insertCount = service.chargeZpay(zpayHistory);
		
		if(insertCount > 0) {
			zpay_balance = service.getZpayBalance(member_id);
			
			model.addAttribute("zpay", zpay);
			model.addAttribute("zpayHistory", zpayHistory);
			model.addAttribute("zpay_balance", zpay_balance);
			return "zpay/zpay_charge_success";			
		} else {
			model.addAttribute("msg", "ZPAY 충전 실패");
			return "fail_back";
		}
		
	}
	
	// zpay_refund_form.jsp 페이지로 디스페치
	@GetMapping("zpay_refund_form")
	public String zpayRefundForm(Model model, HttpSession session) {
		System.out.println("ZpayController - zpayRefundForm()");
		
		ZpayVO zpay = service.getZpay((String)session.getAttribute("member_id"));
		model.addAttribute("zpay", zpay);
				
		return "zpay/zpay_refund_form";
	}
	
	
	// ZPAY 환급 비즈니스 로직 요청
	@PostMapping("zpay_refund_pro")
	public String zpayRefundPro(ZpayHistoryVO zpayHistory, 
			@RequestParam String member_id, 
			@RequestParam String zpayAmount, 
			Map<String, String> map,
			Model model) {
		System.out.println("ZpayController - zpayRefundPro()");		
		
		// 입금이체 요청을 위한 계좌정보(ZPAY테이블 - fintech_use_num, access_token) 조회 => Map 객체에 저장
		ZpayVO zpay = service.getZpay(member_id);
		map.put("access_token", zpay.getAccess_token());
		map.put("fintech_use_num", zpay.getFintech_use_num());
		
		// BankApiService - requestWithdraw() 메서드를 호출하여 출금이체 요청
		// => 파라미터 : Map 객체   리턴타입 : ResponseWithdrawVO
		ResponseDepositVO depositResult = bankApiService.requestDeposit(map);
		
		// Model 객체에 ResponseWithdrawVO 객체 저장
		model.addAttribute("depositResult", depositResult);
		
		// ---------------------------------------------------------------------------------------------------------------
		// ZPAY_HISTORY 테이블에서 잔액조회
		Integer zpay_balance = service.getZpayBalance(member_id);
		
		zpayHistory.setZpay_idx(zpay.getZpay_idx());
//		zpayHistory.setZpay_amount(Integer.parseInt(zpayAmount));
//		zpayHistory.setZpay_balance(zpay_balance);
		zpayHistory.setZpay_amount(depositResult.getRes_list() == null? 0 : depositResult.getRes_list().get(0).getTran_amt());
		zpayHistory.setZpay_balance(zpay_balance);	// 기존 잔액 =>ZpayMapper.xml에서 zpay_amount를 더할 예정
		zpayHistory.setZpay_deal_type("환급");
		System.out.println(zpayHistory);
		
		// ZPYA_HISTORY 테이블에 환급내역 추가
		int insertCount = service.refundZpay(zpayHistory);
		
		if(insertCount > 0) {
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
	public String zpaySendForm(@RequestParam int order_secondhand_idx, Model model) {
		System.out.println("ZpayController - zpaySendForm()");
		
		OrderSecondhandVO order_secondhand = service.getOrderSecondhand(order_secondhand_idx);
		ZpayVO zpay = service.getZpay(order_secondhand.getOrder_secondhand_buyer());
		
		model.addAttribute("order_secondhand", order_secondhand);
		model.addAttribute("zpay", zpay);
		
		return "zpay/zpay_send_form";
	}
	
	// 송금 및 수취
	@PostMapping("zpay_send_pro")
	public String zpaySendPro(@RequestParam int order_secondhand_idx, Model model) {
		System.out.println("ZpayController - zpaySendPro()");
		
		OrderSecondhandVO order_secondhand = service.getOrderSecondhand(order_secondhand_idx);
		
		String seller_id = order_secondhand.getOrder_secondhand_seller();
		String buyer_id = order_secondhand.getOrder_secondhand_buyer();
		long zpay_amount = order_secondhand.getOrder_secondhand_price();
		
		// ZPAY 테이블에서 buyer_id에 일치하는 zpay_idx 조회
		int buyer_zpay_idx = service.getZpayIdx(buyer_id);
		ZpayVO buyer_zpay = service.getZpay(buyer_id);
		// ZPAY_HISTORY 테이블에서 seller_id의 잔액조회
		Integer buyer_zpay_balance = service.getZpayBalance(buyer_id);
		
		
		// zpaySellerHistory 객체에 저장
		ZpayHistoryVO zpayBuyerHistory = new ZpayHistoryVO();
		zpayBuyerHistory.setZpay_idx(buyer_zpay_idx);
		zpayBuyerHistory.setMember_id(buyer_id);
		zpayBuyerHistory.setZpay_amount(zpay_amount);
		zpayBuyerHistory.setZpay_balance(buyer_zpay_balance);
		zpayBuyerHistory.setZpay_deal_type("중고출금");

		// ZPYA_HISTORY 테이블에 송금내역 추가
		int insertSendCount = service.sendZpay(zpayBuyerHistory);
		
		// -----------------------------------------------------------------
		
		
		// ZPAY 테이블에서 seller_id에 일치하는 zpay_idx 조회
		int seller_zpay_idx = service.getZpayIdx(seller_id);
		// ZPAY_HISTORY 테이블에서 seller_id의 잔액조회
		Integer seller_zpay_balance = service.getZpayBalance(seller_id);
		
		// zpayBuyerHistory 객체에 저장
		ZpayHistoryVO zpaySellerHistory = new ZpayHistoryVO();
		zpaySellerHistory.setZpay_idx(seller_zpay_idx);
		zpaySellerHistory.setMember_id(seller_id);
		zpaySellerHistory.setZpay_amount(zpay_amount);
		zpaySellerHistory.setZpay_balance(seller_zpay_balance);
		zpaySellerHistory.setZpay_deal_type("중고입금");
				
		// ZPYA_HISTORY 테이블에 수취내역 추가
		int insertReceiveCount = service.receiveZpay(zpaySellerHistory);
		
		// -------------------------------------------------------------------
		
		if(insertSendCount > 0 && insertReceiveCount >0) {
			buyer_zpay_balance = service.getZpayBalance(buyer_id);
			
			model.addAttribute("buyer_zpay_balance", buyer_zpay_balance);
			model.addAttribute("seller_id", seller_id);
			model.addAttribute("buyer_zpay", buyer_zpay);
			model.addAttribute("zpayBuyerHistory", zpayBuyerHistory);
//			return "zpay/zpay_main";			
			return "zpay/zpay_send_success";			
		} else {
			model.addAttribute("msg", "ZPAY 송금 실패");
			return "fail_back";
		}
		
	}
}
	
	// ================================================================================================
//	@GetMapping("secondhand_detail")
//	public String secondhandDetail(Model model) {
//		int secondhand_idx = 1;
//		
//		SecondhandVO secondhand = service.getSecondhand(secondhand_idx);
//		
//		model.addAttribute("secondhand", secondhand);
//		
//		return "secondhand_detail";
//	}
