package com.eveadam.blog.dto.board;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	private String board_subject;
	private String password;
	private Date regdate;
}
