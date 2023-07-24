package com.itwillbs.zero.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class ChatController {
	
	
	
	// 채팅 페이지로 이동
	@GetMapping("chat")
	public String autionList_present() {
		
		return "chatting/chat";
	}
	
}
