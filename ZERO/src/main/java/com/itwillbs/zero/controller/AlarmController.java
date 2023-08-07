package com.itwillbs.zero.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

// 알람 관련 기능들
@Controller
public class AlarmController {
	
	@RequestMapping(value = "shortAlarmList", method = {RequestMethod.GET, RequestMethod.POST})
	public String shortAlarmList() {
		
//		return "alarm/alarm_list";
		return "alarm/alarm_list_sse";
	}
	
	
}
