package com.itwillbs.zero.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.zero.vo.CsVO;
import com.itwillbs.zero.vo.MemberVO;

@Mapper
public interface AdminMapper {

	// 회원 목록 조회
	List<MemberVO> selectMemberList();

	// 회원 정보 조회
	MemberVO selectMember(int member_idx);
	
	// 고객센터관리 - 공지사항 목록 조회
	List<CsVO> selectCsList();

	// 고객센터관리 - 공지사항 글쓰기
	int insertNotice(CsVO cs);
	
	// 고객센터관리 - 공지사항 글 정보 조회
	CsVO selectCs(int cs_idx);

	// 고객센터관리 - 공지사항 글수정
	int updateNotice(CsVO cs);

}
