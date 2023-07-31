package com.itwillbs.zero.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.itwillbs.zero.vo.*;

@Mapper
public interface SecondhandMapper {

	//중고상품 등록 작업 요청
	int insertProduct(SecondhandVO secondhand);

	//카테고리 리스트 조회 요청
	List<HashMap<String, String>> selectCategoryList();

	// 중고 목록 조회 요청
	List<SecondhandVO> selectSecondhandList(int startRow, int listLimit);

	// 중고 목록 개수조회 요청(페이징처리)
	int selectSecondhandListCount();
	
	// 상품번호에 해당하는 카테고리 정보 조회요청
	String selectCategory(int secondhand_idx);

}
