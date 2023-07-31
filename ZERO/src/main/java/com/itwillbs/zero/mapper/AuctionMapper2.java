package com.itwillbs.zero.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.zero.vo.AuctionProductVO;

@Mapper
public interface AuctionMapper2 {

	List<HashMap<String, String>> selectCategoryList();

	List<HashMap<String, String>> selectBrandList();

	int insertProduct(AuctionProductVO auctionProduct);

	void insertAuctionManaging(AuctionProductVO auctionProduct);

	

}
