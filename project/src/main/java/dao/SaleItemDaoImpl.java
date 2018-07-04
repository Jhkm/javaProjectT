package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SaleItemMapper;
import logic.SaleItem;
@Repository
public class SaleItemDaoImpl implements SaleItemDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.SaleItemMapper.";
	@Override
	public void insert(SaleItem saleItem) {
		sqlSession.getMapper(SaleItemMapper.class).insert(saleItem);
	}
}
