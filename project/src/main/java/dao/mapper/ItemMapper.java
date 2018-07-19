package dao.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Item;

public interface ItemMapper {
	@Select("select ifnull(max(i_no),0) from item")
	int maxid();

	@Insert("insert into item (i_no, i_name, i_price, i_people, i_age, i_explain, i_amount, i_img, it_no) values (#{i_no}, #{i_name}, #{i_price}, #{i_people}, #{i_age}, #{i_explain}, 0, #{i_img}, #{it_no})")
	void insert(Item item);

	@Select("select tp_no, tp_name from gametype")
	List<Map<Integer, String>> getType();

	@Update("update item set i_name=#{i_name},i_price=#{i_price},i_people=#{i_people},i_age=#{i_age},i_explain=#{i_explain},i_img=#{i_img},it_no=#{it_no} where i_no=#{i_no}")
	void update(Item item);

	@Insert("insert into cart (i_no, quantity, m_id) values (#{no},#{quantity},#{id})")
	void addItemToCart(Map<String, Integer> map);

	@Select("select i_no, quantity from cart where m_id = #{loginId}")
	List<Map> selectCart(String loginId);

	@Delete("delete from cart where m_id = #{id} and i_no = #{no}")
	void cartSubT(Map map);

	@Delete("delete from cart where 1 = 1")
	void clearCart();

	@Delete("delete from item where i_no = #{value}")
	int delete(int i_no);

	@Update("update item set i_amount = i_amount + 1 where i_no = #{value}")
	void updateAmount(Integer i_no);

	@Select("select count(*) from likeitem where category=#{i} and i_no=#{i_no} and m_id=#{m_id}")
	int checkFavorit(Map map);

	@Insert("insert into likeitem (category,i_no,m_id) values (#{i},#{i_no},#{m_id})")
	void insertFavorit(Map map);

	@Delete("delete from likeitem where category=#{i} and i_no=#{i_no} and m_id=#{m_id}")
	void removeFavorit(Map map);
	
	@Update("update item set likecnt = likecnt+1 where i_no = #{value}")
	void cntUpItem(String i_no);

	@Update("update item set likecnt = likecnt-1 where i_no = #{value}")
	void cntDownItem(String i_no);
	
}
