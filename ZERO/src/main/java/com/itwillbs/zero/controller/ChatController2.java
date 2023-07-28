package com.itwillbs.zero.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.security.core.context.*;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class ChatController2 {
	
	
	
	// 채팅 페이지로 이동
	@GetMapping("chat")
	public String chat(HttpSession session, Model model) {
		
		
		// 사용자 정보 출력(세션)
		/*
		 */
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("user name : " + user.getUsername());
		System.out.println("normal chat page");
		
		model.addAttribute("userId", user);
		
		
		return "chatting/chat";
	}
	
}
