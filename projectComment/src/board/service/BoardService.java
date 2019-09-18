package board.service;

import java.util.List;

import board.vo.BoardVO;
import comment.vo.CommentVO;

public interface BoardService {
	
	public BoardVO createBoard(BoardVO board);
	public void deleteBoard(BoardVO board);
	public BoardVO updateBoard(BoardVO board);
	public BoardVO selectOneBoard(int boardId);
	public List<BoardVO> selectBoardList();
	
	


}
