package com.itwillbs.zero.controller;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class ChattingController {
	
	// 채팅 페이지로 이동
	@GetMapping("chat")
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
		
		model.addAttribute("userid", session.getAttribute("member_id"));
		
		
		return "chatting/chat";
	}
}
