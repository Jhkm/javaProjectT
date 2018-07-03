package dao;

import logic.User;

public interface UserDao {

	void insert(User user);

	User select(String id);

}
