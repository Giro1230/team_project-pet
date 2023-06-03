package com.sajura.team_project.controller.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewInsertReq {
    private int user_no;
    private String product_name;
    private int review_score;
    private String review_comment;
}
