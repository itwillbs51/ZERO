package com.itwillbs.zero.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

@Mapper
public interface AlarmMapper {

	// 보내는 알람을 DB에 넣기
	int insertAlarm(Map<String, String> map);

	// 알림 내용 담아오기
	List<HashMap<String, Object>> selectAlarmList(Map<String, String> map);

	// 세션아이디와 link로 알림 조회 후 상태를 'Y'로 바꾸기
	boolean updateAlarmStatus(@Param("member_id") String member_id, @Param("link") String link);

}
