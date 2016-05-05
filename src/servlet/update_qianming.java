package servlet;

import java.io.IOException;

import javabean.Checked;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DB;

public class update_qianming extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("user_name");
		String qianming = request.getParameter("user_qianming");
		DB b = new DB();
		String sql = "update userinfo set user_qianming = '"+qianming+"' where user_name = '"+name+"'";
		b.update(sql);
		Checked ck = new Checked();
		request.getSession().setAttribute("user", ck.find(name));
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(qianming);
	}

}
