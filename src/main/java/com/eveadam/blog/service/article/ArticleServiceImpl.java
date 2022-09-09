package com.eveadam.blog.service.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

import com.eveadam.blog.dto.article.ArticleDTO;
import com.eveadam.blog.dto.board.BoardDTO;
import com.eveadam.blog.dto.reply.ReplyDTO;
import com.eveadam.blog.mapper.article.ArticleMapper;
import com.eveadam.blog.mapper.reply.ReplyMapper;

@Log4j
@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ReplyMapper replyMapper;
	
	@Autowired
	private ArticleMapper articleMapper;

	@Value("${pageSize}")
	private int pageSize;

	@Override
	public long getArticleCount(String board_subject) throws Exception {
		return articleMapper.getArticleCount(board_subject);
	}
	
	@Override
	public List<ArticleDTO> getArticleListPage(String board_subject, long pg) throws Exception {
		long startNum = (pg - 1) * pageSize + 1;
		long endNum   = pg * pageSize;
	
		return articleMapper.getArticleListPage(board_subject, startNum, endNum);
	}

	@Override
	public ArticleDTO getDetail(long article_id) throws Exception {
		if (article_id == -1) {
			throw new RuntimeException("잘못된 접근입니다.");
		}
		articleMapper.updateReadcount(article_id);
		ArticleDTO articleDTO = articleMapper.getDetail(article_id);
		if (articleDTO == null) {
			throw new RuntimeException(article_id + "번 글이 존재하지 않습니다.");
		}
		return articleDTO;
	}
	
	// insert article
	@Override
	public void insertArticle(ArticleDTO ArticleDTO) throws Exception {
		articleMapper.insertArticle(ArticleDTO);
	}
	
	// delete article
	@Override
	@Transactional
	public void deleteArticle(ArticleDTO articleDTO) throws Exception {
		
		try {
			//외래키 의존성을 고려해서 자식인 reply부터 삭제
			ReplyDTO replyDTO = new ReplyDTO();
			replyDTO.setArticle_id(articleDTO.getArticle_id());
			
			replyMapper.deleteReply_transaction(replyDTO);

			// article 삭제
			articleMapper.deleteArticle(articleDTO);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	}

	// update article
	@Override
	public void updateArticle(ArticleDTO articleDTO) throws Exception {
		if(articleMapper.updateArticle(articleDTO) == 0) {
			throw new RuntimeException(
				"해당하는 게시물이 없거나 비밀번호가 틀립니다.");
		}
	}

}