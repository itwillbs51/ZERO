package com.itwillbs.zero.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.zero.vo.AuctionManagingVO;
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
	
	// zman관리 - zman 정보 삭제
	int deleteZamn(int zman_idx);
	
	// zman관리 - zman 정보 수정
	int updateZman(ZmanVO zman);
	
	// 경매관리 - 경매예정 상품 목록 조회
	List<AuctionManagingVO> selectAuctionManagingList();
	
	// 경매관리 - 경매예정 상품 정보 조회
	Map<String, String> selectAuctionManaging(int auction_idx);

	// 경매관리 - 경매예정 상품 정보 수정
	int updateAuctionManaging(AuctionManagingVO auctionManaging);
	
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

	// 고객센터관리 - 1:1 문의 게시판 상세 페이지로 이동하기
	CsVO selectCsQnADetail(@Param("cs_idx") int cs_idx, @Param("cs_info_idx") int cs_info_idx);

	// 고객센터 관리 - 1:1 문의 답변 등록하기
	int updateReplyQnA(CsVO cs);

	// 고객센터 관리 - 1:1 문의 답변 수정하기
	int updateReplyModifyQnA(CsVO cs);

	// 고객센터 관리 - 1:1 문의글 삭제하기
	int deleteQnA(int cs_idx);
	
	// 고객센터 관리 - 자주 묻는 질문 게시판 조회하기
	List<CsVO> selectFaQ();
	
	// 고객센터 관리 - 자주 묻는 질문 등록하기
	int insertFaQ(CsVO cs);

	// 고객센터 관리 - 자주 묻는 질문 상세페이지로 이동하기
	CsVO selectFaQDetail(@Param("cs_idx") int cs_idx, @Param("cs_info_idx") int cs_info_idx);

	// 고객센터 관리 - 자주 묻는 질문 수정하기
	int updateFaq(CsVO cs);

	// 고객센터 관리 - 자주 묻는 질문 삭제하기
	int deleteFaq(int cs_idx);




	



	









}
