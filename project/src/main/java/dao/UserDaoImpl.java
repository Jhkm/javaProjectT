package dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.UserMapper;
import logic.User;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired
	SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.UserMapper.";
	
	@Override
	public void insert(User user) {
		sqlSession.getMapper(UserMapper.class).insert(user);
	}

	@Override
	public User select(String id) {
		return sqlSession.getMapper(UserMapper.class).select(id);
	}

	@Override
	public void update(User user) {
		sqlSession.getMapper(UserMapper.class).update(user);
	}

	@Override
	public void delete(String id) {
		sqlSession.getMapper(UserMapper.class).delete(id);
	}

	@Override
	public List<User> list() {
		return sqlSession.selectList(NS +"list");
	}

	@Override
	public List<User> list(String[] ids) {
		//List 객체 : 가변배열.배열형태로 설정됨.
		List<String> idlist = Arrays.asList(ids);
		//List<string> :스트링에 모임인 list 이다
		Map<String,List<String>> map = new HashMap<String,List<String>>();
		map.put("idlist", idlist);
		return sqlSession.selectList(NS+"list",map);	
	}

	@Override
	public int checkId(String id) {
		return sqlSession.getMapper(UserMapper.class).checkId(id);
	}

	@Override
	public void saveMileage(Integer mileage, String loginId) {
		Map map = new HashMap();
		map.put("m_mileage", mileage);
		map.put("m_id", loginId);
		sqlSession.getMapper(UserMapper.class).saveMileage(map);
	}

	@Override
	public void subtractMileage(Integer mileage, String saleUserId) {
		Map map = new HashMap();
		map.put("m_mileage", mileage);
		map.put("m_id", saleUserId);
		sqlSession.getMapper(UserMapper.class).subtractMileage(map);
	}
}
