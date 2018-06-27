package logic;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ShopService {

	void itemCreate(Item item, HttpServletRequest request);
	
}
