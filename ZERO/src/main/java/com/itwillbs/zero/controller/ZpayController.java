package com.itwillbs.zero.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.zero.vo.ZpayHistoryVO;
import com.itwillbs.zero.service.ZpayService;

@Controller
public class ZpayController {
	
	@Autowired
	private ZpayService service;
	
	// zpay_main.jsp 페이지로 디스페치
	@GetMapping("zpay_main")
	public String zpayMain(Model model, HttpSession session) {
		System.out.println("ZpayController - zpayMain()");
		
		String member_id = (String)session.getAttribute("member_id");
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
