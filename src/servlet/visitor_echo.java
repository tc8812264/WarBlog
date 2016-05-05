package servlet;

import java.io.IOException;

import javabean.Checked;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class visitor_echo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String visitor = request.getParameter("visitor");
		Checked ck = new Checked();
		request.getSession().setAttribute("text", ck.findAllTextList(visitor));
		request.getSession().setAttribute("alum", ck.findAllaList(visitor));
		request.getSession().setAttribute("photo", ck.findAllpList(visitor));
		request.getSession().setAttribute("visitor", ck.find(visitor));
		response.sendRedirect("visitorpage.jsp");
	}

}
