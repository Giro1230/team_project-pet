package com.sajura.team_project.service;

import com.sajura.team_project.controller.dto.ReviewInsertReq;
import com.sajura.team_project.controller.dto.ReviewRes;
import com.sajura.team_project.controller.dto.ReviewUpdateReq;
import com.sajura.team_project.mapper.ReviewMapper;
import com.sajura.team_project.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {
    private final ReviewMapper mapper;
    private final ProductService productService;

    @Autowired
    public ReviewService(ReviewMapper mapper, ProductService productService){
        this.mapper = mapper;
        this.productService = productService;
    }

    public int reviewInsert(ReviewInsertReq review){
        productService.findByProduct_name(review.getProduct_name());
        ReviewVO vo = ReviewVO
                .builder()
                .user_no(review.getUser_no())
                .product_no(productService.findByProduct_name(review.getProduct_name()).getProduct_no())
                .review_comment(review.getReview_comment())
                .review_score(review.getReview_score())
                .build();
        return mapper.insertReview(vo);
    }

    public List<ReviewRes> getList(){
        return mapper.getList();
    }

    public List<ReviewRes> getProductsSelectList(int product_no){
        return mapper.getProductsSelectList(product_no);
    }

    public List<ReviewRes> findByUser_No(int user_no){
        return mapper.findByUser_No(user_no);
    }

    public ReviewVO findByReview_no(int review_no){
        return mapper.findByReview_no(review_no);
    }

    public int updateReview(ReviewUpdateReq review){
        ReviewVO vo  = mapper.findByReview_no(review.getReview_no());
        System.out.println(vo);
        vo.setReview_comment(review.getReview_comment());
        vo.setReview_score(review.getReview_score());
        System.out.println(vo);

        return mapper.updateReview(vo);
    }

    public int deleteReview(int review_no) {
        return mapper.removeReview(review_no);
    }
}
