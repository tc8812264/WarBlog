package servlet;

import java.io.IOException;

import javabean.Adds;
import javabean.Checked;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class photo_echo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String album_id = request.getParameter("album_id");
		Checked ck = new Checked();
		request.getSession().setAttribute("album_photo",ck.findAlbumPhoto(album_id));
		request.setAttribute("album_id",album_id);
		request.getRequestDispatcher("album_photo.jsp").forward(request, response);
	}

}
