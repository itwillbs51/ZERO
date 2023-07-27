package com.itwillbs.zero.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.zero.mapper.CsMapper;
import com.itwillbs.zero.vo.CsVO;

@Service
public class CsService {

	@Autowired
	private CsMapper mapper;
	
	// 1:1 문의글 등록하기 (csQnaFormPro)
	public int registCsQnaform(CsVO cs) {
		return mapper.insertCsQna(cs);
	}

}
