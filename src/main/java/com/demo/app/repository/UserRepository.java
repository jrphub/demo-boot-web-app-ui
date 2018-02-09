package com.demo.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.app.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsername(String username);
}
