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
	List<SecondhandVO> selectSecondhandList(@Param("startRow") int startRow, @Param("listLimit") int listLimit);

	// 중고 목록 개수조회 요청(페이징처리)
	int selectSecondhandListCount();
	
//	// 상품번호에 해당하는 카테고리 정보 조회요청
//	String selectCategory(int secondhand_idx);

	// 상품번호에 해당하는 상품의 상세정보조회 요청
	SecondhandVO selectProduct(int secondhand_idx);

	// 상품번호? member_id에 해당하는 판매자정보조회 요청
	HashMap<String,String> selectSellerInfo(@Param("secondhand_idx") int secondhand_idx, @Param("member_id") String member_id);

	// 판매자의 판매물품 개수 조회요청
	int selectSellerProductCount(String member_id);

	// 판매자의 판매물품 리스트 조회요청
	List<HashMap<String, String>> selectSellerProductList(String member_id);

	
	
	
	
	

}
