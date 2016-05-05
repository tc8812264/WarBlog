package servlet;

import java.io.IOException;

import javabean.Adds;
import javabean.Checked;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		Checked ck = new Checked();
		if(!ck.check_User(name, password).isEmpty()) {
			request.setAttribute("message","该账号已存在！");
			request.getRequestDispatcher("register.jsp").forward(request,response);
		}else {
			Adds useradd = new Adds();
			useradd.user_Register(name,password);
			response.sendRedirect("tiaozhuan.jsp");
		}
	}

}
