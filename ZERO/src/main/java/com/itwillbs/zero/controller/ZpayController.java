package com.itwillbs.zero.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ZpayController {
	
	
	// zpay_main.jsp 페이지로 디스페치
	@GetMapping("zpay_main")
	public String zpayMain() {
		System.out.println("ZpayController - zpayMain()");
		
		return "zpay/zpay_main";
	}
	
	// zpay_charge_form.jsp 페이지로 디스페치
	@GetMapping("zpay_charge_form")
	public String zpayChargeForm() {
		System.out.println("ZpayController - zpayChargeForm()");
		
		return "zpay/zpay_charge_form";
	}
	
	@PostMapping("zpay_charge_pro")
	public String zpayChargePro() {
		System.out.println("ZpayController - zpayChargePro()");
		
		
		return "";
	}
}
