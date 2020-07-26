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
		// HREF="<%=request.getContextPath()%>/util/CSS/Style.css"
		out.print("<html><head><link rel='stylesheet'	href='<%=request.getContextPath()%>/css/style.css'></head>");
		System.out.println(request.getContextPath()+"  request.getContextPath()");
//		out.print("<html><head> <style>@IMPORT url('<%=request.getContextPath()%>/css/style.css') </style> </head>");
		out.print("<body><h1>You Have Successfully Logged Out </h1>");
		out.print("</body></html>");
		
		response.setHeader("Refresh", "10;url=login.jsp");
		
	}
}
