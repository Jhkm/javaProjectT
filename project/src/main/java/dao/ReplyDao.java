package dao;

import java.util.List;

import dao.mapper.ReplyMapper;
import logic.Board;
import logic.Reply;
import logic.ShopServiceImpl;

public interface ReplyDao {

	int maxNum();
	
	void insert(Reply reply);

	Reply getReply(Integer r_no);

	List<Reply> getBoardReply(Integer r_no);

	void r_update(Reply reply);

	List<Reply> replyList(Integer b_no);
/*
	void replyCreate(Reply reply);

	void insertReReply(Reply reply);

	Reply selectReply(Integer r_no);

	void replyDelete(Integer r_no);*/

	void r_delete(Reply reply);

	void replyrefstepadd(Reply reply);

	void replyDelete(Integer r_no);

}
