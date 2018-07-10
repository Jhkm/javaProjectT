package dao;

import java.util.List;

import logic.User;

public interface UserDao {

	void insert(User user);

	User select(String id);

	void update(User user);

	void delete(String id);

	List<User> list();

	List<User> list(String[] ids);

	int checkId(String id);

}
