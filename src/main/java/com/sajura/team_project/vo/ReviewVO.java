package com.sajura.team_project.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReviewVO {
    private int review_no;
    private int user_no;
    private int product_no;
    private double review_score;
    private String review_comment;
    private Timestamp review_date;
}
