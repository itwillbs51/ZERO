package com.itwillbs.zero.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.zero.service.AdminService;
import com.itwillbs.zero.service.CsService;
import com.itwillbs.zero.vo.CsVO;

@Controller
public class CsController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CsService csService;
	
	// CS - 메인페이지로 디스패치
	@GetMapping("cs_main")
	public String csMain() {
		System.out.println("CsController - csMain");
		
		return "cs/cs_main";
	}
	
	// cs_faq 페이지로 디스패치
	@GetMapping("cs_faq")
	public String csFaq() {
		System.out.println("CsController - csFaq");
		
		return "cs/cs_faq";
	}
	// cs_notice 페이지로 디스패치
	@GetMapping("cs_notice")
	public String csNotice(Model model) {
		System.out.println("CsController - csNotice");
		
		List<CsVO> csList = adminService.getCsList();
		System.out.println(csList);
		model.addAttribute("csList", csList);
		
		return "cs/cs_notice";
	}
	
	// 고객센터관리 - cs_notice_view.jsp로 디스패치
	@GetMapping("cs_notice_view")
	public String csNoticeView(@RequestParam int cs_idx, HttpSession session, Model model) {
		System.out.println("CsController - csNoticeView");
		
		CsVO cs = adminService.getCs(cs_idx);
		model.addAttribute("cs", cs);
		
		return "cs/cs_notice_view";
	}
	
	// cs_qna_form 페이지로 디스패치
	@GetMapping("cs_qna_form")
	public String csQnaForm(HttpSession session, Model model) {
		System.out.println("CsController - csQnaForm");
		// 회원만 접근할 수 있도록 설정 - 세션
		
		
		return "cs/cs_qna_form";
	}
	
	// 1:1 문의글 등록하기 (csQnaFormPro)
	@PostMapping("csQnaFormPro")
	public String csQnaFormPro(HttpServletRequest request, HttpSession session, Model model, CsVO cs) {
		System.out.println("CsController - csQnaFormPro");
		
		// ===================== 파일 처리 시작 =====================
		// 프로젝트 상 업로드 폴더의 실제 경로 알아내기(request or session 객체 필요)
			String uploadDir = "/resources/upload"; // 현재 폴더상 경로
			String saveDir = request.getServletContext().getRealPath(uploadDir); // 실제 경로
			System.out.println("csQnaFormPro - 실제업로드경로 : " + saveDir);
			
			String subDir = ""; // 서브 디렉토리 ( 업로드 날짜에 따라 디렉토리 구분하기 )
			
			try {
				// 1. Date 객체 생성
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); // 날짜 형식 포맷 지정 ( / 로 디렉토리 구분 )
				// 실제 업로드 경로에 날짜 경로 결합
				subDir = sdf.format(date); // 날짜 디렉토리
				saveDir += "/" + subDir;
				
				// 실제 경로를 관리하는 객체 리턴받기 
				Path path = Paths.get(saveDir);
				
				// path 객체로 관리하는 경로를 생성
				Files.createDirectories(path);
			} catch (IOException e) {
				System.out.println("1:1 문의 게시판 파일 업로드 : e 이거 오류");
				e.printStackTrace();
			}
			
			// 파라미터로 받은 CsVO cs 에서 전달된 MultipartFile 객체 꺼내기
			MultipartFile mFile = cs.getFile(); // CsVo 객체의 MultipartFile의 변수명 private MultipartFile file;
			System.out.println("csQnaFormPro 원본파일명1 : " + mFile.getOriginalFilename());
			
			// 파일명 중복 방지 처리 - 랜덤 ID (8글자) 붙이기 ( ex. 랜덤ID_파일명.확장자)
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			
			// 파일명이 존재하는 경우에만 파일명 생성(없을 경우를 대비하여 기본 파일명 널스트링으로 처리)
			cs.setCs_file("");
			
			// 파일명을 저장할 변수 선언
			String fileName = uuid.substring(0, 8) + "_" + mFile.getOriginalFilename();
			
			if(!mFile.getOriginalFilename().equals("")) {
				cs.setCs_file(subDir + "/" + fileName);			
			}
			System.out.println("실제 업로드 파일명1 : " + cs.getCs_file());
		// ===================== 파일 처리 끝 =====================
			
		int insertCount = csService.registCsQnaform(cs);
		
		if(insertCount > 0) { // 글쓰기 성공
			try {
				if(!mFile.getOriginalFilename().equals("")) {
					mFile.transferTo(new File(saveDir, fileName));
				}
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			model.addAttribute("msg", "문의 글이 등록되었습니다!");
			return "success_back";
		} else { // 글쓰기 실패 
			model.addAttribute("msg", "문의 글이 등록되지 않았습니다!");

			return "fail_back";
		}
	}
	
}
