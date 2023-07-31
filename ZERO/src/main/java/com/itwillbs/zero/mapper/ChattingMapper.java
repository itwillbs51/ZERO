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
	
}
