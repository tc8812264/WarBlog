package servlet;

import java.io.IOException;

import javabean.Checked;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import database.DB;

public class search_text extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String text_likename = request.getParameter("text_likename");
		String text_author = request.getParameter("text_author");
		DB b = new DB();
		Checked ck = new Checked();
		response.setCharacterEncoding("UTF-8");
		JSONArray L = JSONArray.fromObject(ck.findLikeText(text_likename,text_author));
		System.out.println(L.toString());
		response.getWriter().print(L.toString());
	}

}
