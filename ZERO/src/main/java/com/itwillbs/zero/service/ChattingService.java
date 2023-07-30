package com.itwillbs.zero.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.zero.mapper.*;
import com.itwillbs.zero.vo.*;

@Service
public class ChattingService {

	@Autowired
	private ChattingMapper mapper;
	
	// 채팅방 조회
	public List<ChatRoomListVO> selectChatRoomList(String member_id) {
		return mapper.selectChatRoomList(member_id);
	}
	
	// 채팅 내역 조회
	public List<ChatVO> selectChatList(int chat_room_idx) {
		return mapper.selectChatList(chat_room_idx);
	}
	
	
	
}
