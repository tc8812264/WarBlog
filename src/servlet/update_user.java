package servlet;

import java.io.IOException;

import javabean.Checked;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import database.DB;

public class update_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("user_name");
		String nicheng = request.getParameter("user_nicheng");
		String sex = request.getParameter("user_sex");
		String email = request.getParameter("user_email");
		String phone = request.getParameter("user_phone");
		String qianming = request.getParameter("user_qianming");
		String xingzuo = request.getParameter("user_xingzuo");
		String shengxiao = request.getParameter("user_shengxiao");
		String zhiye = request.getParameter("user_zhiye");
		String sheng = request.getParameter("user_sheng");
		String shi = request.getParameter("user_shi");
		DB b = new DB();
		String sql = "update userinfo set user_qianming = '"+qianming+"', user_nicheng = '"+nicheng+"', user_sex = '"+sex+"',user_email = '"+email+"', user_phone = '"+phone+"',user_xingzuo = '"+xingzuo+"',user_shengxiao = '"+shengxiao+"',user_zhiye = '"+zhiye+"',user_sheng = '"+sheng+"',user_shi = '"+shi+"' where user_name = '"+name+"'";
		System.out.println(sql);
		b.update(sql);
		Checked ck = new Checked();
		request.getSession().setAttribute("user", ck.find(name));
		response.setCharacterEncoding("UTF-8");
		JSONArray L = JSONArray.fromObject(ck.find(name));
		System.out.println(L.toString());
		response.getWriter().print(L.toString());
	}

}
