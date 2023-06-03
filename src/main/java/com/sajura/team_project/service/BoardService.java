package com.sajura.team_project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sajura.team_project.mapper.BoardMapper;
import com.sajura.team_project.vo.BoardVO;

@Service
public class BoardService {
	BoardMapper mapper;

	@Autowired
	public BoardService(BoardMapper mapper) {
		this.mapper = mapper;
	}

	public int boardinsert(BoardVO vo) {
		return mapper.boardinsert(vo);
		
	}
	
	public ArrayList<BoardVO> boardlist() {
		ArrayList<BoardVO> list = new ArrayList<>();
		 return list=mapper.boardlist();
	}
	

	public BoardVO detailboard(@RequestParam("board_no") int board_no) {
		BoardVO vo = new BoardVO();
		return vo=mapper.detailboard(board_no);
	}
	
	public int boardupdate(BoardVO vo) {
		System.out.println(vo);
		return mapper.boardupdate(vo);
	}
	
	
	public BoardVO Update(@RequestParam("no") String no) {
		BoardVO vo = new BoardVO();
		return vo=mapper.update(no);
	}
	
	
	public int delete(@RequestParam("board_no") int board_no) {
		
		int result =mapper.boarddelete(board_no);
		return result;
	}
	
	
}
