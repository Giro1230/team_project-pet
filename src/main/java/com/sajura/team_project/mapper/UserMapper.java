package com.sajura.team_project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sajura.team_project.vo.UserVO;

@Mapper
public interface UserMapper {
	// 가입
	public int insertUser(UserVO uv);
	//아이디 중복체크
	public int idOverCheck(@Param("id") String id);
	//로그인
	public int login(@Param("id") String id, @Param("pw") String pw);
	//회원정보
	public UserVO userSelect(@Param("id") String id);
	//아이디찾기
	public String idCheck(@Param("user_name") String name, @Param("user_tel") String tel);
	//비밀번호찾기
	public String pwCheck(@Param("user_id") String id, @Param("user_tel") String tel);

	public UserVO findById(String user_id);

	//비밀번호변경
	public int pwchange(@Param("vo") UserVO vo, @Param("user_cpw") String user_cpw);
	//주소변경
	public int addresschange(@Param("vo") UserVO vo, @Param("id") String id);
	//전화번호변경	
	public int telchange(@Param("user_tel") String user_tel, @Param("id") String id);
	//탈퇴
	public int userdelete(@Param("id") String id);
}
