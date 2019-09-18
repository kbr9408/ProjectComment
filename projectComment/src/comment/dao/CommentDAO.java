package comment.dao;

import java.util.List;

import comment.vo.CommentVO;

public interface CommentDAO {
	public void insertComment(CommentVO comment);
	public void updateComment(CommentVO comment);
	public void deleteComment(int commentNo);
	public List<CommentVO> selectAll();
	public CommentVO selectOne(int commentNo);
	public CommentVO selectLastOne();
	public int selectCount(int boardId);
}