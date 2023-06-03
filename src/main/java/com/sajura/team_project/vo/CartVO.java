package com.sajura.team_project.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cart_no;
	private String product_name;
	private String user_id;
	private int product_price;
	private int cart_quantity;
	private int product_tagval;
	private String product_img;
}
