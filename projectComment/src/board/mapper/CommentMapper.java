package board.mapper;

import java.util.List;

import comment.vo.CommentVO;

@MyMapper
public interface CommentMapper {
	public void insertComment(CommentVO comment);
	public void updateComment(CommentVO comment);
	public void deleteComment(int commentNo);
	public List<CommentVO> selectAll();
	public CommentVO selectOne(int commentNo);
	public CommentVO selectLastOne();
	public int selectCount(int commentNo);

	
}
