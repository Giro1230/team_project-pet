package com.sajura.team_project.controller.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewRes {
    private int review_no;
    private String user_id;
    private String product_name;
    private String review_img;
    private double review_score;
    private String review_comment;
    private String review_date;
}
