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


	// 중고상품 등록 폼 - 중고 카테고리
	public List<HashMap<String, String>> getCategory() {
		return mapper.selectCategoryList();

	}
	 
	// 중고 상품 등록작업 요청
	public int registBoard(SecondhandVO secondhand) {
		
		return mapper.insertProduct(secondhand);
	}

	    

}
