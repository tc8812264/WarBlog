package servlet;

import java.io.IOException;

import javabean.Delete;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteAlbum extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String album_id = request.getParameter("album_id");
		System.out.println(album_id);
		Delete dl = new Delete();
		dl.delAlbum(album_id);
	}

}
