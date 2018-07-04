package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ReplyMapper;
import logic.Reply;
@Repository
public class ReplyDaoImpl implements ReplyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.ReplyMapper.";
	
	@Override
	public void insert(Reply reply) {
		sqlSession.getMapper(ReplyMapper.class).insert(reply);
	}

	@Override
	public int maxNum() {
		return sqlSession.getMapper(ReplyMapper.class).maxNum();
	}

	@Override
	public Reply getReply(Integer r_no) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("startrow", 0);
		map.put("limit", 1);
		map.put("num", r_no);
		return sqlSession.selectOne(NS+"list", map);
	}
}
