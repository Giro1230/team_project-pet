package com.sajura.team_project.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sajura.team_project.vo.BoardVO;
import com.sajura.team_project.vo.ProductVO;
import com.sajura.team_project.vo.UserVO;

@Mapper
public interface AdminMapper {
	
	
	////////////////////// 게시판
	public int boardinsert(BoardVO vo);

	public ArrayList<BoardVO> boardlist();

	public BoardVO detailboard(@Param("board_title") String board_title);

	public int boardupdate(@Param("board") BoardVO vo);

	public BoardVO update(@Param("board_no") String board_no);

	public int boarddelete(@Param("board_no") int board_no);

	/////////////////////// 상품
	public int productInsert(ProductVO product);

	public ArrayList<ProductVO> productList();

	public ArrayList<ProductVO> productList2(@Param("tagval") int tagval);

	////////////////////// 유저
	
	public ArrayList<UserVO> userList();

	// 비밀번호변경
	public int pwchange(@Param("vo") UserVO vo, @Param("user_cpw") String user_cpw);

	// 주소변경
	public int addresschange(@Param("vo") UserVO vo, @Param("id") String id);

	// 전화번호변경
	public int telchange(@Param("user_tel") String user_tel, @Param("id") String id);

	// 탈퇴
	public int userdelete(@Param("id") String id);

		public int insertUser(UserVO uv);
		//한 유저 정보 체크
		public UserVO userCheck(@Param("user_id") String user_id);
		//로그인
		public int login(@Param("id") String id, @Param("pw") String pw);
		//회원정보
		public UserVO userSelect(@Param("id") String id);
		//아이디찾기
		public String idCheck(@Param("user_name") String name, @Param("user_tel") String tel);
		//비밀번호찾기
		public String pwCheck(@Param("user_id") String id, @Param("user_tel") String tel);

}
