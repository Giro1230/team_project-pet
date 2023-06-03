package com.sajura.team_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sajura.team_project.mapper.ReplyMapper;
import com.sajura.team_project.vo.ReplyVO;

@Service
public class ReplyService {
	@Autowired
	ReplyMapper mapper;
	
	public int insert(ReplyVO vo) {
		 int result =mapper.insert(vo);
		 return result;
	}
	public List<ReplyVO> list(int board_no){
		List<ReplyVO> list =null;
		list=mapper.list(board_no);
		
		return list;
	}
	
	public int delet(int rno) {
		int result = mapper.delete(rno);
		return result;
	}
	
	public int update(ReplyVO vo) {
		int result = mapper.update(vo);
		return result;
	}
}
