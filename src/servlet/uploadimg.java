package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javabean.Checked;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import database.DB;
import fileuitl.FileUtil;


public class uploadimg extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<HashMap<String,String>> list = (ArrayList<HashMap<String,String>>)request.getSession().getAttribute("user");
		String name = list.get(0).get("user_name");
		FileUtil util = new FileUtil();
		HashMap<String,FileItem> map = util.getFormItem(request);
		FileItem item = map.get("file");
		if(item.getName() != "") {
		String path = getServletContext().getRealPath("images");
		String uuidName = util.writeFileToServer(item, path);
		DB b = new DB();
		b.update("update userinfo set user_touxiang = '"+uuidName+"' where user_name = '"+name+"'");
		Checked ck = new Checked();
		request.getSession().setAttribute("user",ck.find(name));
		response.sendRedirect("main.jsp");
		}else {
			request.setAttribute("message","头像不能为空！");
			request.getRequestDispatcher("shangchuantouxiang.jsp").forward(request,response);
		}
	}

}
