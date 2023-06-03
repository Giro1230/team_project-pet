package com.sajura.team_project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
	
	private int product_no;
	private String product_name;
	private int product_price;
	private String product_content;
	private int product_tagval;
	private String product_img;
	private int product_quantity;
}
