package dao;

import java.util.HashMap;
import java.util.List;
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

	@Override
	public List<Reply> getBoardReply(Integer b_no) {
		return sqlSession.getMapper(ReplyMapper.class).getBoardReply(b_no);
	}

	@Override
	public void r_update(Reply reply) {
		sqlSession.getMapper(ReplyMapper.class).update(reply);
	}

	@Override
	public List<Reply> replyList(Integer r_no) {
		 Map<String, Object> param = new HashMap<String, Object>();
	      param.put("r_no", r_no);
	      return sqlSession.selectList(NS+"replylist", param);

	}

	@Override
	public void r_delete(Reply reply) {
		sqlSession.getMapper(ReplyMapper.class).delete(reply);
	}

	@Override
	public void replyrefstepadd(Reply reply) {
		sqlSession.getMapper(ReplyMapper.class).refstepadd(reply);
		
	}

	
	/*
	@Override
	public void insertReReply(Reply reply) {
		sqlSession.getMapper(ReplyMapper.class).replyrefstepadd(reply);
		int r_reflevel = reply.getR_reflevel()+1;
		int r_refstep = reply.getR_refstep()+1;
		int r_no = this.maxNum()+1;
		reply.setR_ref(reply.getR_ref());
		reply.setR_reflevel(r_reflevel);
		reply.setR_refstep(r_refstep);
		reply.setR_no(r_no);
		this.replyCreate(reply);
	}
	
	@Override
	public void replyCreate(Reply reply) {
		sqlSession.getMapper(ReplyMapper.class).replyCreate(reply);
	}


	@Override
	public Reply selectReply(Integer r_no) {
		  return sqlSession.getMapper(ReplyMapper.class).selectReply(r_no);
	}

	@Override
	public void replyDelete(Integer r_no) {
		 sqlSession.getMapper(ReplyMapper.class).replyDelete(r_no);
	}*/
}
