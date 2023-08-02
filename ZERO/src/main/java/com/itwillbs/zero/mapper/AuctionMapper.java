package com.itwillbs.zero.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.itwillbs.zero.vo.*;

@Mapper
public interface AuctionMapper {

	// 입찰 예정 목록 조회
	List<HashMap<String, String>> selectPreAuctionList(
			@Param("pageNum") int pageNum, @Param("category") String category
			, @Param("sort") String sort, @Param("startRow") int startRow, @Param("listLimit") int listLimit);

	// 전체 게시물 수 계산 (type으로 목록 구분)
	int selectGetAuctionListCount(@Param("pageNum") int pageNum, @Param("category") String category
			, @Param("sort") String sort, @Param("type") String type);
	

}
