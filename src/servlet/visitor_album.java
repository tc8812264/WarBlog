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

public class visitor_album extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String visitor = request.getParameter("visitor");
		String page = request.getParameter("p");
		if(page == null) {
			page = "1";
		}
		Checked ck = new Checked();
		PageBean pb = ck.findAllalum(visitor,page);
		ArrayList<HashMap<String, String>> list = ck.find(visitor);
		request.getSession().setAttribute("visitor", list);
		request.setAttribute("pb", pb);
		request.getSession().setAttribute("photo", ck.findAllPhoto(visitor));
		request.getRequestDispatcher("visitor_album.jsp").forward(request, response);
	}

}
