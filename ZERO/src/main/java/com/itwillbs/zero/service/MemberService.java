package com.itwillbs.zero.service;

import java.util.List;
import java.util.Map;

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
	public Map<String, String> isMemberCheck(String column, String email) {
		return mapper.selectMemberCheck(column, email);
	}
	
	// id로 회원정보목록 조회
	public List<Map<String, String>> isMemberCheckList(String column, String email) {
		return mapper.selectMemberCheckList(column, email);
	}

	// 세션 id 와 동일한 회원의 프로필 이미지 업데이트
	public int updateMember(String column1, String member_id, String column2, String fileName1) {
		
		return mapper.updateMemberImage(column1, member_id, column2, fileName1);
	}

	// 회원 정보 조회(혜진)
	public MemberVO getMember(String member_id) {
		return mapper.selectMember(member_id);
	}
	
	// 계좌인증 완료한 회원의 member_bank_auth를 'Y'로 수정(혜진)
	public int modifyBankAuth(String member_id) {
		return mapper.updateBankAuth(member_id);
	}

	// 계좌정보 조회
	public Map<String, String> selectMemberInfo(String column, String member_id) {
		return mapper.selectMemberJoin(column, member_id);
	}

	// 회원가입 폼 - 아이디 중복확인 메서드 
	public int idCheck(String member_id) {
		int cnt = mapper.idCheck(member_id);
		System.out.println("cnt : " + cnt);
		return cnt;
	}

	// 회원가입 폼 - 닉네임 중복확인 메서드 
	public int nickCheck(String member_nickname) {
		int cnt = mapper.nickCheck(member_nickname);
		System.out.println("cnt : " + cnt);
		return cnt;
	}

	
}
