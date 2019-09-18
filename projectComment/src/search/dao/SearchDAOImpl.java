package search.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.mapper.BoardMapper;
import board.mapper.SearchMapper;
import board.vo.BoardVO;

@Repository("searchDao")
public class SearchDAOImpl implements SearchDAO{
	@Autowired
	private SearchMapper searchMapper; 
	
	@Override
	public List<BoardVO> listAll(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return searchMapper.listAll(searchOption, keyword);
	}

	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return searchMapper.countArticle(searchOption, keyword);
	}

}
