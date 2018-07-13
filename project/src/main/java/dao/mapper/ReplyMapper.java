package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;
import logic.Reply;

public interface ReplyMapper {

	@Update("update reply set r_refstep = r_refstep + 1 where r_ref = #{r_ref} and r_refstep > #{r_refstep}")
	void replyrefstepadd(Reply reply);

	@Insert("insert into reply (r_no, r_content, r_ref, r_refstep, r_reflevel, r_date, b_no, m_id) values "
			+ "(#{r_no}, #{r_content}, #{r_ref}, #{r_refstep}, #{r_reflevel}, now(), #{b_no}, #{m_id})")
	void insert(Reply reply);

	@Select("select ifnull(max(r_no),0) from reply")
	int maxNum();

	@Select("select r_no, r_content, r_ref, r_reflevel, r_date, b_no, m_id from reply where b_no=#{b_no} order by r_ref desc, r_refstep")
	List<Reply> getBoardReply(Integer b_no);

	@Update("update reply set r_content=#{r_content}, r_date=now() where r_no=#{r_no}")
	void update(Reply reply);

	@Delete("delete from reply where r_no=#{r_no}")
	void delete(Reply reply);
	
	@Update("update reply set r_refstep = r_refstep + 1 where r_ref = #{r_ref} and r_refstep > #{r_refstep}")
	void refstepadd(Reply reply);

	@Delete("delete from reply where r_no=#{r_no}")
	void replyDelete(Integer r_no);
	
/*	@Insert("insert into reply (r_no, m_id, r_content, r_date, r_ref, r_reflevel, r_refstep, b_no) values (#{r_no}, #{m_id}, #{r_content}, now(), #{r_ref}, #{r_reflevel}, #{r_refstep}, #{b_no})")
	void replyCreate(Reply reply);
	 
	@Select("select * from reply where r_no = #{r_no}")
	Reply selectReply(Integer r_no);*/
}
