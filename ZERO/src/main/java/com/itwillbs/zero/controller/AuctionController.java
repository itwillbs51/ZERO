package com.itwillbs.zero.controller;

import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.zero.handler.*;
import com.itwillbs.zero.service.*;
import com.itwillbs.zero.vo.*;

@Controller
public class AuctionController {
	
	private static final Logger logger = LoggerFactory.getLogger(AuctionController.class);
	
	@Autowired
	private AuctionService service;
	
	// 경매중 목록 페이지로 이동
	@GetMapping("auctionList_present")
	public String auctionList_present() {
		
		
		return "auction/auction_list_present";
	}
	
	// 입찰예정경매 목록 페이지로 이동
	@GetMapping("auctionList_prepare")
	public String auctionList_prepare(
//			@RequestParam(defaultValue = "1"),
			HttpSession session, Model model) {
		
		// AUCTION_MANAGING 에서 검수상태가 '검수완료'이고 검수일자컬럼의 다음날부터 그 다음 3일날까지인 상품 보여주기
		// 파라미터 없음(페이징?)		리턴타입 List<AuctionProductVO>(preAuctionList)
//		List<AuctionProductVO> preAuctionList =  service.selectPreAuctionList();
//		logger.info(preAuctionList.toString());
//		
//		model.addAttribute("preAuctionList", preAuctionList);
		
		return "auction/auction_list_prepare";
	}
	
	// 경매 종료 목록 페이지로 이동
	@GetMapping("auctionList_end")
	public String auctionList_end() {
		
		return "auction/auction_list_end";
	}
}
