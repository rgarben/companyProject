package com.jacaranda.model;

import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="users")
public class Users {

	@Id
	private String user;
	private String password;
	private String roll;
	
	public Users() {
		super();
	}

	public Users(String user, String password, String rol) {
		super();
		this.user = user;
		this.password = password;
		this.roll = rol;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRol() {
		return roll;
	}

	public void setRol(String rol) {
		this.roll = rol;
	}

	@Override
	public int hashCode() {
		return Objects.hash(password, roll, user);
	}

	@Override
	public boolean equals(Object obj) {
		Users other = (Users) obj;
		return user == other.user;
	}

	@Override
	public String toString() {
		return String.format("Users [user=%s, password=%s, rol=%s]", user, password, roll);
	}

}
