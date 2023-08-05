package com.itwillbs.zero.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.itwillbs.zero.vo.*;

@Mapper
public interface ChattingMapper {
	
	// 채팅방 조회
	List<ChatRoomListVO> selectChatRoomList(String member_id);
	
	// 채팅 조회
	List<ChatVO> selectChatList(int chat_room_idx);
	
	// 채팅 내역 삽입
	int insertChat(Map<String, String> map);
	
	// 채팅방 찾기
	int selectChatRoomIdx(@Param("map") Map<String, String> map, @Param("buyer_id") String buyer_id);
	
	// 채팅방 생성하기
	int insertChatRoom(@Param("map") Map<String, String> map, @Param("buyer_id") String buyer_id);
	
	// 채팅방에 대한 정보 조회
	ChatRoomVO selectChatRoom(int chat_room_idx);
	
	// --- 나중에 옮기기 ---
	// 거래정보를 ORDER_SECONDHAND에 저장
	int insertOrderInfo(Map<String, String> map);
	// 거래상태 변경 '판매중' -> '예약중'
	int updateDealStatuse(String secondhand_idx);
	
	// --- 나중에 옮기기 ---
	// 신청폼 들어올 때 값 넣기
	int insertZmanOrderInfo(Map<String, String> map);
	// z맨 호출신청 폼에 필요한 order_secondhand_idx 조회하기
	int selectOrderSecondhandIdx(String secondhand_idx);
	// z맨 호출신청 폼에 필요한 주소 등 데이터 가져오기
	ZmanDeliveryVO selectZmanOrderInfo(int order_secondhand_idx);
	// 주소 받아 DB에 업데이트
	int updateZmanOrderInfo(@Param("map") Map<String, String> map, @Param("zman_delivery_idx") int zman_delivery_idx);
	// Z맨 최종 호출
	int updateZDelivery(String zman_delivery_idx);
	
}
