package board.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.mapper.BoardMapper;
import board.vo.BoardVO;

@Repository("boardDao")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public void insert(BoardVO board) {
		boardMapper.insert(board);
	}

	@Override
	public void update(BoardVO board) {
		boardMapper.update(board);
	}
	
	@Override
	public void updateReplyCount(int id) {
		boardMapper.updateReplyCount(id);
	}

	@Override
	public void delete(int id) {
		boardMapper.delete(id);
	}

	@Override
	public BoardVO selectOne(int id) {
		// TODO Auto-generated method stub
		return boardMapper.selectOne(id);
	}

	@Override
	public BoardVO selectAll() {
		// TODO Auto-generated method stub
		return boardMapper.selectAll();
	}
	
	@Override
	public BoardVO selectBoardLastOne() {
		return boardMapper.selectBoardLastOne();
	}

}