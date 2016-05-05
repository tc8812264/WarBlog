package javabean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import database.DB;

public class Delete {
	public void group_del(String name,String group_name) {
		DB b = new DB();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(d);
		ArrayList<String> sqls = new ArrayList<String>();
		b.updateBatch(sqls);
		
	}

	public void delText(String text_id) {
		DB b = new DB();
		String sql = "select * from texts where text_id = "+text_id;
		ArrayList<HashMap<String,String>> list = b.query(sql);
		ArrayList<String> sqls = new ArrayList<String>();
		String sql1 = "delete from texts where text_id = "+text_id;
		String sql2 = "delete from replys where reply_text_id = "+text_id;
		String sql3 = "update userinfo set user_textnum = user_textnum - 1 where user_name = '"+list.get(0).get("text_author")+"'";
		sqls.add(sql1);
		sqls.add(sql2);
		sqls.add(sql3);
		b.updateBatch(sqls);
	}

	public void delAlbum(String album_id) {
		DB b = new DB();
		ArrayList<String> sqls = new ArrayList<String>();
		String sql1 = "delete from alum where alum_id = "+album_id;
		String sql2 = "delete from photos where photo_alum_id = "+album_id;
		sqls.add(sql1);
		sqls.add(sql2);
		b.updateBatch(sqls);	
	}
}
