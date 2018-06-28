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
	
}
