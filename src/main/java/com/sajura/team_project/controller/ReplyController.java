package com.sajura.team_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sajura.team_project.service.ReplyService;
import com.sajura.team_project.vo.ReplyVO;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	ReplyService service;
	
	@GetMapping("/insert")
	public @ResponseBody int insert(ReplyVO vo) {
		int result=service.insert(vo);
		return result;
	}
	
	@GetMapping("/delete")
	public @ResponseBody int delete(int rno){
		int result=service.delet(rno);
		System.out.println(result);
		return result;
	}
	
	@GetMapping("/update")
	public int update(ReplyVO vo) {
		int result=service.update(vo);
		return result;
	}
	
}
