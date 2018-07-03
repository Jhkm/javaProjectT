package dao;

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
}
