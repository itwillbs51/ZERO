package com.itwillbs.zero.vo;

import lombok.Data;

@Data
public class OrderSecondhandVO {
	private int order_secondhand_idx;
	private long order_secondhand_price;
	private String order_secondhand_iszpay;
	private String order_secondhand_buyer;
	private String order_secondhand_seller;
	private int secondhand_idx;
	private String order_secondhand_status;
}
