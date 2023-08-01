package com.itwillbs.zero.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.zero.vo.ZpayVO;

@Mapper
public interface ZpayMapper {

	// ZPAY 사용자 여부 조회
	ZpayVO selectZpay(String member_id);

	// ZPZY 등록
	int insertZpay(ZpayVO zpay);

}
