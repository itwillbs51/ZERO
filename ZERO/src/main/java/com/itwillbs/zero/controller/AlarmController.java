package com.itwillbs.zero.controller;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

// 알람 관련 기능들
@Controller
public class AlarmController {
	
	@RequestMapping(value = "shortAlarmList", method = {RequestMethod.GET, RequestMethod.POST})
	public String shortAlarmList(HttpSession session) {
		
		return "alarm/alarm_list";
//		return "alarm/alarm_list_sse";
	}
	
	
}
