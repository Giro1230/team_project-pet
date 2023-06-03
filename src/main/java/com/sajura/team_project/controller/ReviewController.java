package com.sajura.team_project.controller;

import com.sajura.team_project.controller.dto.ReviewInsertReq;
import com.sajura.team_project.controller.dto.ReviewRes;
import com.sajura.team_project.controller.dto.ReviewUpdateReq;
import com.sajura.team_project.service.ReviewService;
import com.sajura.team_project.service.UserService;
import com.sajura.team_project.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/review")
public class ReviewController {
    private final ReviewService service;
    private final UserService userService;

    @Autowired
    public ReviewController(ReviewService service, UserService userService){
        this.service = service;
        this.userService = userService;
    }

    @PostMapping("/insertReview.do")
    public int insertReview(ReviewInsertReq data){
        return service.reviewInsert(data);
    }

    @GetMapping("/getAllList.do")
    public ModelAndView getAllList(){
        ModelAndView mav = new ModelAndView();
        mav.addObject("AllList", service.getList());
        mav.setViewName("/review/review-allList");
        return mav;
    }

    @GetMapping("/getProductSelectList.do")
    public ModelAndView getProductSelectList(String product_no){
        ModelAndView mv = new ModelAndView();
        mv.addObject("list" ,service.getProductsSelectList(Integer.parseInt(product_no)));
        mv.setViewName("redirect:/product/product_detail");

        return mv;
    }

    @GetMapping("/review-findById.do")
    public ModelAndView searchById(@RequestParam("user_no") String user_no){
        ModelAndView mv = new ModelAndView();
        List<ReviewRes> list = service.findByUser_No(Integer.parseInt(user_no));

        if (!list.isEmpty()) {
            mv.addObject("list", list);
            System.out.println(list);
            mv.setViewName("/review/review-list");
        } else if(list.isEmpty()){
            System.out.println(user_no);
        }
        return mv;
    }

    @PostMapping("/update.do")
    public int updateReview(@RequestBody ReviewUpdateReq review){
        System.out.println(review);
        return service.updateReview(review);
    }

    @PostMapping("/delete.do")
    public int deleteReview(int review_no){
        System.out.println(review_no);
        return service.deleteReview(review_no);
    }
}
