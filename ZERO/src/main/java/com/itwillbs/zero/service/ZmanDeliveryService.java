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

	// ZMAN 중고물품 오더 배달 수락하기
	public int acceptDelivery(int zman_delivery_idx, String zman_id) {
		return mapper.updateDelivery(zman_delivery_idx, zman_id);
	}


	// 배달 상세 정보 - 출발지와 배달지 가져오기
	public ZmanDeliveryVO getDeliveryDetail(int zman_delivery_idx) {
		return mapper.selectDeliveryDetail(zman_delivery_idx);
	}


}
