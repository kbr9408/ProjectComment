package board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import board.dao.BoardDAO;
import board.dao.CommentDAO;
import board.vo.BoardVO;

import comment.vo.CommentVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;
	
	@Autowired
	private CommentDAO commentDao;
	
	@Override
	public BoardVO createBoard(BoardVO board) {
		boardDao.insert(board);
		return boardDao.selectBoardLastOne();
	}

	@Override
	public void deleteBoard(BoardVO board) {
		
		boardDao.delete(board);
	}

	@Override
	public BoardVO updateBoard(BoardVO board) {
		boardDao.update(board);
		BoardVO updatedBoard = boardDao.selectOne(board.getBoardId());
		return updatedBoard;
	}

	@Override
	public List<BoardVO> selectBoardList(){
		return boardDao.selectAll();
	}

	@Override
	public BoardVO selectOneBoard(int boardId) {
		return boardDao.selectOne(boardId);
	}
	

	@Override
	@Transactional
	public void createComment(CommentVO comment) {
		commentDao.insertComment(comment);
		
		System.out.println("service"+comment);
	}


	@Override
	@Transactional
	public void deleteComment(CommentVO comment) {
		commentDao.deleteComment(comment.getCommentNo());
		
	}

	@Override
	@Transactional
	public List<CommentVO> commentList(CommentVO comment) {
		return commentDao.selectAll();
	
	}

	@Override
	@Transactional
	public void updateComment(CommentVO comment) {
		commentDao.updateComment(comment);
		
	}
	
	@Override
	@Transactional
	public void selectOneComment(CommentVO comment ) {
		commentDao.selectOne(comment.getCommentNo());
	}
}
