package board.dao;

import board.vo.BoardVO;

public interface BoardDAO {
	
	public void insert(BoardVO board);
	public void update(BoardVO board);
	public void updateReplyCount(int id);
	public void delete(int id);
	public BoardVO selectOne(int id);
	public BoardVO selectAll();
	public BoardVO selectBoardLastOne();
}
