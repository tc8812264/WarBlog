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

public class visitor_archive extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String visitor = request.getParameter("visitor");
		String page = request.getParameter("p");
		String tag = request.getParameter("tag");
		if(page == null) {	
			page = "1";
		}
		if(tag == null) {
			tag = "0";
		}
		Checked ck = new Checked();
		PageBean pb = ck.findAllText(visitor,page,tag);
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("visitor_archive.jsp").forward(request, response);
	}
	}

