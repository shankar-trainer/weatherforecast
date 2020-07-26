package com.accuweather.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.accuweather.dao.UserDao;
import com.accuweather.dao.UserDaoImpl;
import com.accuweather.dto.UserDTO;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao dao;
	UserDTO dto;

	@Override
	public void init() throws ServletException {
		try {
			dto = new UserDTO();
			dao = new UserDaoImpl();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id, name, gender, country, email, pass, repass;
		int age;

		id = request.getParameter("id");
		name = request.getParameter("name");
		pass = request.getParameter("pass");
		repass = request.getParameter("repass");
		age = Integer.parseInt(request.getParameter("age"));
		country = request.getParameter("country");
		email = request.getParameter("email");
		gender = request.getParameter("gender");

		dto.setId(id);
		dto.setPassword(pass);
		dto.setRepassword(repass);
		dto.setEmail(email);
		dto.setCountry(country);
		dto.setGender(gender);
		dto.setAge(age);
		dto.setName(name);

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {

			if (dao.addUser(dto)) {
				out.print("<h1>User Added </h1>");
				// out.print("<script>alert('login failed')</script>");
				response.setHeader("Refresh", "10;url=login.jsp");
			}

			else {
				out.print(
						"<span style='background:yellow;color:blue'><h1><center>User Already Exist</center></h1></span>");
				response.setHeader("Refresh", "10;url=SignUp.html");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
