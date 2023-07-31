package com.itwillbs.zero.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.itwillbs.zero.mapper.AuctionMapper2;
import com.itwillbs.zero.vo.AuctionProductVO;

@Service
public class AuctionService2  {
	@Autowired
	private AuctionMapper2 mapper;
	public List<HashMap<String, String>> getCategory() {
		return mapper.selectCategoryList();
		}
	public List<HashMap<String, String>> getBrand() {
		// TODO Auto-generated method stub
		return  mapper.selectBrandList();
	}
	public int registProduct(AuctionProductVO auctionProduct) {
		int insertcount= mapper.insertProduct(auctionProduct);
		mapper.insertAuctionManaging(auctionProduct);
		
		return  insertcount;
	}

}
