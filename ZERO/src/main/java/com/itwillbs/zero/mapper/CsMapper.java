package com.itwillbs.zero.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.zero.vo.CsVO;

@Mapper
public interface CsMapper {
	
	// 1:1 문의글 등록하기 (csQnaFormPro)
	int insertCsQna(CsVO cs);

}
