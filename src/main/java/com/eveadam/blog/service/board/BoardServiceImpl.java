package com.eveadam.blog.service.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

import com.eveadam.blog.dto.article.ArticleDTO;
import com.eveadam.blog.dto.board.BoardDTO;
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
		try {
			return boardMapper.getBoardList();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return boardMapper.getBoardList();
	}

	@Override
	public void insertBoard(BoardDTO boardDTO) throws Exception {
		boardMapper.insertBoard(boardDTO);
	}


	@Override
	@Transactional
	public void deleteBoard(BoardDTO boardDTO) throws Exception {
		try {
			//외래키 의존성을 고려해서 
			// board 삭제를 위해선 자식인 article 먼저 삭제
			// article 삭제를 위해선 자식인 article 먼저 삭제
			
			ArticleDTO articleDTO = new ArticleDTO();
			articleDTO.setBoard_subject(boardDTO.getBoard_subject());
			
			log.info("delete replies of article of board");
			articleMapper.delete_reply_Article_transaction(articleDTO);

			log.info("delete articles of board");
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