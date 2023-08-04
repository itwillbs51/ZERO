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
	
	// 거래정보를 ORDER_SECONDHAND에 저장
	int insertOrderInfo(Map<String, String> map);
	
	// 거래상태 변경 '판매중' -> '예약중'
	int updateDealStatuse(String secondhand_idx);
	
}
