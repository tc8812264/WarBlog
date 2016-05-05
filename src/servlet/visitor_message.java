package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javabean.Checked;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class visitor_message extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String visitor = request.getParameter("visitor");
		Checked ck = new Checked();
		ArrayList<HashMap<String, String>> list = ck.find(visitor);
		request.getSession().setAttribute("visitor", list);
		response.sendRedirect("visitor_message.jsp");
		
	}

}
