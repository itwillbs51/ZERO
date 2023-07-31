package com.itwillbs.zero.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.*;

import com.itwillbs.zero.vo.MemberVO;

@Mapper
public interface MemberMapper {
	// mapper 설정을 위해 임의로 만듦! - 지영

	int insertMember(MemberVO member);

	// 조건에 따라 회원정보 조회 - 파라미터2개
	HashMap<String, String> selectMemberCheck(@Param("column") String column, @Param("value") String value);
	
	List<HashMap<String, String>> selectMemberCheckList(@Param("column") String column, @Param("value") String value);
	
	// 회원정보조회(혜진)
	MemberVO selectMember(String member_id);

	// 계좌인증 완료한 회원의 member_bank_auth를 'Y'로 수정(혜진)
	int updateBankAuth(String member_id);

}
