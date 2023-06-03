package com.sajura.team_project.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sajura.team_project.mapper.UserMapper;
import com.sajura.team_project.vo.UserVO;

@Service
public class UserService {
	@Autowired
	UserMapper mapper;

	public int insertUser(UserVO uv) {
		uv.setUser_email(uv.getUser_email() + "@" + uv.getUser_email2());
		uv.setUser_tel(uv.getUser_tel() + "-" + uv.getUser_tel2() + "-" + uv.getUser_tel3());
		mapper.insertUser(uv);
		return 1;
	}

	public int idOverCheck(String id) {
		int result = mapper.idOverCheck(id);

		return result;
	}

	public int login(String id, String pw) {
		int result = mapper.login(id, pw);
		return result;
	}
	
	public UserVO userSelect(String id) {		
		return mapper.userSelect(id);
	}

	public String idCheck(String name, String tel) {

		String temp = mapper.idCheck(name, tel);

		if (temp != null) {
			return "아이디 :" + temp;

		} else {
			return "없는 회원 정보 입니다";
		}
	}

	public String pwCheck(String id, String tel) {

		String temp = mapper.pwCheck(id, tel);

		if (temp != null) {
			return "비밀번호 :" + temp;

		} else {
			return "없는 회원 정보 입니다";
		}
	}

	public String pwchange(UserVO vo,String user_cpw) {
		int result=mapper.pwchange(vo, user_cpw);
		String msg = "";
 		if (result == 1) {
 			msg = "변경완료";
 		} else {
 			msg = "틀린 비밀번호입니다";
 		}
 		return msg;
	}

	public String telchange(UserVO vo,String id) {
		String msg = "";
		String user_tel = vo.getUser_tel()+"-"+vo.getUser_tel2()+"-"+vo.getUser_tel3();
 		
 		int result = mapper.telchange(user_tel, id);
 		if (result == 1) {
 			msg = "변경완료";
 		} else {
 			msg = "변경 실패";
 		}
 		
 		return msg;
	}
	
	
	public String addresschange(@Param("vo") UserVO vo, @Param("id") String id) {
		  int result=mapper.addresschange(vo, id);
		 
		 if (result == 1) {
	 			return "변경완료";
	 		} else {
	 			return "변경 실패";
	 		}	
	}


	public int userdelete(@Param("id") String id) {
		 int result=mapper.userdelete(id);
		 System.out.println(result);
		 return result;
	}
}
