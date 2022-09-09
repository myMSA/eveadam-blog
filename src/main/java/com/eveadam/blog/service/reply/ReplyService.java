package com.eveadam.blog.service.reply;

import java.util.List;

import com.eveadam.blog.dto.reply.ReplyDTO;

public interface ReplyService {
	
	List<ReplyDTO> getReplyList(long article_id) throws Exception;
	
	void insertReply(ReplyDTO replyDTO) throws Exception;

	void deleteReply(ReplyDTO replyDTO) throws Exception;

	void deleteReply_transaction(ReplyDTO replyDTO) throws Exception;

	void selectReply(ReplyDTO replyDTO) throws Exception;

}