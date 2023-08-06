package com.itwillbs.zero.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.zero.mapper.ZmanDeliveryMapper;
import com.itwillbs.zero.vo.ZmanDeliveryVO;

@Service
public class ZmanDeliveryService {
	
	@Autowired
	private ZmanDeliveryMapper mapper;

	// 배달 예정 목록 조회
	public ZmanDeliveryVO getDeliveryYetList() {
		return mapper.selectDeliveryYetList();
	}


}
