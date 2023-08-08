package com.itwillbs.zero.vo;

import lombok.Data;

@Data
public class ZmanAccountVO {
	private int zman_idx;
	private String zman_bank_name;
	private String zman_bank_account;
	private String zman_id;

	private String access_token;
	private String fintech_use_num;
	private String bank_code_std;
	private String account_num;
	private String account_num_masked;
	private String account_holder_name;
}
