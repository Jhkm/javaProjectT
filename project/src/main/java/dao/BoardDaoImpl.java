package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;
import logic.Reply;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.BoardMapper.";
	@Override
	public int count(String searchType, String searchContent, String category) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchContent", searchContent);
		map.put("b_category", category);
		Integer ret = sqlSession.selectOne(NS+"count", map);
		return ret;
	}

	@Override
	public List<Board> list(String searchType, String searchContent, Integer pageNum, int limit, String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startrow = (pageNum - 1) * limit;
		int b_category = Integer.parseInt(category);
		map.put("searchType", searchType);
		map.put("searchContent", searchContent);
		map.put("startrow", startrow);
		map.put("limit", limit);
		map.put("b_category", b_category);
		return sqlSession.selectList(NS+"list",map);
	}

	@Override
	public Board getBoard(Integer num) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("startrow", 0);
		map.put("limit", 1);
		map.put("num", num);
		return sqlSession.selectOne(NS+"list", map);
	}

	@Override
	public void insert(Board board) {
		sqlSession.getMapper(BoardMapper.class).insert(board);
	}

	@Override
	public void b_readcnt(Integer num) {
		sqlSession.getMapper(BoardMapper.class).b_readcnt(num);
	}
	@Override
	public int maxNum() {
		return sqlSession.getMapper(BoardMapper.class).maxNum();
	}

	@Override
	public void update(Board board) {
		sqlSession.getMapper(BoardMapper.class).update(board);
	}

	@Override
	public void delete(int num) {
		sqlSession.getMapper(BoardMapper.class).delete(num);
	}
	@Override
	public void refstepadd(Board board) {
		sqlSession.getMapper(BoardMapper.class).refstepadd(board);
	}
}
