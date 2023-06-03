package com.sajura.team_project.controller.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewReq {
    private int user_no;
    private int product_no;
    private String review_img;
    private double review_score;
    private String review_comment;
}
