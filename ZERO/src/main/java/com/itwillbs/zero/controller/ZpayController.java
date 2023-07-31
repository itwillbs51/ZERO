package com.itwillbs.zero.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.zero.vo.MemberVO;
import com.itwillbs.zero.vo.ResponseTokenVO;
import com.itwillbs.zero.vo.ZpayHistoryVO;
import com.itwillbs.zero.vo.ZpayVO;
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
	private MemberService memberService;
	
	// zpay_main.jsp 페이지로 디스페치
	@GetMapping("zpay_main")
	public String zpayMain(Model model, HttpSession session) {
		System.out.println("ZpayController - zpayMain()");
		
		String member_id = (String)session.getAttribute("member_id");
		MemberVO member = memberService.getMember(member_id);
		
		// ZPAY 사용자 여부 조회
		ZpayVO zpay = service.isZpayUser(member_id);
		if(zpay == null) {
			
			model.addAttribute("member", member);
			
			return "zpay/zpay_regist_form";
		}
		
		// 핀테크 계좌 인증을 완료한 회원일 경우
		// 엑세스토큰과 사용자번호를 조회하여 세션에 저장
		// => MemberService - isBankAuth()를 호출하여 계좌인증 여부 확인
		// => 파라미터 : 아이디   리턴타입 : boolean(isBankAuth)
		
		// 검색하고자 하는 아이디의 member 테이블의 bank_auth_status 값이 'Y' 일 때
		// fintech_token 테이블의 레코드 조회
		// => 파라미터 : 아이디   리턴타입 : ResponseTokenVO(token)
		ResponseTokenVO token = bankService.getTokenForBankAuth(member_id);
		
		// 토큰 정보가 존재할 경우 세션에 엑세스토큰과 사용자번호 저장
		if(token != null) {
			session.setAttribute("access_token", token.getAccess_token());
			session.setAttribute("user_seq_no", token.getUser_seq_no());
		}
		
		List<ZpayHistoryVO> zpayHistoryList = service.getZpayHistory(member_id);
		System.out.println(zpayHistoryList);
		System.out.println(member_id);
		
		Integer zpay_balance = service.getZpayBalance(member_id);
		System.out.println(zpay_balance);
		
		model.addAttribute("zpayHistoryList", zpayHistoryList);
		model.addAttribute("zpay_balance", zpay_balance);
		return "zpay/zpay_main";
	}
	
	// zpay_charge_form.jsp 페이지로 디스페치
	@GetMapping("zpay_charge_form")
	public String zpayChargeForm() {
		System.out.println("ZpayController - zpayChargeForm()");
		
		return "zpay/zpay_charge_form";
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
			model.addAttribute("msg", "회원 삭제 실패");
			return "fail_back";
		}
		
	}
}
