package com.accuweather.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.accuweather.dao.UserDao;
import com.accuweather.dao.UserDaoImpl;
import com.accuweather.dto.UserDTO;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
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
		String id, pass, repass;
		id = request.getParameter("id");
		pass = request.getParameter("pass");
		repass = request.getParameter("repass");
		dto.setId(id);
		dto.setPassword(pass);
		dto.setRepassword(repass);
		PrintWriter out = response.getWriter();

		try {
			if (dao.checkUser(dto).equals("success")) {
				HttpSession session = request.getSession();
				session.setAttribute("userstatus", "user created");
				session.setAttribute("user1", "user1");

				// out.print("login successful");

				response.sendRedirect("weatherInfo.jsp");
			}

			else {
				response.setContentType("text/html");

				out.print("<span style='background:yellow;color:blue'><h1><center>login failed</center></h1></span>");
				// out.print("<span
				// style='background:yellow;color:blue'><h1><center>"+dao.checkUser(dto)+"</center></h1></span>");
				// out.print("<script>alert('login failed')</script>");
				String s = dao.checkUser(dto);
				String msg1=null,msg2=null;
				
                     if(s.equals("Id not present"))
                    	 msg1=s;
                     else
                    	 msg2=s;
                     
                     System.out.print("message  ...."+s);
                     System.out.print("message1  ...."+msg1);
                     System.out.print("message2  ...."+msg2);
                     
                     
				//request.getRequestDispatcher("login.jsp?msg1=" + msg1+"&msg2=" + msg2).include(request, response);
                    response.sendRedirect("login.jsp?msg1=" + msg1+"&msg2=" + msg2+"&error= Login Failed");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
