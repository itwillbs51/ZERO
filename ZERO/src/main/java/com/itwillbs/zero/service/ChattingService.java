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
	
	
	// 채팅방 정보 조회
	public List<ChatRoomListVO> selectChatRoomList(String member_id) {
		return mapper.selectChatRoomList(member_id);
	}
	
	// 채팅 내역 조회
	public List<ChatVO> selectChatList(int chat_room_idx) {
		return mapper.selectChatList(chat_room_idx);
	}
	
	// 채팅 내역 삽입
	public boolean insertChat(Map<String, String> map) {
		int insertChat = mapper.insertChat(map);
		if(insertChat > 0) {
			return true;
		}
		
		return false;
	}
	
	// 채팅방 찾기
	public int selectChatRoomIdx(Map<String, String> map, String buyer_id) {
		return mapper.selectChatRoomIdx(map, buyer_id);
	}
	
	// 채팅방 생성하기
	public int insertChatRoom(Map<String, String> map, String buyer_id) {
		return mapper.insertChatRoom(map, buyer_id);
	}
	
	// 채팅건 상품 번호 가져오기
	public int getSecondhandIdx(int chat_room_idx) {
		return mapper.selectSecondhandIdx(chat_room_idx);
	}
	
	
	
}
