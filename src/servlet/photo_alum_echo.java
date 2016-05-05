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


public class photo_alum_echo extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("p");
		if(page == null) {
			page = "1";
		}
		String name = request.getParameter("name");
		Checked ck = new Checked();
		PageBean pb = ck.findAllalum(name,page);
		ArrayList<HashMap<String, String>> list = ck.find(name);
		request.getSession().setAttribute("user", list);
		request.setAttribute("pb", pb);
		request.getSession().setAttribute("photo", ck.findAllPhoto(name));
		request.getRequestDispatcher("photo_alum.jsp").forward(request, response);
	}

}
