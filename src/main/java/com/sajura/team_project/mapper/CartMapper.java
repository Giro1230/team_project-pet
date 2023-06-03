package com.sajura.team_project.mapper;

import com.sajura.team_project.controller.dto.CartDTO;
import com.sajura.team_project.vo.CartVO;
import com.sajura.team_project.vo.PaymentVO;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface CartMapper {
	// 장바구니 추가
	int cartinsert(CartVO vo);

	// 장바구니 목록
	ArrayList<CartVO> cartlist(String user_id);

	// 장바구니 삭제
	public void cartDelete(ArrayList<CartDTO> cart_no);
}
