package com.eveadam.blog.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

import com.eveadam.blog.dto.MemberDTO;
import com.eveadam.blog.mapper.member.MemberMapper;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void insertMember(MemberDTO memberDTO) throws Exception {
		memberMapper.insertMember(memberDTO);
	}

}