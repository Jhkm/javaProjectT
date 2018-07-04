package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Sale;

public interface SaleMapper {

	@Select("select ifnull(max(s_id),0) from sale")
	int maxId();

	@Insert("insert into sale (s_id,m_id,s_updatetime,s_step,address) values (#{s_id},#{user.m_id},#{s_updateTime},1,#{address})")
	void insert(Sale sale);
}
