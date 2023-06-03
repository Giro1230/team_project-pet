package com.sajura.team_project.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.sajura.team_project.mapper.AdminMapper;
import com.sajura.team_project.vo.BoardVO;
import com.sajura.team_project.vo.ProductVO;
import com.sajura.team_project.vo.UserVO;

@Service
public class AdminService {
	AdminMapper mapper;

	@Autowired
	public AdminService(AdminMapper mapper) {
		this.mapper = mapper;
	}

	public int boardinsert(BoardVO vo) {
		return mapper.boardinsert(vo);

	}

	public ArrayList<BoardVO> boardlist() {
		ArrayList<BoardVO> list = new ArrayList<>();
		return list = mapper.boardlist();
	}

	public BoardVO detailboard(@RequestParam("board_title") String board_title) {
		BoardVO vo = new BoardVO();
		return vo = mapper.detailboard(board_title);
	}

	public int boardupdate(BoardVO vo) {
		System.out.println(vo);
		return mapper.boardupdate(vo);
	}

	public BoardVO Update(@RequestParam("no") String no) {
		BoardVO vo = new BoardVO();
		return vo = mapper.update(no);
	}

	public int delete(@RequestParam("board_no") int board_no) {

		int result = mapper.boarddelete(board_no);
		return result;
	}

	///////////////// 유저

	public ArrayList<UserVO> userList() {
		ArrayList<UserVO> list = new ArrayList<UserVO>();
		return list = mapper.userList();
	}

	public int insertUser(UserVO uv) {
		uv.setUser_email(uv.getUser_email() + "@" + uv.getUser_email2());
		uv.setUser_tel(uv.getUser_tel() + "-" + uv.getUser_tel2() + "-" + uv.getUser_tel3());
		mapper.insertUser(uv);
		return 1;
	}

	public UserVO userCheck(String user_id) {
		UserVO vo = new UserVO();
		vo = mapper.userCheck(user_id);

		return vo;
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

	public String pwchange(UserVO vo, String user_cpw) {
		int result = mapper.pwchange(vo, user_cpw);
		String msg = "";
		if (result == 1) {
			msg = "변경완료";
		} else {
			msg = "틀린 비밀번호입니다";
		}
		return msg;
	}

	public String telchange(UserVO vo, String id) {
		String msg = "";
		String user_tel = vo.getUser_tel() + "-" + vo.getUser_tel2() + "-" + vo.getUser_tel3();

		int result = mapper.telchange(user_tel, id);
		if (result == 1) {
			msg = "변경완료";
		} else {
			msg = "변경 실패";
		}

		return msg;
	}

	public String addresschange(@Param("vo") UserVO vo, @Param("id") String id) {
		int result = mapper.addresschange(vo, id);

		if (result == 1) {
			return "변경완료";
		} else {
			return "변경 실패";
		}
	}

	public int userdelete(@Param("id") String id) {
		return mapper.userdelete(id);
	}

	//////////////////////////////////// 상품

	public int productInsert(ProductVO product) {
		return mapper.productInsert(product);
	}

	public ArrayList<ProductVO> productList() {
		return mapper.productList();
	}

	public ArrayList<ProductVO> productList2(int tagval) {
		return mapper.productList2(tagval);
	}

}
