package servlet;

import java.io.IOException;

import javabean.Checked;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class update_main extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("user_name");
		Checked ck = new Checked();
		request.getSession().setAttribute("text", ck.findAllTextList(name));
		request.getSession().setAttribute("alum", ck.findAllaList(name));
		request.getSession().setAttribute("photo", ck.findAllpList(name));
		response.sendRedirect("main.jsp");
	}

}
