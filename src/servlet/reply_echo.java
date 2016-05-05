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

import net.sf.json.JSONArray;


public class reply_echo extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String huifuren = request.getParameter("huifuren");
		String beihuifuren = request.getParameter("beihuifuren");
		String huifu_text = request.getParameter("huifu_text");
		String huifu_content = request.getParameter("huifu_content");
		System.out.println(huifu_content);
		Adds ad = new Adds();
		ad.reply_Add(huifuren, beihuifuren, huifu_text, huifu_content);
		response.setCharacterEncoding("UTF-8");
		Checked ck = new Checked();
		ArrayList<HashMap<String, String>> list = ck.findSingleText(huifu_text);
		request.getSession().setAttribute("singletext", list);
		request.getSession().setAttribute("huifu", ck.findreply(huifu_text));
		request.getSession().setAttribute("dianzan", ck.finddianzan(huifu_text,huifuren));
		response.setCharacterEncoding("UTF-8");
		JSONArray L = JSONArray.fromObject(ck.findreply(huifu_text));
		System.out.println(L.toString());
		response.getWriter().print(L.toString());
	}

}
