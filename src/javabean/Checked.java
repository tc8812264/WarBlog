package javabean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import database.DB;
import database.DBV2;

public class Checked {
	public ArrayList<HashMap<String,String>> check_User(String name, String password) {
		DB b = new DB();
		String sql = "select * from userinfo where user_name = '"+name+"' and user_password = '"+password+"'";
		ArrayList<HashMap<String,String>> list = b.query(sql);
		return list;
	}
	public ArrayList<HashMap<String,String>> find(String name) {
		DB b = new DB();
		String sql = "select * from userinfo where user_name = '"+name+"'";
		ArrayList<HashMap<String,String>> list = b.query(sql);
		return list;
	}
	public ArrayList<HashMap<String,String>> findreply(String text_id) {
		DB b = new DB();
		String sql = "select * from replys where reply_text_id ="+text_id;
		ArrayList<HashMap<String,String>> list = b.query(sql);
		return list;
	}
	public ArrayList<HashMap<String,String>> finddianzan(String text_id,String dianzanren) {
		DB b = new DB();
		String sql = "select * from votes where vote_text_id ="+text_id+" and vote_dianzanren = '"+dianzanren+"'";
		ArrayList<HashMap<String,String>> list = b.query(sql);
		return list;
	}
	public PageBean findAllText(String user_name,String page, String tag) {
		DBV2 b = new DBV2();
		String sql="";
		System.out.println(tag+"2");
		if(tag == "0"){
			sql = "select * from texts where text_author = '"+user_name+"' order by text_regTime desc ";
		}else if(tag == "1"){
			sql = "select * from texts where text_author = '"+user_name+"' order by text_vote desc ";
		}else {
			sql = "select * from texts where text_author = '"+user_name+"' order by text_comnum desc ";
		}
		PageBean pb = b.query(sql,null,Integer.parseInt(page));
		return pb;
	}
	public ArrayList<HashMap<String, Object>> findAllTextList(String user_name) {
		DBV2 b = new DBV2();
		String sql = "select * from texts where text_author = '"+user_name+"' order by text_regTime desc";
		return b.query(sql, null);
		
	}
	public PageBean findAllalum(String user_name,String page) {
		DBV2 b = new DBV2();
		String sql = "select * from alum where alum_author = '"+user_name+"'";
		PageBean pb = b.query(sql,null,Integer.parseInt(page));
		return pb;
	}
	public ArrayList<HashMap<String, Object>> findAllaList(String user_name) {
		DBV2 b = new DBV2();
		String sql = "select * from alum where alum_author = '"+user_name+"' order by alum_regTime desc";
		return b.query(sql, null);
		
	}
	public ArrayList<HashMap<String, Object>> findAllpList(String user_name) {
		DBV2 b = new DBV2();
		String sql = "select * from photos where photo_author = '"+user_name+"' order by photo_regTime desc";
		return b.query(sql, null);
		
	}
	public ArrayList<HashMap<String, String>> findSingleText(String text_id) {
		DB b = new DB();
		String sql = "select * from texts where text_id = "+text_id+"";
		ArrayList<HashMap<String,String>> list = b.query(sql);
		return list;
	}
	public ArrayList<HashMap<String, String>> findAllFriend(String name) {
		DB b = new DB();
		String sql = "select * from friends where (friend_host = '"+name+"' and friend_pass = 1) or (friend_client = '"+name+"' and friend_pass = 1)";
		ArrayList<HashMap<String,String>> list = b.query(sql);
		System.out.println(list.get(0).get("friend_host"));
		return list;
	}
	public ArrayList<HashMap<String, String>> findgroup(String name) {
		DB b = new DB();
		Date d = new Date();
		String sql = "select * from groups where group_user = '"+name+"'";
		ArrayList<HashMap<String,String>> list = b.query(sql);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(d);
		if(list.isEmpty()){
		String sql1 = "insert into groups (group_user,group_name,group_regTime,group_num) values ('"+name+"','我的好友','"+s+"',0)";			
		b.update(sql1);
		String sql2 = "select * from groups where group_user = '"+name+"'";
		ArrayList<HashMap<String,String>> list1 = b.query(sql2);
		return list1;
		}else {
			return list;
		}
	}
	public ArrayList<HashMap<String, String>> findrequest(String name) {
		DB b = new DB();
		String sql = "select * from friends where friend_host = '"+name+"' and friend_pass = 0";
		ArrayList<HashMap<String, String>> list = b.query(sql);
		return list;
	}
	public ArrayList<HashMap<String, String>> findAllPhoto(String name) {
		DB b = new DB();
		String sql = "select * from photos where photo_author = '"+name+"'";
		ArrayList<HashMap<String, String>> list = b.query(sql);
		return list;
	}
	public ArrayList<HashMap<String, String>> findAlbumPhoto(String album_id) {
		DB b = new DB();
		String sql = "select * from photos where photo_alum_id = "+album_id+"";
		ArrayList<HashMap<String, String>> list = b.query(sql);
		return list;
	}
	public PageBean findAllreply(String name,String page) {
		DBV2 b = new DBV2();
		String sql = "select * from replys where reply_textauthor = '"+name+"'";
		PageBean pb = b.query(sql,null,Integer.parseInt(page));
		return pb;
	}
	public ArrayList<HashMap<String,String>> findLikeText(String text_likename, String text_author) {
		DB b = new DB();
		String sql = "select * from texts where text_author = '"+text_author+"' and text_name like '%"+text_likename+"%'";
		ArrayList<HashMap<String,String>> list = b.query(sql);
		return list;
	}
	public ArrayList<HashMap<String, String>> findAlbum(String album_id) {
		DB b = new DB();
		String sql = "select * from alum where alum_id = "+album_id;
		ArrayList<HashMap<String,String>> list = b.query(sql);
		return list;
	}
		
}
