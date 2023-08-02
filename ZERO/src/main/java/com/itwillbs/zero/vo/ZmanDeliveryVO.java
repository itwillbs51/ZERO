package com.itwillbs.zero.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ZmanDeliveryVO {

	private int zman_delivery_idx;
	private String zman_delivery_startspot;
	private String zman_delivery_endspot;
	private Timestamp zman_delivery_starttime;
	private Timestamp zman_delivery_endtime;
	private int zman_delivery_commission;
	private String zman_delivery_status;

	//	private DECIMAL(3, 2) zman_delivery_distance;
	
	// FK
	private String zman_idx;
	private int order_secondhand_idx;
	private String seller_id;
	private String buyer_id;
}
