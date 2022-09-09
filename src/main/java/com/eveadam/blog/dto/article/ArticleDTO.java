package com.eveadam.blog.dto.article;

import java.util.Date;

import lombok.Data;

@Data
public class ArticleDTO {
	private long article_id;
	private String board_subject;
	private String title;
	private String name;
	private String content;
	private Date regdate;
	private int readcount;
	private String password;
}
