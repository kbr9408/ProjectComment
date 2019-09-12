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
	public void createBoard(BoardVO board) {
		boardDao.insert(board);
		
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
}
