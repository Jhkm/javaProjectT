package dao;

import java.util.List;

import logic.Reply;

public interface ReplyDao {

	int maxNum();
	
	void insert(Reply reply);

	Reply getReply(Integer r_no);

	List<Reply> getBoardReply(Integer b_no);
}
