package com.itwillbs.zero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.zero.mapper.AdminMapper;
import com.itwillbs.zero.vo.CsVO;
import com.itwillbs.zero.vo.MemberVO;
import com.itwillbs.zero.vo.ReportVO;
import com.itwillbs.zero.vo.ZmanVO;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;

	// 회원관리 - 회원 목록 조회
	public List<MemberVO> getMemebrList() {
		return mapper.selectMemberList();
	}

	// 회원관리 - 회원 정보 조회
	public MemberVO getMember(int member_idx) {
		return mapper.selectMember(member_idx);
	}
	
	// 회원관리 - 회원 피신고 건수 조회
	public int getMemberReportCount(String member_id) {
		return mapper.selectMemberReportCount(member_id);
	}
	
	// 회원관리 - 회원 정보 삭제
	public int removeMember(int member_idx) {
		return mapper.deleteMemebr(member_idx);
	}
	
	// 회원관리 - 회원 정보 수정
	public int modifyMember(MemberVO member) {
		return mapper.updateMember(member);
	}
	
	// 회원관리 - 회원 신고 목록 조회
	public List<ReportVO> getMemberReportList(String reported_member_id) {
		return mapper.selectMemberReportList(reported_member_id);
	}
	
	// 회원관리 - 회원 신고 정보 조회
	public ReportVO getMemberReportDetail(int report_idx) {
		return mapper.selectMemberReportDetail(report_idx);
	}
	
	// 회원관리 - 회원 신고 정보 수정(처리상태 변경)
	public int modifyReport(ReportVO report) {
		return mapper.updateMemberReport(report);
	}
	
	// zman 관리 - zmna 목록 조회
	public List<ZmanVO> getZmanList() {
		return mapper.selectZmanList();
	}

	// zman 관리 - zmna 정보 조회
	public ZmanVO getZman(int zman_idx) {
		return mapper.selectZman(zman_idx);
	}
	
	// zman관리 - zman 정보 삭제
	public int removeZman(int zman_idx) {
		return mapper.deleteZamn(zman_idx);
	}
	
	// zman관리 - zman 정보 수정
	public int modifyZman(ZmanVO zman) {
		return mapper.updateZman(zman);
	}

	// 고객센터관리 - 공지사항 목록 조회
	public List<CsVO> getCsList() {
		return mapper.selectCsList();
	}
	
	// 고객센터관리 - 공지사항 '관리자'인지 확인
	public boolean isAdmin(String member_id) {
		
		if(mapper.selectAdminMember(member_id).equals("관리자")) {
			return true;
		} else {
			return false;			
		}
		
	}
	
	// 고객센터관리 - 공지사항 글쓰기
	public int registNotice(CsVO cs) {
		return mapper.insertNotice(cs);
	}
	
	// 고객센터관리 - 글 정보 조회
	public CsVO getCs(int cs_idx) {
		return mapper.selectCs(cs_idx);
	}

	// 고객센터관리 - 공지사항 글수정
	public int updateNotice(CsVO cs) {
		return mapper.updateNotice(cs);
	}
	
	// 고객센터관리 - 공지사항 글삭제
	public int removeNotice(int cs_idx) {
		return mapper.deleteNotice(cs_idx);
	}

	// 고객센터관리 - 1:1 문의 게시판 조회하기
	public List<CsVO> getCsQnAList() {
		return mapper.selectCsQnAList();
	}

	// 고객센터관리 - 1:1 문의 게시판 상세 페이지로 이동하기
	public CsVO getCsQnADetail(int cs_idx, int cs_info_idx) {
		return mapper.selectCsQnADetail(cs_idx, cs_info_idx);
	}

	

	

	

	

	

	

	

		
	
}
