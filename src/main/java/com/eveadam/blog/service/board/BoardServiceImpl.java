package com.eveadam.blog.service.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

import com.eveadam.blog.dto.ArticleDTO;
import com.eveadam.blog.dto.BoardDTO;
import com.eveadam.blog.mapper.article.ArticleMapper;
import com.eveadam.blog.mapper.board.BoardMapper;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {
	// board 삭제 시 하위 글도 같이 삭제하는 트랜잭션을 위한 articleMapper
	@Setter(onMethod_ = { @Autowired })
	private ArticleMapper articleMapper;
	
	@Setter(onMethod_ = { @Autowired })
	private BoardMapper boardMapper;
	
	@Value("${pageSize}")
	private int pageSize;


	public BoardServiceImpl(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}
	
	@Override
	public ArrayList<BoardDTO> getBoardList() throws Exception {
		return boardMapper.getBoardList();
	}

	@Override
	public void insertBoard(BoardDTO boardDTO) throws Exception {
		boardMapper.insertBoard(boardDTO);
	}

	// board 삭제 시, 하위 글 동시 삭제를 위한 트랜잭션
	// 외래키 의존성을 고려하여 자식부터 삭제
	@Override
	@Transactional
	public void deleteBoard(BoardDTO boardDTO) throws Exception {
		try {
			//외래키 의존성을 고려해서 자식인 article부터 삭제
			ArticleDTO articleDTO = new ArticleDTO();
			articleDTO.setBoard_subject(boardDTO.getBoard_subject());
			log.info("check input of deleteboard on Boardservice "+articleDTO);
			
			articleMapper.deleteArticle_transaction(articleDTO);

			// board 삭제
			boardMapper.deleteBoard(boardDTO);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

	}

}