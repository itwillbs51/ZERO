package com.itwillbs.zero.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.zero.mapper.*;
import com.itwillbs.zero.vo.*;

@Service
public class AuctionService {
	
	@Autowired
	private AuctionMapper mapper;

	// 입찰 예정 목록 조회
	public List<HashMap<String, String>> selectPreAuctionList(int pageNum, String category, String sort, int startRow, int listLimit) {
		return mapper.selectPreAuctionList(pageNum, category, sort, startRow, listLimit);
	}
	
	// 전체 게시물 수 계산 (type으로 목록 구분)
	public int getAucionListCount(int pageNum, String category, String sort, String type) {
		return mapper.selectGetAuctionListCount(pageNum, category, sort, type);
	}

}
