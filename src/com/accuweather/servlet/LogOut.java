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

@WebServlet("/LogOut")
public class LogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		session=request.getSession();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		session.invalidate();
		String p=request.getContextPath();
		String s="<LINK REL='StyleSheet' HREF="+p+"/css/style.css TYPE='text/css'>";
		
		out.print("<html><head>"+s+"<script src="+p+"/script/script1.js></script>");
		out.print("<script>timer1()</script></head>");
		
		out.print("<body><h1 class='logout'>You Have Successfully Logged Out </h1>");
		
		out.print("<div id='id2'>you will be redirected to Login Page After  <span id='id1'></span> Seconds </div></body></html>");
		
		response.setHeader("Refresh", "10;url=login.jsp");
	}
}
