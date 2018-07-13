package dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.User;

public interface UserMapper {
	
	@Insert("insert into member (m_id,m_passwd,m_name,m_postcode, m_address,m_phone,m_email,m_game,m_mileage)"
			+ "values(#{m_id},#{m_passwd},#{m_name},#{m_postcode}, #{m_address},#{m_phone},#{m_email},#{m_game},#{m_mileage})")
	void insert(User user);

	@Select("select * from member where m_id = #{id}")
	User select(String id);

	@Update("update member set m_name=#{m_name}, m_phone=#{m_phone}, m_postcode=#{m_postcode}, m_address=#{m_address}, "
			+ "m_email=#{m_email}, m_game=#{m_game} where m_id=#{m_id}")
	void update(User user);

	@Delete("delete from member where m_id=#{m_id}")
	void delete(String id);

	@Select("select count(*) from member where m_id =#{id}")
	int checkId(String id);

	@Update("update member set m_mileage = m_mileage + #{m_mileage} where m_id = #{m_id}")
	void saveMileage(Map map);

	@Update("update member set m_mileage = m_mileage - #{m_mileage} where m_id = #{m_id}")
	void subtractMileage(Map map);
	
}
