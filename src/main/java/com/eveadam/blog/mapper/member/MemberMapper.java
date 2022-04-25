package com.eveadam.blog.mapper.member;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eveadam.blog.dto.BoardDTO;
import com.eveadam.blog.dto.MemberDTO;

public interface MemberMapper {

	void insertMember(MemberDTO memberDTO) throws SQLException;

}