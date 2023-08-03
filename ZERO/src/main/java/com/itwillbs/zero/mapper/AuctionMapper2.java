package com.itwillbs.zero.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.zero.vo.AuctionProductVO;

@Mapper
public interface AuctionMapper2 {

	List<HashMap<String, String>> selectCategoryList();

	List<HashMap<String, String>> selectBrandList();

	int insertProduct(AuctionProductVO auctionProduct);

	void insertAuctionManaging(AuctionProductVO auctionProduct);


	HashMap<String, String> selectAuctionProduct(int id);

	List<HashMap<String, String>> selectAuctionLog(int id);

	int insertLog(Map<String, String> map);

	int selectMaxPrice(Map<String, String> map);

	

}
