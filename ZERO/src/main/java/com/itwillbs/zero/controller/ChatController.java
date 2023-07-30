//package com.itwillbs.zero.controller;
//
//import java.util.*;
//
//import javax.servlet.http.*;
//
//import org.slf4j.*;
//import org.springframework.beans.factory.annotation.*;
//import org.springframework.security.core.context.*;
//import org.springframework.security.core.userdetails.*;
//import org.springframework.stereotype.*;
//import org.springframework.ui.*;
//import org.springframework.web.bind.annotation.*;
//
//import com.itwillbs.zero.handler.*;
//import com.itwillbs.zero.vo.*;
//
//import lombok.extern.log4j.*;
//
//@Controller
//@RequestMapping("/chatting")
//public class ChatController {
//	
//	private static final Logger log = LoggerFactory.getLogger(ChatController.class);
//	
//	@Autowired
//	private ChatService service;
//	
//	// 채팅목록?
//	@RequestMapping("/chatListView")
//	public Model chatList(@RequestParam ("userId") String userId,
//			   Model model) {
//		
//		List<ChatRoomVO> list = service.selectChatRoom(userId);
//    	log.debug("list = {}", list);
//    	model.addAttribute("list", list);
//    	
//        return model;
//	}
//	
//	// 메세지를 선택한다고?
//	@PostMapping("/selectChatMsg")
//    @ResponseBody
//    public Map<String, Object> selectChatMsg(@RequestParam("roomCode") int roomCode){
//    	Map<String, Object> map = new HashMap<>();
//    	
////    	List<ChatMessage> list = service.selectChatMsg(roomCode);
//    	log.debug("list = {}", list);
//    	
//    	map.put("list", list);
//    	return map;
//    }
//    
//    @PostMapping("/openChatRoom")
//    @ResponseBody
//    public String openChatRoom(@RequestParam("userId") String userId,
//							   @RequestParam("seller") String seller,
//							   @RequestParam("pCode") int pCode){
//
//    	Map<String, Object> map = new HashMap<>();
//    	map.put("userId", userId);
//    	map.put("seller", seller);
//    	map.put("pCode", pCode);
//    	
//    	//이미 열려있는 채팅방이 있는지 체크
//    	ChatRoom chatRoom = service.selectChatRoom(map);
//    	
//    	if(chatRoom == null) {
//    		//새로운 채팅방 만들기
//    		int result = service.insertChatRoom(map);
//    	}else {
//    		//활성화 여부를 모두 true로 바꾸기 (혹시 나갔을 지도 모르니까)
//    		map.put("roomCode", chatRoom.getRoomCode());
//    		
//    		int enabled = service.enterChatRoom(map);
//    	}
//    	
//    	return "/chat/chatListView?userId=" + userId;
//    }
//
//    @PostMapping("/leaveChatRoom")
//    @ResponseBody
//    public String leaveChatRoom(@RequestParam("roomCode") int roomCode,
//    							@RequestParam("userId") String userId){
//    	
//    	Map<String, Object> map = new HashMap<>();
//    	map.put("userId", userId);
//    	map.put("roomCode", roomCode);
//    	
//    	String url = "/chat/chatListView?userId=" + userId;
//    	try {
//    		int result = service.leaveChatRoom(map);
//    	}catch (Exception e) {
//    		e.printStackTrace();
//    	}
//
//    	return url;
//
//    }    
//    
//    // 사진 보낼 때
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
//		log.debug("fileName = {}", fileName);
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
//    
//	
//}
