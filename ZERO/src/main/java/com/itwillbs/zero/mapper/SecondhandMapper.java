package com.itwillbs.zero.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.itwillbs.zero.vo.*;

@Mapper
public interface SecondhandMapper {

	//중고상품 등록 작업 요청
	int insertProduct(SecondhandVO secondhand);

	List<HashMap<String, String>> selectCategoryList();

}
