package com.itwillbs.zero.vo;

import lombok.Data;

@Data
public class ZpayVO {
	private int zpay_idx;
	private String zpay_bank_name;
	private String zpay_bank_account;
	private String member_id;
	private int zpay_iscertification;

	private int zpay_balance;
}
