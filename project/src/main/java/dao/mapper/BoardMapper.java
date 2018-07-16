package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {
	@Update("update board set b_readcnt=b_readcnt + 1 where b_no=#{b_no}")
	void b_readcnt(Integer num);


	@Insert("insert into board (b_no, b_category, b_subject, b_content, b_file, b_readcnt, m_id, b_ref, b_reflevel, b_refstep, b_state, b_regtime, b_people, g_id, i_no,i_grade,b_date) "
			+ "values (#{b_no}, #{b_category}, #{b_subject}, #{b_content}, #{b_fileurl}, 0, #{m_id}, #{b_ref}, #{b_reflevel}, #{b_refstep}, #{b_state}, now(), #{b_people}, #{g_id}, #{i_no},#{i_grade}, #{b_date})")
	void insert(Board board);

	@Update("update board set b_refstep = b_refstep + 1 where b_ref = #{b_ref} and b_refstep > #{b_refstep}")
	void refstepadd(Board board);
	
	@Update("update board set b_subject=#{b_subject}, b_content=#{b_content}, b_file=#{b_fileurl}, b_regtime=now(),g_id=#{g_id} where b_no=#{b_no}")
	void update(Board board);

	@Delete("delete from board where b_no=#{b_no}")
	void delete(int num);
	
	@Select("select ifnull(max(b_no),0) from board")
	int maxNum();

	@Select("select * from board where b_category = #{b_category} and i_no = #{i_no}")
	List<Board> itemCommentList(Map<Object, Object> map);

	@Select("select ifnull(avg(i_grade),0) from board where b_category = #{b_category} and i_no = #{i_no}")
	Double avgGrade(Map<Object, Object> map);


}
