package com.itwillbs.zero.controller;

import java.io.*;
import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

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
		logger.info("*** 넘어온 파라미터들 : " + map.toString());
		
		// 받아온 채팅내용(chat_content), 채팅방번호(chat_room_idx), 메세지보낸사람(member_id) 정보 넣기
		// 파라미터 : map		리턴타입 : boolean(isInsert)
		boolean isInsert = service.insertChat(map);
		logger.info("*** 채팅내역 INSERT : " + isInsert);
		
	}
	
	// 사진 보낼 때
//    @RequestMapping(value = "/sendPhoto",
//    				method = RequestMethod.POST,
//    				produces = "text/plain; charset=utf-8")
//    @ResponseBody
//    public String sendPhoto(MultipartFile file,
//    						HttpServletRequest request){
//
//    	String result = "";
//    	
//    	//파일 저장될 경로 가져오기 (HttpServletRequest 필요함)
//		String saveDirectory = request.getServletContext() //context-path (webapp)
//									  .getRealPath("/resources/upload/chat");
//
//
//
//		String fileName = file.getOriginalFilename();
//		logger.debug("fileName = {}", fileName);
//
//		//파일명 생성
//		String renamedFileName = Utils.getRenamedFileName(fileName);
//		
//		//메모리의 파일 -> 서버경로상의 파일로 이동
//		File newFile = new File(saveDirectory, renamedFileName);
//		try {
//			file.transferTo(newFile);
//		} catch (IllegalStateException | IOException e) {
//			e.printStackTrace();
//		}			
//		
//		result = fileName + "/" + renamedFileName ;
//
//    	return result;
//    }       
	
	
	// 중고상품에서 채팅하기 클릭 시 채팅방으로 이동
	// 상품페이지에서 secondhand_idx, seller_id를 받아오고 세션에서 buyer_id를 받아와서
	// DB - CHAT_ROOM에 일치하는 값이 
	//		없으면 생성을 (INSERT INTO CHAT_ROOM - 파라미터 세개)
	// 		있으면 값을 가져와서 "chatRoom"로 연결
//	@RequestMapping(value = "doChat", method = RequestMethod.GET)
//	public String doChat(@RequestParam Map<String, String> map, HttpSession session, Model model) {
//		
//		// 로그인 해야 들어갈 수 있음!
//		String member_id = (String) session.getAttribute("member_id");
//		if(member_id == null) {
//			model.addAttribute("msg", "로그인이 필요한 작업입니다!");
//			return "fail_back";
//		}
//		// 판매자 아이디 받아오기
//		String buyer_id = member_id;
//		
//		// 채팅방 찾기
//		int chat_room_idx = service.selectChatRoomList(map, buyer_id);
//		logger.info("채팅방 번호 : " + chat_room_idx);
//		
//		// 채팅방 유무 판별
//		if(chat_room_idx == 0) {
//			// 채팅방이 없으면
//			// => 채팅방 생성하기
//			int insertChatRoom = service.insertChatRoom(map, buyer_id);
//			chat_room_idx = ??;
//		}
//	
//		// 채팅방이 있으면
//		// => 채팅방으로 이동(채팅방 번호 : chat_room_idx)
//	
//		// 채팅방 번호 들고오기
//		return "chatRoom?chat_room_idx=" + chat_room_idx;
//		
//	}
	
	
}
