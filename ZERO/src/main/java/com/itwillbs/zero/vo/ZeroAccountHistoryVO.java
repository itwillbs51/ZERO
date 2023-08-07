package com.itwillbs.zero.vo;

import lombok.Data;

@Data
public class ZeroAccountHistoryVO {
	private int zero_account_history_idx;
	private String member_id;
	private int zpay_history_idx;
	private long zero_account_balance;
	private long zero_account_amount;
	private int order_secondhand_idx;
	private int order_auction_idx;
}
