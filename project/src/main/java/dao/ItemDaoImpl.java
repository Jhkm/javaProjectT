package dao;

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
import logic.Item;
@Repository
public class ItemDaoImpl implements ItemDao{
	//sqlSession : org.mybatis.spring.SqlSessionTemplate ∞¥√º ¡÷¿‘
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.ItemMapper.";
	@Override
	public void create(Item item) {
		int i = sqlSession.getMapper(ItemMapper.class).maxid();
		item.setI_no(++i);
		sqlSession.getMapper(ItemMapper.class).insert(item);
	}
}
