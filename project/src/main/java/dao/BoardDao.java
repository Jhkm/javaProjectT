package dao;

import java.util.List;
import java.util.Map;

import logic.Board;

public interface BoardDao {

	int count(String searchType, String searchContent, String category);

	List<Board> list(String searchType, String searchContent, Integer pageNum, int limit, String category);

	Board getBoard(Integer b_no);

	void b_readcnt(Integer b_no);

	int maxNum();

	void update(Board board);

	void delete(int num);

	void insert(Board board);

	void refstepadd(Board board);

	List<Board> getItemCommentList(Integer no, int i);

	double avgGrade(Integer no, int i);

	List<Board> review();

	void insert2(Board board);

}
