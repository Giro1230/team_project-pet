package com.sajura.team_project.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sajura.team_project.vo.ProductVO;

@Mapper
public interface ProductMapper {
	
	public int productInsert(ProductVO product);
	
	public ArrayList<ProductVO> productList();
	
	public ArrayList<ProductVO> productList2(@Param("tagval") int tagval);
	
	public ProductVO detailList(@Param("product_name") String product_name);

	//public void update(ProductVO product);

	
	public ProductVO selectOne(int product_no);

	public ProductVO findByProduct_name(String product_name);
	
	
//	public void delete(@Param("product_no") int product_no);

}
