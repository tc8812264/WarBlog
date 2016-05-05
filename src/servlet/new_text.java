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

public class new_text extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
		FileUtil util = new FileUtil();
		HashMap<String,FileItem> map = util.getFormItem(request);
		FileItem item = map.get("file");
		String user_name = map.get("user_name").getString("UTF-8");
		System.out.print(user_name);
		String text_name = map.get("text_name").getString("UTF-8");
		String text_content = map.get("content").getString("UTF-8");
		String text_img;	
		if(item.getName() != "") {
			String path = getServletContext().getRealPath("images");
			text_img = util.writeFileToServer(item, path);
		}else {
			text_img = "banner.jpg";
		}
		System.out.print(text_img);
		Adds ad = new Adds();
		ad.text_Add(user_name, text_name, text_content, text_img);
//		Checked ck = new Checked();
//		PageBean pb = ck.findAllText(user_name,"1");
//		ArrayList<HashMap<String, String>> list = ck.find(user_name);
//		request.getSession().setAttribute("user", list);
//		request.setAttribute("pb", pb);
//		request.getRequestDispatcher("archive.jsp").forward(request, response);
		response.sendRedirect("archive_echo?name="+user_name);
	}

}
