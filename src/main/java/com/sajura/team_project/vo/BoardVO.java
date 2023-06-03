package com.sajura.team_project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	private int board_no;
	private String board_writer;
	private String board_regdate;
	private String board_content;
	private String board_title;
	
	
}
