package search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.BoardDAO;
import board.vo.BoardVO;
import search.dao.SearchDAO;

@Service("searchService")
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchDAO searchDao;
	
	//게시글 전체목록 
	@Override
	public List<BoardVO> listAll(String searchOption, String keyword) throws Exception {
		
		return searchDao.listAll(searchOption, keyword);
	}
	
	//게시글 레코드 갯수
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		return searchDao.countArticle(searchOption, keyword);
	}

}
