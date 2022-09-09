package com.eveadam.blog.mapper.member;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eveadam.blog.dto.board.BoardDTO;
import com.eveadam.blog.dto.member.MemberDTO;

public interface MemberMapper {

	void insertMember(MemberDTO memberDTO) throws SQLException;

}