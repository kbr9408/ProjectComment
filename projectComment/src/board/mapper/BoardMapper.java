package board.mapper;

import board.vo.BoardVO;


@MyMapper
public interface BoardMapper {
	public void insert(BoardVO board);
	public void update(BoardVO board);
	public void updateReplyCount(int id);
	public void delete(int id);
	public BoardVO selectOne(int id);
	public BoardVO selectAll();
	public BoardVO selectBoardLastOne();
	
}