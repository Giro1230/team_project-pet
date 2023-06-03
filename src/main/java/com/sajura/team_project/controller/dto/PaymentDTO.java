package com.sajura.team_project.controller.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PaymentDTO {
	private String product_name;
	private int product_price;
	private int cart_quantity;
	private int oder_totalPrice;
}
