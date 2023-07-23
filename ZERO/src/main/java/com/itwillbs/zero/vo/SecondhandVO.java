package com.itwillbs.zero.vo;

import lombok.*;




@Data
public class SecondhandVO {
	private int secondhand_idx;
	private String secondhand_name;
	private String secondhand_category;
	private int secondhand_price;
	private String secondhand_subject;
	private String secondhand_content;
	private String secondhand_delivery_type;
	private String secondhand_payment_type; //boolean?
	
	
	private String secondhand_image1;
	private String secondhand_image2;
	private String secondhand_image3;
	
	
	private String secondhand_first_date;
	private String secondhand_update_date; //
	private int secondhand_readcount;
	private int secondhand_re_ref;
	private String secondhand_deal_status;
	private String member_idx;
	

}
