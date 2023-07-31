package com.itwillbs.zero.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.zero.vo.ResponseTokenVO;

@Mapper
public interface BankMapper {

	// 토큰 정보 저장
	int insertToken(@Param("member_id") String member_id, @Param("token") ResponseTokenVO responseToken);

	// 토큰 정보 조회
	ResponseTokenVO selectTokenForBankAuth(String member_id);

}
