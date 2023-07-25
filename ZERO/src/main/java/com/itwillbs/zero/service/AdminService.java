package com.itwillbs.zero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.zero.mapper.AdminMapper;
import com.itwillbs.zero.vo.CsVO;
import com.itwillbs.zero.vo.MemberVO;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;

	// 회원 목록 조회
	public List<MemberVO> getMemebrList() {
		return mapper.selectMemberList();
	}

	// 회원 정보 조회
	public MemberVO getMember(int member_idx) {
		return mapper.selectMember(member_idx);
	}
	

	// 고객센터관리 - 공지사항 목록 조회
	public List<CsVO> getCsList() {
		return mapper.selectCsList();
	}
	
	// 고객센터관리 - 공지사항 글쓰기
	public int registNotice(CsVO cs) {
		return mapper.insertNotice(cs);
	}
	
	// 고객센터관리 - 글 정보 조회
	public CsVO getCs(int cs_idx) {
		return mapper.selectCs(cs_idx);
	}

	// 고객센터관리 - 공지사항 글수정
	public int updateNotice(CsVO cs) {
		return mapper.updateNotice(cs);
	}
		
	
}
