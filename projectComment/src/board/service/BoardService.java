package board.service;

import java.util.List;

import board.vo.BoardVO;
import comment.vo.CommentVO;

public interface BoardService {
	
	public void createBoard(BoardVO board);
	public void createComment(CommentVO comment);
	public void deleteComment(CommentVO comment);
	public void updateComment(CommentVO comment);
	public List<CommentVO> commentList(CommentVO comment);


}
