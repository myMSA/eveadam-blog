package com.eveadam.blog.mapper.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eveadam.blog.dto.BoardDTO;

public interface BoardMapper {

	ArrayList<BoardDTO> getBoardList() throws SQLException;

	void insertBoard(BoardDTO boardDTO) throws SQLException;

	void deleteBoard(BoardDTO boardDTO) throws SQLException;

}