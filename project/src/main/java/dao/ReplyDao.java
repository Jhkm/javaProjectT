package dao;

import logic.Reply;

public interface ReplyDao {

	int maxNum();
	
	void insert(Reply reply);

	Reply getReply(Integer r_no);
}
