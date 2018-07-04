package dao;

import java.util.List;
import java.util.Map;

import logic.Board;
import logic.Reply;

public interface BoardDao {

	int count(String searchType, String searchContent, String category);

	List<Board> list(String searchType, String searchContent, Integer pageNum, int limit, String category);

	Board getBoard(Integer b_no);

	void insert(Reply reply);

	void b_readcnt(Integer b_no);

	int maxNum();

	void refstepadd(Reply reply);

	void update(Board board);

	void delete(int num);

	void insert(Board board);

	void refstepadd(Board board);

}
