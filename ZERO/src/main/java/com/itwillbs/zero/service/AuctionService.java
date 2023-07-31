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
//	public List<AuctionProductVO> selectPreAuctionList() {
//		return mapper.selectPreAuctionList();
//	}

}
