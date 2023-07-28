package com.itwillbs.zero.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.zero.vo.CsVO;
import com.itwillbs.zero.vo.MemberVO;
import com.itwillbs.zero.vo.ReportVO;
import com.itwillbs.zero.vo.ZmanVO;

@Mapper
public interface AdminMapper {

	// 회원 목록 조회
	List<MemberVO> selectMemberList();

	// 회원 정보 조회
	MemberVO selectMember(int member_idx);
	
	// 회원관리 - 회원 정보 삭제
	int deleteMemebr(int member_idx);
	
	// 회원관리 - 회원 정보 수정
	int updateMember(MemberVO member);

	// 회원관리 - 회원 신고 목록 조회
	List<ReportVO> selectMemberReportList(String reported_member_id);

	// 회원관리 - 회원 신고 정보 조회
	ReportVO selectMemberReportDetail(int report_idx);

	// 회원관리 - 회원 피신고 건수 조회
	int selectMemberReportCount(String member_id);

	// 회원관리 - 회원 신고 정보 수정(처리상태 변경)
	int updateMemberReport(ReportVO report);
	
	// zman 관리 - zmna 목록 조회
	List<ZmanVO> selectZmanList();
	
	// zman 관리 - zmna 정보 조회
	ZmanVO selectZman(int zman_idx);
	
	// 고객센터관리 - 공지사항 목록 조회
	List<CsVO> selectCsList();

	// 고객센터관리 - 공지사항 '관리자'인지 확인
	String selectAdminMember(String member_id);

	// 고객센터관리 - 공지사항 글쓰기
	int insertNotice(CsVO cs);
	
	// 고객센터관리 - 공지사항 글 정보 조회
	CsVO selectCs(int cs_idx);

	// 고객센터관리 - 공지사항 글수정
	int updateNotice(CsVO cs);
	
	// 고객센터관리 - 공지사항 글삭제
	int deleteNotice(int cs_idx);

	// 고객센터관리 - 1:1 문의 게시판 조회하기
	List<CsVO> selectCsQnAList();









}
