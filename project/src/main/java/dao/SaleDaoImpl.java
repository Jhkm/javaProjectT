package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SaleMapper;
import logic.Sale;
@Repository
public class SaleDaoImpl implements SaleDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.SaleMapper.";
	@Override
	public Integer getMaxSaleId() {
		return sqlSession.getMapper(SaleMapper.class).maxId()+1;
	}
	@Override
	public void insert(Sale sale) {
		sqlSession.getMapper(SaleMapper.class).insert(sale);
	}
	@Override
	public List<Sale> getSaleList(String loginId) {
		return sqlSession.getMapper(SaleMapper.class).selectList(loginId);
	}
	@Override
	public List<Sale> getSaleList() {
		return sqlSession.selectList(NS+"list");
	}
	@Override
	public void changeStep(String s_id, String s_step) {
		Map map = new HashMap();
		map.put("s_id", s_id);
		map.put("s_step", s_step);
		sqlSession.getMapper(SaleMapper.class).changeStep(map);
	}
	@Override
	public String getUserId(String s_id) {
		return sqlSession.getMapper(SaleMapper.class).getUserId(s_id);
	}
}
