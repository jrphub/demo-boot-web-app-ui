package com.demo.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.app.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
}
