package com.itwillbs.zero.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.security.core.context.*;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class ChatController {
	
	
	
	// 채팅 페이지로 이동
	@GetMapping("chat")
	public String chat(HttpSession session, Model model) {
		
		// 임의로 세션을 주어서 채팅 기능 확인해보기
		int testId = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		session.setAttribute("sId", testId);
//		System.out.println(testId);
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
