package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Reply;

public interface ReplyMapper {

	@Update("update reply set r_refstep = r_refstep + 1 where r_ref = #{r_ref} and r_refstep > #{r_refstep}")
	void replyrefstepadd(Reply reply);

	@Insert("insert into reply (r_no, r_content, r_ref, r_refstep, r_reflevel, r_date, b_no, m_id) values"
			+ "(#{r_no}, #{r_content}, #{r_ref}, #{r_refstep}, #{r_reflevel}, now(), #{b_no}, #{m_id})")
	void insert(Reply reply);

	@Select("select ifnull(max(r_no),0) from reply")
	int maxNum();
}
