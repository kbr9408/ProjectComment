package board.mapper;

import java.util.List;

import board.vo.BoardVO;

@MyMapper
public interface SearchMapper {
	//게시글 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	public List<BoardVO> listAll(String searchOption, String keyword) throws Exception;
	
	//게시글 레코드 갯수 메서드 추가
	public int countArticle(String searchOption, String keyword) throws Exception;
}
