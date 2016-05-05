package javabean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import database.DB;

public class Adds {
	public void user_Register(String name, String password) {
		DB b = new DB();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(d);
		String sql = "insert into userinfo (user_name,user_password,user_init,user_regTime,user_textnum,user_comnum,user_qianming,user_level,user_exe) values ('"+name+"','"+password+"', 0 ,'"+s+"',0,0,'暂无',0,0)";
		b.update(sql);
	}
	public void text_Add(String user_name, String text_name, String text_content, String text_img){
		System.out.println(user_name);
		DB b = new DB();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(d);
		String sql = "insert into texts (text_name,text_content,text_img,text_regTime,text_author,text_liulannum,text_vote,text_comnum) values ('"+text_name+"','"+text_content+"','"+text_img+"','"+s+"','"+user_name+"',0,0,0)";
		String sql1 = "update userinfo set user_exe = user_exe + 10,user_textnum = user_textnum + 1 where user_name ='"+user_name+"'";
		ArrayList<String> sqls = new ArrayList<String>();
		sqls.add(sql);
		sqls.add(sql1);
		b.updateBatch(sqls);
		String sql3 = "select * from texts where text_regTime = '"+s+"'";
		ArrayList<HashMap<String,String>> text = b.query(sql3);
		Update ul = new Update();
		ul.update_level(user_name);
	}
	public void alum_Add(String user_name, String alum_name, String alum_img){
		System.out.println(alum_name);
		DB b = new DB();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(d);
		String sql = "insert into alum (alum_name,alum_img,alum_regTime,alum_author,alum_num) values ('"+alum_name+"','"+alum_img+"','"+s+"','"+user_name+"',0)";
		ArrayList<String> sqls = new ArrayList<String>();
		sqls.add(sql);
		b.updateBatch(sqls);
	}
	public void reply_Add(String huifuren, String beihuifuren, String huifu_text, String huifu_content){
		DB b = new DB();
		Date d = new Date();
		System.out.println(huifu_text+" "+huifuren+" "+beihuifuren+" "+huifu_content);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(d);
		String sql = "insert into replys (reply_content,reply_regTime,reply_author,reply_text_id,reply_textauthor) values ('"+huifu_content+"','"+s+"','"+huifuren+"',"+huifu_text+",'"+beihuifuren+"')";
		String sql1 = "update texts set text_comnum = text_comnum + 1 where text_id ="+huifu_text;
		String sql2 = "update userinfo set user_comnum = user_comnum + 1 , user_exe = user_exe + 2 where user_name ='"+huifuren+"'";
		ArrayList<String> sqls = new ArrayList<String>();
		sqls.add(sql);
		sqls.add(sql1);
		b.updateBatch(sqls);
	}
	public void vote_Add(String dianzanren,String dianzan_text,String type) {
		DB b = new DB();
		Date d = new Date();
		if(type == "1"){
		System.out.println(dianzan_text+" "+dianzanren);
		String sql1 = "select * from texts where text_id ="+dianzan_text;
		ArrayList<HashMap<String,String>> text = b.query(sql1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(d);
		String sql2 = "select * from votes where vote_dianzanren = '"+dianzanren+"' and vote_text_id = "+dianzan_text+"";
		if(b.query(sql2).isEmpty()){
		String sql = "insert into votes (vote_text_id,vote_tag,vote_regTime,vote_dianzanren,vote_beidianzanren) values ("+dianzan_text+",0,'"+s+"','"+dianzanren+"','"+text.get(0).get("text_author")+"')";
		ArrayList<String> sqls = new ArrayList<String>();
		sqls.add(sql);
		b.updateBatch(sqls);
		}else {
		}
		}
	}
	public void vote_update(String dianzanren,String dianzan_text, String dianzan_tag,String dianzan_type) {
		DB b = new DB();
		Date d = new Date();
		System.out.println(dianzan_text+" "+dianzanren+" "+dianzan_tag);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(d);
		if(dianzan_type == "1"){
		String sql1;
		String sql = "update votes set vote_regTime = '"+s+"',vote_tag = "+dianzan_tag+" where vote_dianzanren = '"+dianzanren+"' and vote_text_id = "+dianzan_text+"";
		if(dianzan_tag.equals("1")){
		sql1 = "update texts set text_vote = text_vote + 1 where text_id ="+dianzan_text;
		}else{
		sql1 = "update texts set text_vote = text_vote - 1 where text_id ="+dianzan_text;	
		}	
		ArrayList<String> sqls = new ArrayList<String>();
		sqls.add(sql);
		sqls.add(sql1);
		b.updateBatch(sqls);
		}else {
			String sql1;
			String sql = "update votes set vote_regTime = '"+s+"',vote_tag = "+dianzan_tag+" where vote_dianzanren = '"+dianzanren+"' and vote_photo_id = "+dianzan_text+"";
			if(dianzan_tag.equals("1")){
			sql1 = "update photos set photo_vote = photo_vote + 1 where photo_id ="+dianzan_text;
			}else{
			sql1 = "update photos set photo_vote = photo_vote - 1 where photo_id ="+dianzan_text;	
			}	
			ArrayList<String> sqls = new ArrayList<String>();
			sqls.add(sql);
			sqls.add(sql1);
			b.updateBatch(sqls);	
		}
	}
	public void group_add(String name,String group_name) {
		DB b = new DB();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(d);
		String sql = "insert into groups (group_name,group_regTime,group_user,group_num) values ('"+group_name+"','"+s+"','"+name+"',0)";
		ArrayList<String> sqls = new ArrayList<String>();
		sqls.add(sql);
		b.updateBatch(sqls);
		
	}
	public void photo_Add(String album_id, String photo_content) {
		DB b = new DB();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(d);
		System.out.println(album_id);
		String sql = "select * from alum where alum_id ="+album_id;
		ArrayList<HashMap<String,String>> list = b.query(sql);
		String sql1 = "insert into photos (photo_regTime,photo_alum_id,photo_votenum,photo_author,photo_content) values ('"+s+"',"+album_id+",0,'"+list.get(0).get("alum_author")+"','"+photo_content+"')";
		String sql2 = "update alum set alum_num = alum_num + 1 where alum_id ="+album_id;
		ArrayList<String> sqls = new ArrayList<String>();
		sqls.add(sql1);
		sqls.add(sql2);
		b.updateBatch(sqls);
	}
}
