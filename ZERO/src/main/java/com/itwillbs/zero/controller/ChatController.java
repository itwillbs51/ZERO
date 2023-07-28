//package com.itwillbs.zero.controller;
//
//import java.util.*;
//
//import javax.servlet.http.*;
//
//import org.springframework.beans.factory.annotation.*;
//import org.springframework.security.core.context.*;
//import org.springframework.security.core.userdetails.*;
//import org.springframework.stereotype.*;
//import org.springframework.ui.*;
//import org.springframework.web.bind.annotation.*;
//
//import com.itwillbs.zero.service.*;
//import com.itwillbs.zero.vo.*;
//
//import lombok.*;
//
//@RequiredArgsConstructor
//@RestController
//@RequestMapping("/chatMsg")
//public class ChatController {
//	
//	@Autowired
//	private final ChatService chatService;
//	
//	@PostMapping
//	public ChatRoomVO createRoom(@RequestBody String buyer_id) {
//		return chatService.createRoom(buyer_id);
//	}
//	
//	@GetMapping
//	public List<ChatRoomVO> findAllRoom() {
//		return chatService.findAllRoom();
//	}
//		
//	
//}
