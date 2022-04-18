package com.eveadam.blog.service.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import com.eveadam.blog.dto.ArticleDTO;
import com.eveadam.blog.dto.BoardDTO;
import com.eveadam.blog.mapper.article.ArticleMapper;

@Log4j
@Service
public class ArticleServiceImpl implements ArticleService {

	private ArticleMapper articleMapper;

//	@Override
//	public List<BoardsDTO> getBoardList() {
//		// TODO Auto-generated method stub
//		return ArticleMapper.getBoardsListPage();
//	}
	
	@Value("${pageSize}")
	private int pageSize;


	public ArticleServiceImpl(ArticleMapper articleMapper) {
		this.articleMapper = articleMapper;
	}
	
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
	public void deleteArticle(ArticleDTO articleDTO) throws Exception {
		if(articleMapper.deleteArticle(articleDTO) == 0) {
			throw new RuntimeException(
				"해당하는 게시물이 없거나 비밀번호가 틀립니다.");
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