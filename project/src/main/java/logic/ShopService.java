package logic;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface ShopService {


	int boardcount(String searchType, String searchContent, String category);

	List<Board> boardList(String searchType, String searchContent, Integer pageNum, int limit, String category);

	Board getBoard(Integer num);

	void insert(Board board, HttpServletRequest request, HttpSession session);

	void updatereadcnt(Integer num);

	void boardReply(Board board, HttpServletRequest request,  HttpSession session);

	void boardUpdate(Board board, HttpServletRequest request);

	void boardDelete(int num);

	void itemCreate(Item item, HttpServletRequest request);

	List<Map<Integer, String>> gameType();

	List<Item> getItemList(HttpServletRequest request);

	Item detail(Integer no);

	void update(Item item,HttpServletRequest request);

	void userCreate(User user);

	User getUser(String m_id);
	
	void addItemToCart(Integer no, Integer quantity,String id);

	Cart selectCart(String loginId);

	void cartSubtraction(Integer i_no, String loginId);

	void cartUpdate(Integer no, Integer quantity, String loginId);

	void Reply(Reply reply, Board board, HttpServletRequest request, HttpSession session);

	Reply getReply(Integer r_no, HttpServletRequest request);

	Sale checkEnd(User loginUser, Cart cart, HttpServletRequest request);

	void clearCart();	

	void updateUser(User user);

	void deleteUser(String id);

	List<User> userList();

	List<User> userList(String[] idchks);

	int deleteItem(int i_no);
	
	List<logic.Reply> getBoardReply(Integer b_no);

	List<Sale> getSaleList(String loginId);

	List<SaleItem> getSaleItemList(Integer s_id);

	List<Sale> getSaleList();

	void changeStep(String s_id, String s_step);

	boolean duplicateIdCheck(String id);

	void mileageSave(Integer mileage, String loginId);

	void updateAmount(Integer i_no);

	void buyOneItem(HttpServletRequest request,String loginId);

	String favoritItem(String i_no, String loginId, int i);

	int checkFavorit(Integer no, String attribute, int i);

	String getSaleUserId(String s_id);

	void mileageSubtract(Integer mileage, String saleUserId);


}
