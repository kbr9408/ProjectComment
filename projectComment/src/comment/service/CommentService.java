package comment.service;

import java.util.List;

import comment.vo.CommentVO;

public interface CommentService {
	public void createComment(CommentVO comment);
	public void deleteComment(CommentVO comment);
	public void updateComment(CommentVO comment);
	public void selectOneComment(CommentVO comment);
	public List<CommentVO> commentList(CommentVO comment);
}
