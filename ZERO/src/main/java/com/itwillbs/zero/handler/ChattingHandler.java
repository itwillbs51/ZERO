package com.itwillbs.zero.handler;

import java.util.ArrayList;
import java.util.HashMap;
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
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<String, Map<String,WebSocketSession>> roomUsers = new HashMap<>();
	private static final Logger logger = LoggerFactory.getLogger(ChattingHandler.class);
	
	public static Map<String,WebSocketSession>getMap(String name,WebSocketSession session) {
		Map<String, WebSocketSession> map = new HashMap<>();
        map.put(name, session);
        return map;
    }
	
	// 클라이언트가 채팅을 위해 해당 페이지에 들어오면 클라이언트 연결, 해당 클라이언트 세션을 저장
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("Socket 연결됨!");
		Map<String,Object> map = session.getAttributes();
		 String userId = (String)map.get("member_id");
		System.out.println(userId);
		// 리스트에 세션 저장
		if(roomUsers.get(session.getUri().getQuery().split("=")[1].toString())==null) {
			roomUsers.put(session.getUri().getQuery().split("=")[1].toString(),getMap(userId, session));
			
			System.out.println("새로운방");
			
		}else {
			if(roomUsers.get(session.getUri().getQuery().split("=")[1].toString()).get(userId)==null) {
			roomUsers.get(session.getUri().getQuery().split("=")[1].toString()).put(userId, session);
			System.out.println("put");
			}else {
			roomUsers.get(session.getUri().getQuery().split("=")[1].toString()).replace(userId, session);
			System.out.println("replace");
			}
			
			System.out.println(roomUsers.get(session.getUri().getQuery().split("=")[1].toString()));
		}
	
		
//		sessionList.add(session);
//		logger.info(sessionList.toString());
		
	}
	
	// WebSocket 서버로 데이터 전송 - 세션이(누가) 뷰페이지에서 메세지를 보냄
	// Session 모두에게 메세지를 전달해야 하므로 loop를 돌며 메세지를 전송한다.
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		logger.info("#ChattingHandler, handleMessage");
		 Map<String,Object> map = session.getAttributes();
		 System.out.println(map);
		  String userId = (String)map.get("member_id");
		 logger.info(userId);
		 System.out.println(session.getUri().getQuery().split("=")[1].toString());
		// 연결된 모든 클라이언트에게 메세지 전송(리스트 사용)
		 for ( String key : (roomUsers.get(session.getUri().getQuery().split("=")[1].toString()).keySet())) {
				WebSocketSession s=roomUsers.get(session.getUri().getQuery().split("=")[1].toString()).get(key);
				s.sendMessage(new TextMessage(userId + ":" + message.getPayload()));
				
			}
//		for(WebSocketSession s : sessionList) {
//			s.sendMessage(new TextMessage(userId + ":" + message.getPayload()));
//			s.sendMessage(new TextMessage(message.getPayload()));
//		}
	}
	
	// 연결이 끊어진 경우(채팅방 나가면) 해당 세션 제거
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		
		// 리스트에서 세션 제거
//		sessionList.remove(session);
		
		
	}
}
