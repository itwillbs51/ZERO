package com.itwillbs.zero.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.zero.vo.OrderSecondhandVO;
import com.itwillbs.zero.vo.SecondhandVO;
import com.itwillbs.zero.vo.ZpayHistoryVO;
import com.itwillbs.zero.vo.ZpayVO;

@Mapper
public interface ZpayMapper {
	
	// 1. ZPAY 사용자 여부 조회
	// 2. ZPAY 사용자 정보 조회
	ZpayVO selectZpay(String member_id);

	// ZPZY 등록
	int insertZpay(ZpayVO zpay);
	
	// ZPAY 잔액 조회
	Integer selectZpayBalance(String member_id);	

	// ZPAY 사용 내역(목록) 조회
	List<ZpayHistoryVO> selectZpayHistory(String member_id);
	
	// ZPAY 사용 내역(목록) 개수 조회
	int selectZpayHistoryListCount(@Param("member_id") String member_id, 
								@Param("searchType") String searchType, 
								@Param("startDate") String startDate, 
								@Param("endDate") String endDate);
	
	// ZPAY 사용 내역(목록) 조회 - 필터링 적용
	List<ZpayHistoryVO> selectZpayHistoryList(@Param("member_id") String member_id, 
											@Param("searchType") String searchType, 
											@Param("startDate") String startDate, 
											@Param("endDate") String endDate, 
											@Param("startRow") int startRow,
											@Param("listLimit") int listLimit);

	// ZPAY 번호 조회
	int selectZpayIdx(String member_id);

	// ZPYA_HISTORY 테이블에 충전내역 추가
	int insertChargeHistory(ZpayHistoryVO zpayHistory);

	// ZPYA_HISTORY 테이블에 환급내역 추가
	int insertRefundHistory(ZpayHistoryVO zpayHistory);
	
	// 중고거래 내역 조회
	OrderSecondhandVO selectOrderSecondhand(int secondhand_idx);

	// ZPYA_HISTORY 테이블에 송금내역 추가
	int insertSendHistory(ZpayHistoryVO zpayBuyerHistory);

	// ZPYA_HISTORY 테이블에 수취내역 추가
	int insertReceiveHistory(ZpayHistoryVO zpaySellerHistory);
	

	
	// ========================================================================
	SecondhandVO selectSecondhand(int secondhand_idx);
	
	
	
}

