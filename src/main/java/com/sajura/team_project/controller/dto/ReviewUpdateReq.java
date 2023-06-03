package com.sajura.team_project.controller.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewUpdateReq {
    private int review_no;
    private double review_score;
    private String review_comment;
}
