package com.eveadam.blog;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.eveadam.blog.dto.board.BoardDTO;
import com.eveadam.blog.mapper.board.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardMapperTest {

	
	@Setter(onMethod_ = { @Autowired })
	private BoardMapper boardMapper;

	@Test
	public void test() {
		
		try {
			
			//log.info(boardMapper.getBoardList());
			ArrayList<BoardDTO> boardList = boardMapper.getBoardList();
			log.info(boardList);
			for(BoardDTO dto : boardList) {
				log.info(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
