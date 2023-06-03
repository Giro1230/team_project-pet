package com.sajura.team_project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.sajura.team_project.vo.ReplyVO;
@Mapper
public interface ReplyMapper {
	// 댓글 조회
	public List<ReplyVO> list(@RequestParam("board_no") int board_no);

	// 댓글 조회
	public void write(ReplyVO vo);

	// 댓글 수정
	public int update(ReplyVO vo);

	// 댓글 삭제
	public int delete(@Param("rno")int rno);
	// 댓글 등록
	public int insert(ReplyVO vo);
	
}
