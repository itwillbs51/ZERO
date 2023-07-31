package com.itwillbs.zero.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.zero.mapper.BankMapper;
import com.itwillbs.zero.vo.ResponseTokenVO;

@Service
public class BankService {
	
	@Autowired
	private BankMapper mapper;

	// 토큰정보 저장
	public boolean registToken(String member_id, ResponseTokenVO responseToken) {
		if(mapper.insertToken(member_id, responseToken) > 0) {
			return true;			
		} else {
			return false;
		}
	}

	// 토큰 정보 조회 요청 - JOIN 구문 활용
	public ResponseTokenVO getTokenForBankAuth(String member_id) {
		return mapper.selectTokenForBankAuth(member_id);
	}
}
