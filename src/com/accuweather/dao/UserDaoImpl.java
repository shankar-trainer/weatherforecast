package com.accuweather.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;


import com.accuweather.dto.UserDTO;
import com.accuweather.util.WeatherDataSource;

public class UserDaoImpl implements UserDao {

	Connection connection;
	DataSource ds;
	PreparedStatement pst, pst1;
	Statement st;
	ResultSet rs, rs1;

	UserDTO dto;
	Map<String, UserDTO> userMap;

	public UserDaoImpl() throws SQLException {
		ds = WeatherDataSource.getHikariDs();
		connection = ds.getConnection();
	}

	@Override
	public boolean addUser(UserDTO dto) throws SQLException {
		if (searchUser(dto.getId()) == null) {
			pst = null;
			pst = connection.prepareStatement("insert into user values(?,?,?,?,?,?,?,?)");
			pst.setString(1, dto.getId());
			pst.setString(2, dto.getName());
			pst.setString(3, dto.getGender());
			pst.setString(4, dto.getPassword());
			pst.setString(5, dto.getRepassword());
			pst.setString(6, dto.getEmail());
			pst.setInt(7, dto.getAge());
			pst.setString(8, dto.getCountry());
			int x = pst.executeUpdate();
			connection.commit();

			if (x == 1) {
				System.out.println("dao  .. user added");
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean removeUser(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public UserDTO searchUser(String id) throws SQLException {
		pst = null;
		pst = connection.prepareStatement("select * from user where id=?");
		pst.setString(1, id);
		rs = null;
		rs = pst.executeQuery();
		dto = null;
		if (rs.next()) {
			dto = new UserDTO();
			dto.setId(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setGender(rs.getString(3));
			dto.setPassword(rs.getString(4));
			dto.setRepassword(rs.getString(5));
			dto.setEmail(rs.getString(6));

			dto.setAge(rs.getInt(7));
			dto.setCountry(rs.getString(8));

		}
		return dto;
	}

	@Override
	public Map<String, UserDTO> getAllUser() throws SQLException {
		userMap = null;
		userMap = new HashMap<>();

		st = connection.createStatement();
		rs = st.executeQuery("select * from user");

		while (rs.next()) {
			dto = new UserDTO();
			dto.setId(rs.getString(1));
			dto.setGender(rs.getString(3));
			dto.setName(rs.getString(2));
			dto.setPassword(rs.getString(4));
			dto.setRepassword(rs.getString(5));
			dto.setEmail(rs.getString(6));
			dto.setAge(rs.getInt(7));
			dto.setCountry(rs.getString(8));
			userMap.put(rs.getString(1), dto);
		}
		return userMap;
	}

	@Override
	public String checkUser(UserDTO dto) throws SQLException {
		pst = null;
		pst = connection.prepareStatement("select * from user where id=?");
		pst.setString(1, dto.getId());

		rs = null;
		rs = pst.executeQuery();

		if (rs.next()) {
			pst1 = connection.prepareStatement("select * from user where id=? and password=? and repassword=?");
			pst1.setString(1, dto.getId());
			pst1.setString(2, dto.getPassword());
			pst1.setString(3, dto.getRepassword());
			rs1 = pst1.executeQuery();
			if (rs1.next())
				return "success";
			else
				return "id is correct password is wrong";
		} else
			return "Id not present";

	}
}
