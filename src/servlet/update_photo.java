package servlet;

import java.io.IOException;
import java.util.HashMap;

import javabean.Adds;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import fileuitl.FileUtil;

public class update_photo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FileUtil util = new FileUtil();
		HashMap<String,FileItem> map = util.getFormItem(request);
		FileItem item = map.get("file");
		String album_id = map.get("album_id").getString("UTF-8");
		System.out.println(album_id);
		String photo_content;	
		if(item.getName() != "") {
			String path = getServletContext().getRealPath("images");
			photo_content = util.writeFileToServer(item, path);
		}else {
			photo_content = "banner.jpg";
		}
		System.out.print(photo_content);
		Adds ad = new Adds();
		ad.photo_Add(album_id, photo_content);
		response.sendRedirect("photo_echo?album_id="+album_id);
	}

}
