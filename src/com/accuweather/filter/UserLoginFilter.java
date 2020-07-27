package com.accuweather.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/weatherInfo.jsp")
public class UserLoginFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		  System.out.println("before filter");
			HttpSession session = ((HttpServletRequest) request).getSession();
			
			if(session.getAttribute("user1")!=null)
				
		chain.doFilter(request, response);
			else
			{
				response.getWriter().print("<center><h2><font color='red'>You are not authorised User</font></h2></center>");
			    response.setContentType("text/html");
				request.getRequestDispatcher("login.jsp").include(request, response);
			}
	}


	public void init(FilterConfig fConfig) throws ServletException {
	}

}
