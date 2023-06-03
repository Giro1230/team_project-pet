package com.sajura.team_project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.sajura.team_project.service.UserService;
import com.sajura.team_project.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService service;

	// 회원가입
	@PostMapping("/userRegForm.do")
	public	String regMember(UserVO uv) {
		String views = "";
		int result = service.insertUser(uv);
		if(result == 1) {
			views = "/user/user_Regsuccess";
		}else {
			views = "test";
		}
		return views;
	}

	// 아이디체크
	@GetMapping("/idOverCheck")
	public @ResponseBody String idCheck(String id, Model model) {
		String message = "";
		int result = 0;
		result = service.idOverCheck(id);
		if (result == 1) {
			message = "<span style='color:red';>사용불가</span>";
			model.addAttribute("message", message);
		} else {
			message = "<span style='color:green';>사용가능</span>";
			model.addAttribute("message", message);
		}
		return message;
	}

	// 로그인
	@PostMapping("/login.do")
	public @ResponseBody String loginCheck(String id, String pw, HttpServletRequest request) {
		int result = service.login(id, pw);
		HttpSession session = request.getSession();
		if (result == 1) {
			UserVO user = service.userSelect(id);
			session.setAttribute("user", user);
			return "1";
		} else {
			return "0";
		}
	}
	// 로그아웃
	@GetMapping("/userLogout.do")
	public String logout(HttpSession session) {	
		session.invalidate();
		return "main";
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

	// 비밀번호 변경
	@PostMapping("/changePw.do")
	public @ResponseBody String changePw(UserVO vo, @RequestParam("user_cpw") String user_cpw) {
		return service.pwchange(vo, user_cpw);
	}

	// 전화번호 변경
	@PostMapping("/telchange.do")
	public @ResponseBody String telchange(UserVO vo, @RequestParam("id") String id) {
		return service.telchange(vo, id);
	}

	// 주소 변경
	@PostMapping("address.do")
	public @ResponseBody String address(UserVO vo, @RequestParam("id") String id) {
		return service.addresschange(vo, id);
	}

	@PostMapping("userdelete.do")
	public @ResponseBody int userdelete(@RequestParam("id") String id,HttpServletRequest request) {
		int result = service.userdelete(id);
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return result;
	}

}
