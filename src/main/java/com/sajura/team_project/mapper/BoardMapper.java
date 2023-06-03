package com.sajura.team_project.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sajura.team_project.vo.BoardVO;

@Mapper
public interface BoardMapper {
	
	public int boardinsert(BoardVO vo);
	public ArrayList<BoardVO> boardlist();
	public BoardVO detailboard(@Param("board_no") int board_no);
	public int boardupdate(@Param("board") BoardVO vo);
	public BoardVO update(@Param("board_no") String board_no);
	public int boarddelete(@Param("board_no") int board_no);
}
