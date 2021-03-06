package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import dao.mapper.ItemMapper;
import logic.Cart;
import logic.Item;
import logic.ItemSet;
@Repository
public class ItemDaoImpl implements ItemDao{
	//sqlSession : org.mybatis.spring.SqlSessionTemplate 객체 주입
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.ItemMapper.";
	@Override
	public void create(Item item) {
		int i = sqlSession.getMapper(ItemMapper.class).maxid();
		item.setI_no(++i);
		sqlSession.getMapper(ItemMapper.class).insert(item);
	}
	@Override
	public List<Map<Integer, String>> gameType() {
		List<Map<Integer, String>> list = sqlSession.getMapper(ItemMapper.class).getType();
		return list;
	}
	@Override
	public List<Item> list(HttpServletRequest request) {
		Map map = new HashMap();
		System.out.println(request.getParameter("sort") +"," + request.getParameter("find") + "," + request.getParameter("kind") + "," + request.getParameter("gametype"));
		map.put("sort", request.getParameter("sort"));
		map.put("find", request.getParameter("find"));
		map.put("kind", request.getParameter("kind"));
		map.put("gametype", request.getParameter("gametype"));
		return sqlSession.selectList(NS+"list",map);
	}
	@Override
	public Item detail(Integer no) {
		Map<String,Integer> param = new HashMap<String,Integer>();
		param.put("no", no);
		Item item = sqlSession.selectOne(NS+"list",param);
		return item;
	}
	@Override
	public void update(Item item) {
		sqlSession.getMapper(ItemMapper.class).update(item);
	}
	@Override
	public void addItemToCart(Integer no, Integer quantity, String id) {
		Map map = new HashMap();
		map.put("no", no);
		map.put("quantity", quantity);
		map.put("id", id);
		sqlSession.getMapper(ItemMapper.class).addItemToCart(map);
	}
	@Override
	public Cart selectCart(String loginId) {
		List<Map> list = null;
		if(loginId == null || loginId.equals("")) {
			//테스트 한것임 추후 제거 해야됨
			list = sqlSession.selectList(NS+"cart");
		} else {
			list = sqlSession.getMapper(ItemMapper.class).selectCart(loginId);
		}
		
		Cart cart = new Cart();
		for(Map m : list) {
			ItemSet itemSet = new ItemSet(detail((Integer)m.get("i_no")),(Integer)m.get("quantity"));
			cart.push(itemSet);
		}
		return cart;
	}
	@Override
	public void cartSubtraction(Integer i_no, String loginId) {
		Map map = new HashMap();
		map.put("no", i_no);
		map.put("id", loginId);
		sqlSession.getMapper(ItemMapper.class).cartSubT(map);
	}
	@Override
	public void cartUpdate(Integer no, Integer quantity, String loginId) {
		cartSubtraction(no,loginId);
		addItemToCart(no,quantity,loginId);
	}
	@Override
	public void clearCart() {
		sqlSession.getMapper(ItemMapper.class).clearCart();
	}
	@Override
	public int delete(int i_no) {
		return sqlSession.getMapper(ItemMapper.class).delete(i_no);
	}
	@Override
	public void updateAmount(Integer i_no) {
		sqlSession.getMapper(ItemMapper.class).updateAmount(i_no);
	}
	@Override
	public int checkFavorit(String i_no, String loginId, int i) {
		Map map = new HashMap();
		map.put("i_no", i_no);
		map.put("m_id", loginId);
		map.put("i", i);
		return sqlSession.getMapper(ItemMapper.class).checkFavorit(map);
	}
	@Override
	public void insertFavorit(String i_no, String loginId, int i) {
		Map map = new HashMap();
		map.put("i_no", i_no);
		map.put("m_id", loginId);
		map.put("i", i);
		sqlSession.getMapper(ItemMapper.class).insertFavorit(map);
	}
	@Override
	public void removeFavorit(String i_no, String loginId, int i) {
		Map map = new HashMap();
		map.put("i_no", i_no);
		map.put("m_id", loginId);
		map.put("i", i);
		sqlSession.getMapper(ItemMapper.class).removeFavorit(map);
	}
	@Override
	public List<Item> bestItemList() {
		return sqlSession.selectList(NS+"bestitemlist");
	}
	@Override
	public void cntUpItem(String i_no) {
	   sqlSession.getMapper(ItemMapper.class).cntUpItem(i_no);
	}
	@Override
	public void cntDownItem(String i_no) {
	   sqlSession.getMapper(ItemMapper.class).cntDownItem(i_no);
	}
}
