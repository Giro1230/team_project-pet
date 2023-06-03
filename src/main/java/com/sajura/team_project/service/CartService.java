package com.sajura.team_project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sajura.team_project.controller.dto.CartDTO;
import com.sajura.team_project.mapper.CartMapper;
import com.sajura.team_project.vo.CartVO;
import com.sajura.team_project.vo.PaymentVO;

@Service
public class CartService {
    private CartMapper mapper;

    @Autowired
    public CartService(CartMapper mapper) {
        this.mapper = mapper;
    }

    public int cartinsert(CartVO vo){
        return mapper.cartinsert(vo);
    }
    public ArrayList<CartVO> cartlist(String user_id){
        return mapper.cartlist(user_id);
    }

    public void cartDelete(ArrayList<CartDTO> lists) {
		System.out.println(lists);
		mapper.cartDelete(lists);
	}
}
