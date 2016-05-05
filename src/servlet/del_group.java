package servlet;

import java.io.IOException;

import javabean.Checked;
import javabean.Delete;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class del_group extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("user_name");
		String group_name = request.getParameter("group_name");
		Delete del = new Delete();
		Checked ck = new Checked();
		del.group_del(name,group_name);
		request.getSession().setAttribute("group",ck.findgroup(name));
		response.setCharacterEncoding("UTF-8");
	}

}
