package logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ShopService {

	void itemCreate(Item item, HttpServletRequest request);

	List<Map<Integer, String>> gameType();

	List<Item> getItemList();

	Item detail(Integer no);

	void update(Item item,HttpServletRequest request);
	
	
	
}
