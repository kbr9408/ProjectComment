package comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import comment.dao.CommentDAO;
import comment.vo.CommentVO;

@Service("commentService")
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentDAO commentDao;
	
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
