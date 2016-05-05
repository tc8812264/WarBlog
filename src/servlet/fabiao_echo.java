package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javabean.Checked;
import javabean.PageBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class fabiao_echo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		Checked ck = new Checked();
		ArrayList<HashMap<String, String>> list = ck.find(name);
		request.getSession().setAttribute("user", list);
		response.sendRedirect("fabiaowenzhang.jsp");
	}

}
