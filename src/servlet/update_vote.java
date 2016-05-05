package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javabean.Adds;
import javabean.Checked;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class update_vote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String dianzanren = request.getParameter("dianzanren");
		String dianzan_text = request.getParameter("dianzan_text");
		String dianzan_tag = request.getParameter("dianzan_tag");
		String dianzan_type = "1";
		response.setCharacterEncoding("UTF-8");
		Adds ad = new Adds();
		ad.vote_update(dianzanren,dianzan_text, dianzan_tag,dianzan_type);
		Checked ck = new Checked();
		ArrayList<HashMap<String, String>> list = ck.findSingleText(dianzan_text);
		request.getSession().setAttribute("singletext", list);
		request.getSession().setAttribute("huifu", ck.findreply(dianzan_text));
		request.getSession().setAttribute("dianzan", ck.finddianzan(dianzan_text,dianzanren));
		response.setCharacterEncoding("UTF-8");
		if(dianzan_tag.equals("1")){
			response.getWriter().print("点赞成功！");
		}else {
			response.getWriter().print("取消点赞成功！");
		}
	}

}
