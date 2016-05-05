package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javabean.Checked;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class friend_echo extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		Checked ck = new Checked();
		ArrayList<HashMap<String, String>> pb = ck.findAllFriend(name);
		ArrayList<HashMap<String, String>> list = ck.find(name);
		request.getSession().setAttribute("user", list);
		request.getSession().setAttribute("group", ck.findgroup(name));
		request.setAttribute("friend", pb);
		request.setAttribute("newfriend", ck.findrequest(name));
		request.getRequestDispatcher("friend_echo.jsp").forward(request, response);
	}

}
