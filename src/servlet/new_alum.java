package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javabean.Adds;
import javabean.Checked;
import javabean.PageBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import fileuitl.FileUtil;

public class new_alum extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FileUtil util = new FileUtil();
		HashMap<String,FileItem> map = util.getFormItem(request);
		FileItem item = map.get("file");
		String user_name = map.get("user_name").getString("UTF-8");
		System.out.print(user_name);
		String alum_name = map.get("alum_name").getString("UTF-8");
		String alum_img;
		if(item.getName() != "") {
			String path = getServletContext().getRealPath("images");
			alum_img = util.writeFileToServer(item, path);
		}else {
			alum_img = "banner.jpg";
		}
		System.out.print(alum_img);
		Adds ad = new Adds();
		ad.alum_Add(user_name,alum_name,alum_img);
/*		Checked ck = new Checked();
		PageBean pb = ck.findAllalum(user_name,"1");
		ArrayList<HashMap<String, String>> list = ck.find(user_name);
		request.getSession().setAttribute("user", list);
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("photo_alum.jsp").forward(request, response);*/
		response.sendRedirect("photo_alum_echo?name="+user_name);
	}

}
