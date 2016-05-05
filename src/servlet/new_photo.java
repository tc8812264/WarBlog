package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javabean.Checked;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class new_photo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String album_id = request.getParameter("album_id");
		Checked ck = new Checked();
		ArrayList<HashMap<String, String>> list = ck.findAlbum(album_id);
		request.getSession().setAttribute("album", list);
		response.sendRedirect("fabiaozhaopian.jsp");
	}

}
