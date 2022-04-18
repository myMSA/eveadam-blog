package com.eveadam.blog.service.board;

import java.util.ArrayList;
import java.util.List;

import com.eveadam.blog.dto.ArticleDTO;
import com.eveadam.blog.dto.BoardDTO;

public interface BoardService {

	ArrayList<BoardDTO> getBoardList() throws Exception;

	void insertBoard(BoardDTO boardDTO) throws Exception;

	void deleteBoard(BoardDTO boardDTO) throws Exception;

}