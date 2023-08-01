package com.itwillbs.zero.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.zero.mapper.*;
import com.itwillbs.zero.vo.*;


@Service
public class SecondhandService {

	
	 @Autowired
	 private SecondhandMapper mapper;


	// 중고상품 등록 폼 - 중고 카테고리 목록
	public List<HashMap<String, String>> getCategorylist() {
		return mapper.selectCategoryList();

	}
	 
	// 중고 상품 등록작업 요청
	public int registBoard(SecondhandVO secondhand) {
		int insertcount= mapper.insertProduct(secondhand);
		mapper.insertProduct(secondhand);
		
		return  insertcount;
	}

	// 중고 목록 페이지
	public List<SecondhandVO> getSecondhandList(int startRow, int listLimit) {
		return mapper.selectSecondhandList(startRow, listLimit);
	}

	// 페이징처리 - 중고목록 전체 개수 
	public int getSecondhandListCount() {
		return mapper.selectSecondhandListCount();
	}

	//상품번호에 해당하는 카테고리 정보 조회
//	public String getCategory(int secondhand_idx) {
//		return mapper.selectCategory(secondhand_idx);
//	}
	
	//상세페이지 - 상품번호에 해당하는 상품정보 조회
	public SecondhandVO getSecondhandProduct(int secondhand_idx) {
		return mapper.selectProduct(secondhand_idx);
	}

	    

}
