package com.sajura.team_project.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.sajura.team_project.vo.PaymentVO;

@Mapper
public interface PaymentMapper {

	public void paymentInsert(ArrayList<PaymentVO> list);
	
	
	public ArrayList<PaymentVO> paymentList(String user_id);
	
	

}
