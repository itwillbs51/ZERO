package com.itwillbs.zero.mapper;

import org.apache.ibatis.annotations.*;

import com.itwillbs.zero.vo.MemberVO;

@Mapper
public interface MemberMapper {
	// mapper 설정을 위해 임의로 만듦! - 지영

	int insertMember(MemberVO member);
	
}
