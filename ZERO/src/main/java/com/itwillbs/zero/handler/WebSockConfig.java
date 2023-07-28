//package com.itwillbs.zero.handler;
//
//import org.springframework.context.annotation.*;
//import org.springframework.web.socket.*;
//import org.springframework.web.socket.config.annotation.*;
//
//import lombok.*;
//
//// 정보를 처리할 Handler와 webSocket 주소를 WebSocketHandlerRegistry에 추가하면
//// 해당 주소로 접근 시 웹소켓을 연결할 수 있다
//
//@RequiredArgsConstructor
//@Configuration
//@EnableWebSocket	// => 웹소켓 활성화
//public class WebSockConfig implements WebSocketConfigurer {
//	private final WebSocketHandler webSocketHandler;
//
//	@Override
//	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
//		registry.addHandler(webSocketHandler, "ws/chatMsg").setAllowedOrigins("*");
//	}
//	
//	
//	
//}
