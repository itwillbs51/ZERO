package com.itwillbs.zero;

import java.text.DateFormat;
import java.util.*;

import javax.servlet.http.*;

import org.json.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.context.*;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.zero.service.*;
import com.itwillbs.zero.vo.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private SecondhandService secondhand_service;
	
	@Autowired
	private AuctionService auction_service;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	
	
	
	//검색기능-검색시 상품리스트(경매/중고) 출력
	@RequestMapping(value="searchProductList", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchProductList (@RequestParam(defaultValue="") String productSearchKeyword, Model model) {
		
		//중고상품 목록 조회
		List<SecondhandVO> searchSecondhandList = secondhand_service.getSearchSecondhandList(productSearchKeyword);
		model.addAttribute("searchSecondhandList", searchSecondhandList);
		//중고상품 목록 개수조회
		int searchSecondhandCount = secondhand_service.getSearchSecondhandCount(productSearchKeyword);
		model.addAttribute("searchSecondhandCount", searchSecondhandCount);

		
		//경매목록조회
		List<HashMap<String, String>> AuctionList =  auction_service.getAuctionList(productSearchKeyword);
		model.addAttribute("AuctionList", AuctionList);

		//경매목록개수조회
		int listCount = auction_service.getAucionCount(productSearchKeyword);
		model.addAttribute("listCount", listCount);

		
		return "search_result";
		
	} 
	
	
	
	
}
