package com.itwillbs.zero.handler;

import org.springframework.context.annotation.*;
import org.springframework.web.socket.*;
import org.springframework.web.socket.config.annotation.*;

import lombok.*;

// 정보를 처리할 Handler와 webSocket 주소를 WebSocketHandlerRegistry에 추가하면
// 해당 주소로 접근 시 웹소켓을 연결할 수 있다

@RequiredArgsConstructor
@Configuration
@EnableWebSocket	// => 웹소켓 활성화
public class WebSockConfig implements WebSocketConfigurer {
	// WebSocketHandler 에 관한 생성자 추가
	private final WebSocketHandler webSocketHandler;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// endpoint 설정 : /ws/chat
        // 이를 통해서 ws://localhost:8089/ws/chat 으로 요청이 들어오면 websocket 통신을 진행한다.
		registry.addHandler(webSocketHandler, "ws/chatMsg").setAllowedOrigins("*");
	}
	
	
	
}
