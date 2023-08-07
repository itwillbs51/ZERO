package com.itwillbs.zero.scheduler;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.itwillbs.zero.service.AuctionService2;

@Component
public class AuctionScheduler {
	@Autowired
	private AuctionService2 service;
	//초 분 시 일 월 요일 연도(생략가능)
	@Scheduled(cron="0 0 0 * * *")
	public void autoUpdate() {
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			
		String now=dateTime.format(formatter).toString();
		
		service.registEnd(now);
		
		List<HashMap<String, String>> winnerList=service.getWinner(now);
		
		for(HashMap<String, String> winner : winnerList) {
			service.registWinner(winner);
		}
		
		
	}
		
	

}
