package com.sajura.team_project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sajura.team_project.mapper.ProductMapper;
import com.sajura.team_project.vo.ProductVO;

@Service
public class ProductService {

	ProductMapper mapper;

	@Autowired
	public ProductService(ProductMapper mapper) {
		this.mapper = mapper;
	}

	public int productInsert(ProductVO product) {
		return  mapper.productInsert(product);
	}
	
	public ArrayList<ProductVO> productList() {
		return mapper.productList();
	}
	
	public ArrayList<ProductVO> productList2(int tagval){
		return mapper.productList2(tagval);
	}
	
	public ProductVO detailList(String product_name) {
		return mapper.detailList(product_name);
	}

	public ProductVO findByProduct_name(String product_name){
		return mapper.findByProduct_name(product_name);
	}

	public ProductVO selectOne(int product_no) {
		return mapper.selectOne(product_no);
	};
	
	//public void update(ProductVO product);
		
	//public void delete(@Param("product_no") int product_no);
}
