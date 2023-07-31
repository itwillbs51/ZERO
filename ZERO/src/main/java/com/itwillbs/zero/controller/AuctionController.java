package com.itwillbs.zero.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuctionController {
	
	
	
	// 경매중 목록 페이지로 이동
	@GetMapping("auctionList_present")
	public String auctionList_present() {
		
		
		return "auction/auction_list_present";
	}
	
	// 입찰예정경매 목록 페이지로 이동
	@GetMapping("auctionList_prepare")
	public String auctionList_prepare() {
		
		return "auction/auction_list_prepare";
	}
	
	// 경매 종료 목록 페이지로 이동
	@GetMapping("auctionList_end")
	public String auctionList_end() {
		
		return "auction/auction_list_end";
	}
}
