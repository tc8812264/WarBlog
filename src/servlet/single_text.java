package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javabean.Adds;
import javabean.Checked;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class single_text extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String text_id = request.getParameter("text_id");
		String dianzanren = request.getParameter("dianzanren");
		String type = "1";
		System.out.println(dianzanren);
		Checked ck = new Checked();
		ArrayList<HashMap<String, String>> list = ck.findSingleText(text_id);
		Adds ad = new Adds();
		ad.vote_Add(dianzanren,text_id,type);
		request.getSession().setAttribute("singletext", list);
		request.getSession().setAttribute("huifu", ck.findreply(text_id));
		request.getSession().setAttribute("dianzan", ck.finddianzan(text_id,dianzanren));
		response.sendRedirect("Single_text.jsp");
	}

}
