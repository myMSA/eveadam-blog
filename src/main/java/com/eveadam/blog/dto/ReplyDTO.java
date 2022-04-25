package com.eveadam.blog.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	private long reply_id;
	private long article_id;
	private String name;
	private String content;
	private Date regdate;
	private int answerYN;
;
}
