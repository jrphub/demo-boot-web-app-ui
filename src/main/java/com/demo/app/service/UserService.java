package com.demo.app.service;

import com.demo.app.model.User;

public interface UserService {
	void save(User user);

	User findByUsername(String username);

}
