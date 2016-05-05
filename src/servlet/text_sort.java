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

public class text_sort extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("p");
		String tag = request.getParameter("tag");
		System.out.println(tag);
		if(page == null) {	
			page = "1";
		}
		if(tag == null) {
			tag = "0";
		}
		String name = request.getParameter("name");
		Checked ck = new Checked();
		PageBean pb = ck.findAllText(name,page,tag);
		request.getSession().setAttribute("pb", pb);
		response.setCharacterEncoding("UTF-8");
	}

}
