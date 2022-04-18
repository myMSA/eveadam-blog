package com.eveadam.blog.mapper.article;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.eveadam.blog.dto.ArticleDTO;

public interface ArticleMapper {
	//
	long getArticleCount(@Param("board_subject") String board_subject) throws SQLException;

	List<ArticleDTO> getArticleListPage(@Param("board_subject") String board_subject, @Param("startNum") long startNum, @Param("endNum") long endNum) throws SQLException;
	
	// article click 시 조회수 증가
	void updateReadcount(long no) throws SQLException;
	// article click 시 글 읽기
	ArticleDTO getDetail(long article_id) throws SQLException;
	
	// article Create
	void insertArticle(ArticleDTO articleDTO) throws SQLException;
	
	// article Delete
	int deleteArticle(ArticleDTO articleDTO) throws SQLException;
	
	// article delete along with transaction of deleting board
	void deleteArticle_transaction(ArticleDTO articleDTO) throws SQLException;

	// article Update
	int updateArticle(ArticleDTO articleDTO) throws SQLException;

}