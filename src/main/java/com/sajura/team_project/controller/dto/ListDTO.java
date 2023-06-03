package com.sajura.team_project.controller.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ListDTO {
    private int cart_no;
    private int product_no;
    private String product_img;
    private String product_name;
    private String product_tagval;
    private int cart_quantity;
    private Long product_price;
}
