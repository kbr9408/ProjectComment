package board.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import board.common.Pagination;
import board.common.Search;
import board.vo.BoardVO;


public interface BoardService {
	public BoardVO createBoard(BoardVO board);
	public void deleteBoard(BoardVO board);
	public BoardVO updateBoard(BoardVO board);
	public BoardVO selectOneBoard(int boardId) throws Exception;
	public List<BoardVO> selectBoardList(Search search);
	public BoardVO read(int boardId) throws Exception;
	
	public int selectBoardListCnt(Search search) throws Exception;
	
	

}
