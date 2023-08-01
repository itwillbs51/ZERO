package com.itwillbs.zero.vo;

import java.sql.*;

import lombok.*;

@Data
public class ChatVO {
	
	// 채팅방에 처음 들어왔는지(생성), 재방문인지(생성X) 구별하기 위한 열거타입
	// DB에 넣을지는 모르겠음
	public enum MessageType {
		ENTER, TALK
	}
	private MessageType type;
	
	private int chat_idx;
	private Timestamp chat_datetime;
	private String chat_content;
	private String chat_content_type;	// 채팅타입 - "사용자", "안내"
	private int chat_room_idx;
	private String member_id;
}
