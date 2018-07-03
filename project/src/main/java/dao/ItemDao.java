package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import logic.Cart;
import logic.Item;

public interface ItemDao {
	void create(Item item);

	List<Map<Integer, String>> gameType();

	List<Item> list();

	Item detail(Integer no);

	void update(Item item);

	void addItemToCart(Integer no, Integer quantity, String id);

	Cart selectCart(String loginId);

	void cartSubtraction(Integer i_no, String loginId);

	void cartUpdate(Integer no, Integer quantity, String loginId);
}
