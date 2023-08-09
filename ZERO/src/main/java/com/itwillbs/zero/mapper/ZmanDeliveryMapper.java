package com.itwillbs.zero.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.zero.vo.ZmanDeliveryVO;
import com.itwillbs.zero.vo.ZmanVO;

@Mapper
public interface ZmanDeliveryMapper {

	// ZMAN 의 프로필 정보 가져오기
	ZmanVO selectZmanProfile(String zmanId);
	
	// 배달 예정 목록 조회
	ZmanDeliveryVO selectDeliveryYetList();

	// DB 에 저장된 출발지와 도착지 가져오기 - 파라미터 zman_delivery_idx
	ZmanDeliveryVO selectDeliveryLocation();

	// ZMAN 중고물품 오더 배달 수락하기
	int updateDelivery(@Param("zman_delivery_idx") int zman_delivery_idx, @Param("zman_id") String zman_id);

	// 배달 상세 정보 - 출발지와 배달지 가져오기
	ZmanDeliveryVO selectDeliveryDetail(int zman_delivery_idx);



	// ZMAN 중고물품 배달 시작하기
//	int updateDeliveryDetailStart(int zman_delivery_idx);


}
