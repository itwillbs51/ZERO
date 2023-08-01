package com.itwillbs.zero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.zero.vo.ZpayHistoryVO;
import com.itwillbs.zero.vo.ZpayVO;


import com.itwillbs.zero.mapper.ZpayMapper;

@Service
public class ZpayService {

	@Autowired
	private ZpayMapper mapper;
	
//	private ZpayHistoryMapper zpayHistorymapper;
	
	// ZPAY 사용자 여부 조회
	public ZpayVO isZpayUser(String member_id) {
		return mapper.selectZpay(member_id);
	}
	
	// ZPAY 등록
	public int registZpay(ZpayVO zpay) {
		return mapper.insertZpay(zpay);
	}
	
	// ZPAY 잔액 조회
	public Integer getZpayBalance(String member_id) {
		
		Integer zpay_balance = mapper.selectZpayBalance(member_id);
		
		return zpay_balance != null ? zpay_balance : 0;
	}
	
	
	// ZPAY 사용 내역(목록) 조회
	public List<ZpayHistoryVO> getZpayHistory(String member_id) {
				
		return mapper.selectZpayHistory(member_id);
	}
	

	// ZPAY 번호 조회
	public int getZpayIdx(String member_id) {
		return mapper.selectZpayIdx(member_id);
	}


	// ZPYA_HISTORY 테이블에 충전내역 추가
	public int chargeZpay(ZpayHistoryVO zpayHistory) {
		return mapper.insertChargeHistory(zpayHistory);
	}

	// ZPAY_HISTORY 테이블에 환급내역 추가
	public int refundZpay(ZpayHistoryVO zpayHistory) {
		return mapper.insertRefundHistory(zpayHistory);
	}

	


	
	
}
