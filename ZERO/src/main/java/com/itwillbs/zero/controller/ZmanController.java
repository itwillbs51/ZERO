package com.itwillbs.zero.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ZmanController {

	@GetMapping("zman_main")
	public String zmanMain() {
		return "zman/zman_main";
	}
}
