package comment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.mapper.CommentMapper;
import comment.vo.CommentVO;

@Repository("commentDao")
public class CommentDAOImpl implements CommentDAO {

	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public void insertComment(CommentVO comment) {
		commentMapper.insertComment(comment);
		System.out.println(comment+"dao");
	}

	@Override
	public void updateComment(CommentVO comment) {
		commentMapper.updateComment(comment);
		
	}

	@Override
	public void deleteComment(int commentNo) {
		commentMapper.deleteComment(commentNo);		
	}

	

	@Override
	public CommentVO selectOne(int commentNo) {
		return commentMapper.selectOne(commentNo);
	}

	@Override
	public CommentVO selectLastOne() {
		return commentMapper.selectLastOne();
	}

	@Override
	public int selectCount(int boardId) {
		return commentMapper.selectCount(boardId);
	}

	@Override
	public List<CommentVO> selectAll() {
		System.out.println("DAOIMPL"+commentMapper.selectAll());
		return commentMapper.selectAll();
	}

	
}
