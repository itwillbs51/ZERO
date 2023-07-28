package com.itwillbs.zero.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AuctionProductVO {
	private String board_file1;
	private String board_file2;
	private String board_file3;
	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;

}
