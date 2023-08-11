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
	
	
//	// 입찰예정경매 목록 가져오는 메서드 정의
//		@ResponseBody
//		@GetMapping("preAuctionListJsonSearch")
//		public String preAuctionList(
//				@RequestParam(defaultValue = "1") int pageNum
//				, @RequestParam(defaultValue = "") String category
//				, @RequestParam(defaultValue = "") String sort) {
//			
//			// 페이징 처리를 위해 조회 목록 갯수 조절 시 사용될 변수 선언
//			int listLimit = 12; // 한 페이지에서 표시할 목록 갯수 지정
//			int startRow = (pageNum - 1) * listLimit; // 조회 시작 행(레코드) 번호
//			// -------------------------------------------------------------------------
//			// BoardService - getBoardList() 메서드 호출하여 게시물 목록 조회 요청
//			// => 파라미터 : 검색타입, 검색어, 시작행번호, 목록갯수
//			// => 리턴타입 : List<BoardVO>(boardList)
//			// AUCTION_MANAGING 에서 검수상태가 '검수완료'이고 검수일자컬럼의 다음날부터 그 다음 3일날까지인 상품 보여주기
//			// 파라미터 없음(페이징?)		리턴타입 List<AuctionProductVO>(preAuctionList)
//			List<HashMap<String, String>> preAuctionList =  auction_service.selectPreAuctionList(pageNum, category, sort, startRow, listLimit);
//			logger.info(preAuctionList.toString());
//			// -------------------------------------------------------------------------
//			// 페이징 처리를 위한 계산 작업
//			// 한 페이지에서 표시할 페이지 목록(번호) 계산
//			// 1. BoardService - getBoardListCount() 메서드를 호출하여
//			//    전체 게시물 수 조회 요청(페이지 목록 계산에 활용)
//			String type = "입찰예정";
//			int listCount = auction_service.getAucionListCount(pageNum, category, sort, type);
////			System.out.println("전체 게시물 수 : " + listCount);
////					
//			// 2. 전체 페이지 목록 갯수 계산
//			int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
////			System.out.println("전체 페이지 목록 갯수 : " + maxPage);
//			// => 이것도 리턴값으로 들고가고 싶다 => 객체로 넣기(boardList = XX, maxPage = xx) => JSONObject
//			
//			// 최대 페이지번호(maxPage) 값도 JSON 데이터로 함께 넘기기
//			// 기존 목록을 JSONObject 객체를 통해 객체 형태로 변환하고, 최대 페이지번호도 함께 추가
//			JSONObject jsonObject = new JSONObject();
//			// JSONXXX 객체의 put() 메서드를 사용하여 데이터 추가 가능
//			// JSONObject 안에는 Collection 객체를 넣을수도 있기 때문에 굳이 JSONArray를 쓰지 않아도 된다
//			// (물론 그냥 JSONArray를 써도 됨) => 그냥 여러개의 목록을 한꺼번에 내보낼 수 있다
//			jsonObject.put("preAuctionList", preAuctionList);
//			jsonObject.put("maxPage", maxPage);
//			jsonObject.put("listCount", listCount);
////			System.out.println(jsonObject);
//			
//			return jsonObject.toString();
//		}
//		
//		// 경매중 목록 가져오는 메서드 정의 (입찰예정경매 목록 메서드와 유사)
//		@ResponseBody
//		@GetMapping("nowAuctionListJsonSearch")
//		public String nowAuctionList(
//				@RequestParam(defaultValue = "1") int pageNum
//				, @RequestParam(defaultValue = "") String category
//				, @RequestParam(defaultValue = "") String sort) {
//			
//			int listLimit = 12; // 한 페이지에서 표시할 목록 갯수 지정
//			int startRow = (pageNum - 1) * listLimit; // 조회 시작 행(레코드) 번호
//			
//			List<HashMap<String, String>> nowAuctionList =  auction_service.selectNowAuctionList(pageNum, category, sort, startRow, listLimit);
////			logger.info(nowAuctionList.toString());
//			// 1. BoardService - getBoardListCount() 메서드를 호출하여
//			//    전체 게시물 수 조회 요청(페이지 목록 계산에 활용)
//			String type = "경매중";
//			int listCount = auction_service.getAucionListCount(pageNum, category, sort, type);
////			System.out.println("전체 게시물 수 : " + listCount);
//					
//			// 2. 전체 페이지 목록 갯수 계산
//			int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
////			System.out.println("전체 페이지 목록 갯수 : " + maxPage);
//			// => 이것도 리턴값으로 들고가고 싶다 => 객체로 넣기(boardList = XX, maxPage = xx) => JSONObject
//			
//			// 최대 페이지번호(maxPage) 값도 JSON 데이터로 함께 넘기기
//			JSONObject jsonObject = new JSONObject();
//			
//			jsonObject.put("nowAuctionList", nowAuctionList);
//			jsonObject.put("maxPage", maxPage);
//			jsonObject.put("listCount", listCount);
//			System.out.println(jsonObject);
//			
//			return jsonObject.toString();
//		}
//		
//		// 경매종료 목록 가져오는 메서드 정의 (입찰예정경매 목록 메서드와 유사)
//		@ResponseBody
//		@GetMapping("endAuctionListJsonSearch")
//		public String endAuctionList(
//				@RequestParam(defaultValue = "1") int pageNum
//				, @RequestParam(defaultValue = "") String category
//				, @RequestParam(defaultValue = "") String sort) {
//			
//			int listLimit = 12; // 한 페이지에서 표시할 목록 갯수 지정
//			int startRow = (pageNum - 1) * listLimit; // 조회 시작 행(레코드) 번호
//			
//			List<HashMap<String, String>> endAuctionList =  auction_service.selectEndAuctionList(pageNum, category, sort, startRow, listLimit);
//			logger.info(endAuctionList.toString());
//			// 1. BoardService - getBoardListCount() 메서드를 호출하여
//			//    전체 게시물 수 조회 요청(페이지 목록 계산에 활용)
//			String type = "경매중";
//			int listCount = auction_service.getAucionListCount(pageNum, category, sort, type);
//			System.out.println("전체 게시물 수 : " + listCount);
//			
//			// 2. 전체 페이지 목록 갯수 계산
//			int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
//			System.out.println("전체 페이지 목록 갯수 : " + maxPage);
//			// => 이것도 리턴값으로 들고가고 싶다 => 객체로 넣기(boardList = XX, maxPage = xx) => JSONObject
//			
//			// 최대 페이지번호(maxPage) 값도 JSON 데이터로 함께 넘기기
//			JSONObject jsonObject = new JSONObject();
//			
//			jsonObject.put("endAuctionList", endAuctionList);
//			jsonObject.put("maxPage", maxPage);
//			jsonObject.put("listCount", listCount);
//			System.out.println(jsonObject);
//			
//			return jsonObject.toString();
//		}
	
	
	
}
