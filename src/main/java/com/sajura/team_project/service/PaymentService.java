package com.sajura.team_project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sajura.team_project.mapper.PaymentMapper;
import com.sajura.team_project.vo.PaymentVO;

@Service
public class PaymentService {
	@Autowired
	private PaymentMapper mapper;
	
	
	public void paymentinsert(ArrayList<PaymentVO> list) {
		System.out.println(list);
		mapper.paymentInsert(list);
	}
	
	public ArrayList<PaymentVO> paymentList(String user_id){
		return mapper.paymentList(user_id);

	}
	

	
}
