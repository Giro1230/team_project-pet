package com.sajura.team_project.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sajura.team_project.service.ReviewService;
import com.sajura.team_project.vo.ReviewVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.sajura.team_project.service.ProductService;
import com.sajura.team_project.vo.ProductVO;
import org.springframework.web.servlet.ModelAndView;

//@Controller
@Controller
@RequestMapping("/product")
public class ProductController {

	ProductService service;
	ReviewService reviewService;

	@Autowired
	public ProductController(ProductService service, ReviewService reviewService) {
		this.service = service;
		this.reviewService = reviewService;
	}

	/////////상품등록///////////////
	@PostMapping("/productReg.do")
	public String productDO(MultipartFile[] uploadFile, HttpServletRequest request, Model model, ProductVO product) {
		String msg = "";

		String uploadFolder = "resources/images";
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath(uploadFolder);
		System.out.println("path: " + path);

		for (MultipartFile mf : uploadFile) {

			System.out.println("-------------------");
			System.out.println("Upload File Name : " + mf.getOriginalFilename());
			System.out.println("Upload File Size : " + mf.getSize());
			File savaFile = new File(path, mf.getOriginalFilename());

			try {
				mf.transferTo(savaFile);
			} catch (IllegalStateException e) {
				System.out.println(e.getMessage());
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
			product.setProduct_img(mf.getOriginalFilename());
			model.addAttribute("upload", path);
		}
		int result =  service.productInsert(product);
		/*
		 * if(result == 1) { msg = "1"; }else { msg = "0"; } return msg;
		 */
		return "redirect:/";
	}
	///////////////상품 전체 리스트 /////////////////////
	@GetMapping("productList.do")
	public String getList(HttpServletRequest request, HttpServletResponse response, Model model) {
		ArrayList<ProductVO> list = service.productList();
		model.addAttribute("list", list);

		return "/product/productList";
	}
	////////////////////상품 tagval 리스트 ////////////////////
	@GetMapping("productTagvalList.do")
	public String tagvalList(@RequestParam("tagval") int tagval,Model model) {
		String views = "";
		if(tagval == 1) {
			views = "/product/feedSnack";
		}else if(tagval == 2){
			views = "/product/supplement";
		}else if(tagval == 3) {
			views = "/product/toystraining";
		}else if(tagval == 4) {
			views = "/product/house";
		}else if(tagval == 5) {
			views = "/product/beautybathproducts";
		}else if(tagval == 6) {
			views = "/product/hygiene";
		}
		ArrayList<ProductVO> list = service.productList2(tagval);
		
		model.addAttribute("list", list);
		return views;
	}
	//////////////////////////상품 상세 페이지 ///////////////////
	@GetMapping("/product_detail.do")
	public String product_detail(@RequestParam("product_name") String product_name, Model model) {
		ProductVO product = service.detailList(product_name);

		model.addAttribute("review", reviewService.getProductsSelectList(product.getProduct_no()));
		model.addAttribute("product",product);
		return "/product/product_detail";
	}
}
