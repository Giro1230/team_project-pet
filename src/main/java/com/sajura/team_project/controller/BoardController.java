package com.sajura.team_project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingErrorProcessor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sajura.team_project.service.BoardService;
import com.sajura.team_project.service.ReplyService;
import com.sajura.team_project.vo.BoardVO;
import com.sajura.team_project.vo.ReplyVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService service;
	@Autowired
	ReplyService servicetwo;
	
	@PostMapping("/boardinsert.do")
	public @ResponseBody int boardinsert(@RequestBody BoardVO vo) {
	return service.boardinsert(vo);
	}
	
	@GetMapping("/boardlist.do")
	public String boardlist(Model model){
		ArrayList<BoardVO> list = service.boardlist();

		model.addAttribute("list",list);
		return "/board/boardlist";	
	}
	
	@GetMapping("/detailboard.do")
	public String detailboard(HttpSession session ,@RequestParam("board_no") int board_no, Model model) {
			BoardVO vo=service.detailboard(board_no);
			List<ReplyVO> list=servicetwo.list(board_no);
			model.addAttribute("vo",vo);
			model.addAttribute("list",list);
		return "/board/detailboard";
	}

	@GetMapping("/boardUpdateForm.do")
	public String boardUpdateForm(String board_no , Model model) {
			BoardVO vo=service.Update(board_no);
		model.addAttribute("vo",vo);
		return "/board/boardUpdateForm";
	}
	
	@PostMapping("/boardupdate.do")
	public @ResponseBody int boardupdate(@RequestBody BoardVO vo) {
		
		int result =service.boardupdate(vo);
		return result;
	}
	
	@GetMapping("/boarddelete.do")
	public @ResponseBody int boarddelete(String board_no) {
		System.out.println(board_no);

		return service.delete(Integer.parseInt(board_no));
	}


}
