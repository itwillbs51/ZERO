package com.itwillbs.zero.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ZpayHistoryVO {
	private int zpay_history_idx;
	private int zpay_idx;
	private int zpay_amount;
	private Timestamp zpay_time;
	private int zpay_balance;
	private String member_id;
	private String zpay_deal_type;
	private int order_auction_idx;
	private int order_secondhand_idx;
}