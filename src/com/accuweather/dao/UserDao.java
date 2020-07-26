package com.accuweather.dao;

import java.sql.SQLException;
import java.util.Map;

import com.accuweather.dto.UserDTO;

public interface UserDao {

	boolean addUser(UserDTO dto) throws SQLException;

	boolean removeUser(String id);
	String checkUser(UserDTO dto) throws SQLException;
	boolean updateUser(UserDTO dto);

	UserDTO searchUser(String id) throws SQLException;

	Map<String, UserDTO> getAllUser() throws SQLException;
	
	

}
