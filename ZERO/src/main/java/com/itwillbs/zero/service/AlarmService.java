package com.itwillbs.zero.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.zero.mapper.*;

@Service
public class AlarmService {
	
	@Autowired
	private AlarmMapper mapper;
	
	// 보내는 알람을 DB에 넣기
	public boolean insertAlarm(Map<String, String> map) {
		int insertCount = mapper.insertAlarm(map);
		if(insertCount > 0) {
			return true;
		}
		return false;
	}
	
	// 알림 내용 담아오기
	public List<HashMap<String, Object>> getAlarmList(Map<String, String> map) {
		return mapper.selectAlarmList(map);
	}

	// 세션아이디와 link로 알림 조회 후 상태를 'Y'로 바꾸기
	public boolean changeAlarmStatus(String member_id, String link) {
		return mapper.updateAlarmStatus(member_id, link);
	}
	
	
}
