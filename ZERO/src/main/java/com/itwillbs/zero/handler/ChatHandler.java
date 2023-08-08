package com.itwillbs.zero.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.*;

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
@RequestMapping("/chat")
public class ChatHandler extends TextWebSocketHandler{
	
	// WebSocket 세션 저장할 맵 생성(알림) - 회원아이디(방번호로 사용), 웹소켓 세션 아이디
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<String, Map<String, WebSocketSession>> alarmUsers = new HashMap<>();
//	private static Map<String, WebSocketSession> alarmUsers = new HashMap<>();
	//Map<방번호, Map<httpsession아이디,WebSocketSession>>
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	
	public static Map<String, WebSocketSession> getMap(String name, WebSocketSession session) {
		//innermap 셋팅 함수
		Map<String, WebSocketSession> map = new HashMap<>();
		map.put(name, session);
        return map;
    }
	
	// 클라이언트가 채팅을 위해 해당 페이지에 들어오면 클라이언트 연결, 해당 클라이언트 세션을 저장
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("Socket-알림 연결됨!");
		
		// Map<httpsession아이디,WebSocketSession> 설정
//		Map<String, WebSocketSession> map = new HashMap<>();
		// 방 구분에 사용할 회원 아이디(세션으로 받아옴)
		String member_id = session.getUri().getQuery().split("=")[1].toString();
		// 발신자
		String senderId = (String) session.getAttributes().get("member_id");
		
//		userId = (String) map.get("member_id"); (session.getUri().getQuery().split("=")[1].toString(), getMap(senderId, session));
//		System.out.println(userId);
		
		// 세션 끊어졌을 때 처리
		if(senderId == null) {return; }
		if(alarmUsers.get(member_id) == null) {
			//session.getUri().getQuery()=>http://localhost:8089/zero/chat? 뒤에 파라미터 (ex member_id = xxx_xxx.xxx) 가져옴
			//Map roomUsers에 저장된 방이 없으면(ex 1번 방 없으면)
			alarmUsers.put(member_id, getMap(senderId, session));
			//방id(ex xxx_xxx.xxx => @는 문제 있을수 있으니 _로 replace ),userId, session 저장
			System.out.println("새로운 로그");
//			
		}else {
			
			if(alarmUsers.get(member_id).get(senderId)==null) {
				//방은 있는데 유저아이디가 없다?
				alarmUsers.get(member_id).put(senderId, session);
				//(ex 1번방)에 userId, session 저장
				System.out.println("put");
			
			} else {
				alarmUsers.get(member_id).replace(senderId, session);
				//방도 있고 유저아이디도 있다? userId에 session을 replace
				System.out.println("replace");
			}
			
			System.out.println("입장 : " + alarmUsers.get(session.getUri().getQuery().split("=")[1].toString()));
		}
	
		
//		sessionList.add(session);
//		logger.info(sessionList.toString());
		
	}
	
	// WebSocket 서버로 데이터 전송 - 세션이(누가) 뷰페이지에서 메세지를 보냄
	// Session 모두에게 메세지를 전달해야 하므로 loop를 돌며 메세지를 전송한다.
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		logger.info("#ChatHandler, handleMessage");
		
		// 방 구분에 사용할 회원 아이디(세션으로 받아옴)
		String member_id = session.getUri().getQuery().split("=")[1].toString();
		
		// 발신자
		String senderId = (String) session.getAttributes().get("member_id");
		logger.info(senderId);
		
		// 연결된 방의 클라이언트에게 메세지 전송
		for ( String key : (alarmUsers.get(member_id).keySet())) {
			WebSocketSession s=alarmUsers.get(member_id).get(key);
			s.sendMessage(new TextMessage(senderId + ":" + message.getPayload()));
		}
		 
//		for(WebSocketSession s : sessionList) {
//			s.sendMessage(new TextMessage(userId + ":" + message.getPayload()));
////			s.sendMessage(new TextMessage(message.getPayload()));
//		}
	}
	
	// 연결이 끊어진 경우(채팅방 나가면) 해당 세션 제거
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		// 방 구분에 사용할 회원 아이디(세션으로 받아옴)
		String member_id = session.getUri().getQuery().split("=")[1].toString();
		
		// 발신자
		String senderId = (String) session.getAttributes().get("member_id");
		 
		// 맵에서 해당 아이디 세션 제거
		alarmUsers.get(member_id).remove(senderId);
		logger.info("세션제거 후 : " + alarmUsers.toString());
		
	}
}
