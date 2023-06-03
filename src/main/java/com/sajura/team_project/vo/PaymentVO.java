package com.sajura.team_project.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentVO {
	private int payment_no;
	private String user_id;
	private String payment_name;
	private int payment_price;
	private int payment_quantity;
	private String payment_date;
	private String payment_state;
}
