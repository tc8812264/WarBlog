package servlet;

import java.io.IOException;

import javabean.Checked;
import javabean.Update;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class user_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String nicheng = request.getParameter("usernicheng");
		String sex = request.getParameter("usersex");
		String phone = request.getParameter("userphone");
		String email = request.getParameter("useremail");
		String name= request.getParameter("username");
		String qianming = request.getParameter("userqianming");
		String idcard = request.getParameter("useridcard");
		String img = "";
		if(sex.equals("男")) {
			img = "male.png";
		}else {
			img = "female.png";
		}
		Update up = new Update();
		up.update_user(name, nicheng, sex, phone, email,qianming,img,idcard);
		Checked ck = new Checked();
		request.getSession().setAttribute("text", ck.findAllTextList(name));
		request.getSession().setAttribute("alum", ck.findAllaList(name));
		request.getSession().setAttribute("photo", ck.findAllpList(name));
		request.getSession().setAttribute("user",ck.find(name));
		response.sendRedirect("shangchuantouxiang.jsp");
		
	}	

}
