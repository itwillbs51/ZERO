package com.itwillbs.zero.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.zero.vo.ZmanDeliveryVO;

@Mapper
public interface ZmanDeliveryMapper {

	// 배달 예정 목록 조회
	ZmanDeliveryVO selectDeliveryYetList();

	// DB 에 저장된 출발지와 도착지 가져오기 - 파라미터 zman_delivery_idx
	ZmanDeliveryVO selectDeliveryLocation();

	// ZMAN 중고물품 오더 배달 수락하기
	ZmanDeliveryVO updateDelivery(@Param("zman_delivery_idx") int zman_delivery_idx, @Param("zman_id") String zman_id);

}
