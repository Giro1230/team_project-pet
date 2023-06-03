package com.sajura.team_project.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sajura.team_project.service.AdminService;
import com.sajura.team_project.service.UserService;
import com.sajura.team_project.vo.BoardVO;
import com.sajura.team_project.vo.ProductVO;
import com.sajura.team_project.vo.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	AdminService service;
	
	UserService servicetwo;

	@Autowired
	public AdminController(AdminService service, UserService servicetwo) {
		this.service = service;
		this.servicetwo = servicetwo;
	}

	//////보드
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
	public String detailboard(HttpSession session,String board_title, Model model) {
			BoardVO vo=service.detailboard(board_title);
			model.addAttribute("vo",vo);
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
	
	//////////유저
	

	// 한유저 검색
	@GetMapping("/admin_Mypage.do")
	public String userCheck(@RequestParam("user_id") String user_id, Model model) {
		 
		
		UserVO tvo = service.userCheck(user_id);
		System.out.println(tvo);
		model.addAttribute("vo",tvo);
		
		return "/admin/admin_Mypage";
	}
	//회원 목록 보기
	@GetMapping("/userList.do")
	public String userList(Model model){
		ArrayList<UserVO> list = new ArrayList<UserVO>();
		list = service.userList();
		
		model.addAttribute("list",list);
		return "/admin/userList";
		
	}


	// 로그인
	@PostMapping("/login.do")
	public @ResponseBody String loginCheck(String id, String pw, HttpServletRequest request) {
		int result = servicetwo.login(id, pw);
		System.out.println(id+pw);
		HttpSession session = request.getSession();
		if (result == 1) {
			UserVO admin = servicetwo.userSelect(id);
			session.setAttribute("admin", admin);
			return "1";
		} else {
			return "0";
		}
	}
	
	
	// 아이디 찾기
	@PostMapping("/searchId.do")
	public @ResponseBody String searchId(@RequestParam("user_name") String name, @RequestParam("user_tel") String tel) {
		return service.idCheck(name, tel);
	}

	// 비밀번호 찾기
	@PostMapping("/searchPw.do")
	public @ResponseBody String searchPw(@RequestParam("user_id") String id, @RequestParam("user_tel") String tel) {
		return service.pwCheck(id, tel);
	}

}
