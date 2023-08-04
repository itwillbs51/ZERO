package com.itwillbs.zero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.zero.vo.ZpayHistoryVO;
import com.itwillbs.zero.vo.ZpayVO;
import com.itwillbs.zero.vo.OrderSecondhandVO;
import com.itwillbs.zero.vo.SecondhandVO;
import com.itwillbs.zero.mapper.ZpayMapper;


@Service
public class ZpayService {
	
	@Autowired
	private ZpayMapper mapper;

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
//	public ZpayHistoryVO getZpayBalance(String member_id) {
		
		Integer zpay_balance = mapper.selectZpayBalance(member_id);
		
		return zpay_balance != null ? zpay_balance : 0;
//		return mapper.selectZpayBalance(member_id);
	}
	
	// ZPAY 사용 내역(목록) 조회
	public List<ZpayHistoryVO> getZpayHistory(String member_id) {
		return mapper.selectZpayHistory(member_id);
	}


	// ZPAY 번호 조회
	public int getZpayIdx(String member_id) {
		return mapper.selectZpayIdx(member_id);
	}
	
	// ZPAY 사용자 정보 조회
	public ZpayVO getZpay(String member_id) {
		return mapper.selectZpay(member_id);
	}

	// ZPYA_HISTORY 테이블에 충전내역 추가
	public int chargeZpay(ZpayHistoryVO zpayHistory) {
		return mapper.insertChargeHistory(zpayHistory);
	}

	// ZPYA_HISTORY 테이블에 환급내역 추가
	public int refundZpay(ZpayHistoryVO zpayHistory) {
		return mapper.insertRefundHistory(zpayHistory);
	}

	// 중고거래 내역 조회
	public OrderSecondhandVO getOrderSecondhand(int secondhand_idx) {
		return mapper.selectOrderSecondhand(secondhand_idx);
	}
	
	// ZPYA_HISTORY 테이블에 송금내역 추가
	public int sendZpay(ZpayHistoryVO zpayBuyerHistory) {
		return mapper.insertSendHistory(zpayBuyerHistory);
	}

	// ZPYA_HISTORY 테이블에 수취내역 추가
	public int receiveZpay(ZpayHistoryVO zpaySellerHistory) {
		return mapper.insertReceiveHistory(zpaySellerHistory);
	}

	
	
	
	
	
	
	// ===================================================================
	public SecondhandVO getSecondhand(int secondhand_idx) {
		return mapper.selectSecondhand(secondhand_idx);
	}

	
	
//	public int getZpayHistoryListCount(String member_id, String searchType) {
//		return mapper.selectZpayHistoryListCount(member_id, searchType);
//	}
//
//	public List<ZpayHistoryVO> getZpayHistoryList(String member_id, String searchType) {
//		return mapper.selectZpayHistoryList(member_id, searchType);
//	}
	public int getZpayHistoryListCount(String member_id, String searchType, String searchKeyword) {
		return mapper.selectZpayHistoryListCount(member_id, searchType, searchKeyword);
	}
	
	public List<ZpayHistoryVO> getZpayHistoryList(String member_id, String searchType, String searchKeyword,
			int startRow, int listLimit) {
		return mapper.selectZpayHistoryList(member_id, searchType, searchKeyword, startRow, listLimit);
	}

}