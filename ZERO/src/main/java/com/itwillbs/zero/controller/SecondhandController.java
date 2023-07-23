package com.itwillbs.zero.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class SecondhandController {

	
		//네비-중고거래 선택시
		@GetMapping("secondhand_list")
		public String secondhand_list() {
			
			return "secondhand/secondhand_list";
		}
		
		
		//상품등록하기
		
		
		//상품수정하기
		
		
		//판매자페이지
		
		
		
}
