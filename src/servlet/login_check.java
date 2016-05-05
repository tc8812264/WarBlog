package servlet;

import java.io.IOException;

import javabean.Checked;
import javabean.Update;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class login_check extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		Checked ck = new Checked();
		Update up = new Update();
		if(ck.check_User(name, password).isEmpty()) {
			request.setAttribute("message","账号或密码错误！");
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}else if(ck.check_User(name, password).get(0).get("user_init").equals("1")){
			up.update_log(name);
			request.getSession().setAttribute("user",ck.check_User(name, password));
			request.getSession().setAttribute("text", ck.findAllTextList(name));
			request.getSession().setAttribute("alum", ck.findAllaList(name));
			request.getSession().setAttribute("photo", ck.findAllpList(name));
			response.sendRedirect("main.jsp");
		}else {
			up.update_log(name);
			request.getSession().setAttribute("user",ck.check_User(name, password));
			response.sendRedirect("wanshanxinxi.jsp");
		}
	}

}
