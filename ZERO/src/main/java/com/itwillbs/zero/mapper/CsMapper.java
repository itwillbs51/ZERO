package com.itwillbs.zero.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.zero.vo.CsVO;

@Mapper
public interface CsMapper {

	// 공지사항 - 페이징 계산작업
	// 전체게시물 수 조회 작업 요청
	int selectNoticeListCount();

	// 공지사항 목록 조회
	List<CsVO> selectNoticeList(@Param("startRow") int startRow, @Param("listLimit") int listLimit);

	// 1:1 문의글 등록하기 (csQnaFormPro)
	int insertCsQna(CsVO cs);



}
