package com.itwillbs.zero.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.zero.mapper.MemberMapper;
import com.itwillbs.zero.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	// 회원가입
	public int registMember(MemberVO member) {
		return mapper.insertMember(member);
	}

	// id로 회원정보 조회
	public HashMap<String, String> isMemberCheck(String column, String email) {
		return mapper.selectMemberCheck(column, email);
	}
	
	// id로 회원정보목록 조회
	public List<HashMap<String, String>> isMemberCheckList(String column, String email) {
		return mapper.selectMemberCheckList(column, email);
	}

	// 회원 정보 조회(혜진)
	public MemberVO getMember(String member_id) {
		return mapper.selectMember(member_id);
	}
	
	// 계좌인증 완료한 회원의 member_bank_auth를 'Y'로 수정(혜진)
	public int modifyBankAuth(String member_id) {
		return mapper.updateBankAuth(member_id);
	}

	

}
