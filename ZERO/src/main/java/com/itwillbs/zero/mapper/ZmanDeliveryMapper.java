package com.itwillbs.zero.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.zero.vo.ZmanDeliveryVO;

@Mapper
public interface ZmanDeliveryMapper {

	// 배달 예정 목록 조회
	ZmanDeliveryVO selectDeliveryYetList();

}
