package search.service;

import java.util.List;

import board.vo.BoardVO;

public interface SearchService {
	
	//게시글 전체 목록
	public List<BoardVO> listAll(String searchOption, String keyword) throws Exception;
	
	//게시글 레코드 갯수 메서드
	public int countArticle(String searchOption, String keyword) throws Exception;

}
