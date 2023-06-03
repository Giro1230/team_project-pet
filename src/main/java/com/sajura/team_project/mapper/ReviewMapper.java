package com.sajura.team_project.mapper;

import com.sajura.team_project.controller.dto.ReviewRes;
import com.sajura.team_project.vo.ReviewVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewMapper {
    public int insertReview(ReviewVO review);
    public List<ReviewRes> getList();
    public List<ReviewRes> getProductsSelectList(int product_no);
    public List<ReviewRes> findByUser_No(int user_no);
    public ReviewVO findByReview_no(int review_no);
    public int updateReview(ReviewVO review);
    public int removeReview(int product_no);
}
