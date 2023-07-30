package com.itwillbs.zero.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



// WebSocket 핸들러를 구현하기 위해 TextWebSocketHandler 상속
@Component
@RequestMapping("/chatting")
public class ChattingHandler extends TextWebSocketHandler{
	
	// WebSocket 세션 저장할 리스트 생성(전체 채팅, 알림)
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	private static final Logger logger = LoggerFactory.getLogger(ChattingHandler.class);
	
	// 클라이언트가 채팅을 위해 해당 페이지에 들어오면 클라이언트 연결, 해당 클라이언트 세션을 저장
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("Socket 연결됨!");
		
		// 리스트에 세션 저장
		sessionList.add(session);
		logger.info(sessionList.toString());
		
	}
	
	// WebSocket 서버로 데이터 전송 - 세션이(누가) 뷰페이지에서 메세지를 보냄
	// Session 모두에게 메세지를 전달해야 하므로 loop를 돌며 메세지를 전송한다.
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		logger.info("#ChattingHandler, handleMessage");
		 Map<String,Object> map = session.getAttributes();
		  String userId = (String)map.get("member_id");
		 logger.info(userId);
		
		// 연결된 모든 클라이언트에게 메세지 전송(리스트 사용)
		// getPrincipal()를 이용해 세션에 몰려있는 유저의 정보 불러옴
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(userId + ":" + message.getPayload()));
//			s.sendMessage(new TextMessage(message.getPayload()));
		}
	}
	
	// 연결이 끊어진 경우(채팅방 나가면) 해당 세션 제거
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		
		// 리스트에서 세션 제거
		sessionList.remove(session);
		
		
	}
}
