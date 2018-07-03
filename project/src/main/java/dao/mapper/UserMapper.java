package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.User;

public interface UserMapper {
	
	@Insert("insert into member (m_id,m_passwd,m_name,m_address,m_phone,m_email,m_game,m_mileage)"
			+ "values(#{m_id},#{m_passwd},#{m_name},#{m_address},#{m_phone},#{m_email},#{m_game},#{m_mileage})")
	void insert(User user);

	@Select("select * from member where m_id = #{id}")
	User select(String id);
	
}
