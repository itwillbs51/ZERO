package com.itwillbs.zero.controller;

import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.zero.handler.*;
import com.itwillbs.zero.service.*;
import com.itwillbs.zero.vo.*;

@Controller
public class ChattingController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChattingHandler.class);
	
	@Autowired
	private ChattingService service;
	
	// 채팅 페이지로 이동
	@GetMapping("chatList")
	public String chat(HttpSession session, Model model) {
		
		// 사용자 정보 출력(세션)
		// Spring Security를 적용, User 클래스를 상속받은 CustomUser 클래스의 정보(로그인한 ID)를 뷰로 보냄
//			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		/*
		System.out.println("user name : " + user.getUsername());
		System.out.println("normal chat page");
		
		model.addAttribute("userId", user);
		 */
//			System.out.println("@ChatController, Get Chat/ Username : " + user.getUsername());
		
		
		// 로그인 해야 들어갈 수 있음!
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) {
			model.addAttribute("msg", "로그인이 필요한 작업입니다!");
			return "fail_back";
		}
		
		// 회원아이디(sId)로 채팅방 조회
		// 파라미터 : member_id		리턴타입 : List<ChatRoomListVO>(chatRoomList)
		List<ChatRoomListVO> chatRoomList = service.selectChatRoomList(member_id);
		logger.info("*** 채팅방 리스트 : " + chatRoomList);
		
		model.addAttribute("chatRoomList", chatRoomList);
		
		return "chatting/chat_list";
	}
	
	// 채팅방으로 연결
	@GetMapping("chatRoom")
	public String chatRoom(int chat_room_idx, HttpSession session, Model model) {
		// 로그인 해야 들어갈 수 있음!
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) {
			model.addAttribute("msg", "로그인이 필요한 작업입니다!");
			return "fail_back";
		}
		
		// 받아온 채팅방 번호(chat_room_idx) 로 채팅 조회
		// 파라미터 : chat_room_idx		리턴타입 : List<ChatVO>(chatList)
		List<ChatVO> chatList = service.selectChatList(chat_room_idx);
		logger.info("*** 채팅내역 : " + chatList);
		
		model.addAttribute("chatList", chatList);
		
		return "chatting/chat";
	}
	
	// 실시간 채팅 DB에 저장하기
	@PostMapping("/chatRemember")
	public void chatRemember(@RequestParam Map<String, String> map, HttpSession session) {
		
		// 받아온 채팅내용(chat_content), 채팅방번호(chat_room_idx), 메세지보낸사람(member_id) 정보 넣기
		// 파라미터 : map		리턴타입 : boolean(isInsert)
//		boolean isInsert = service.insertChat(map);
//		logger.info("*** 채팅내역 : " + isInsert);
		
	}
	
	
}
