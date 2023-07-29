package com.itwillbs.zero.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AuctionProductVO {
	private String auction_title;
	private int category_idx;
	private int auction_start_price;
	private String auction_product_status;
	private int auction_max_price;
	private String auction_content;
	private int brand_idx;
	private String auction_seller_id;
	private String auction_seller_address;
	private String auction_seller_address_detail;
	private String board_file1;
	private String board_file2;
	private String board_file3;
	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;

}
