package logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ShopService {


	int boardcount(String searchType, String searchContent, String category);

	List<Board> boardList(String searchType, String searchContent, Integer pageNum, int limit, String category);

	Board getBoard(Integer num);

	void insert(Board board, HttpServletRequest request);

	void updatereadcnt(Integer num);

	void boardReply(Board board);

	void boardUpdate(Board board, HttpServletRequest request);

	void boardDelete(int num);
	
	void itemCreate(Item item, HttpServletRequest request);

	List<Map<Integer, String>> gameType();

	List<Item> getItemList();

	Item detail(Integer no);

	void update(Item item,HttpServletRequest request);

	void userCreate(User user);

	User getUser(String m_id);
	
	void addItemToCart(Integer no, Integer quantity,String id);

	Cart selectCart(String loginId);

	void cartSubtraction(Integer i_no, String loginId);

	void cartUpdate(Integer no, Integer quantity, String loginId);
	
	
	
}
