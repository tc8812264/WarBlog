package javabean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import database.DB;

public class Update {
	public void update_user(String name, String nicheng, String sex, String phone, String email,String qianming,String img,String idcard) {
		DB b = new DB();
		String sql = "update userinfo set user_nicheng = '"+nicheng+"', user_sex = '"+sex+"', user_phone = '"+phone+"', user_email = '"+email+"',user_init = "+1+", user_qianming = '"+ qianming+"',user_touxiang = '"+img+"',user_idcard = '"+idcard+"' where user_name = '"+name+"'";
		b.update(sql);
	}
	public void update_log(String name) {
		DB b = new DB();
		Date d =new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(d);		
		String sql = "update userinfo set user_loginTime = '"+s+"' where user_name = '"+name+"'";
		b.update(sql);		
	}
	public void update_level(String user_name) {
		DB b = new DB();
		String sql = "select user_exe from userinfo where user_name = '"+user_name+"'";
		System.out.println(sql);
		ArrayList<HashMap<String, String>> list = b.query(sql);
		System.out.println(list.get(0).get("user_exe"));
		String sql1 = "select level_name from levels where level_exe <="+list.get(0).get("user_exe");
		System.out.println(sql1);
		ArrayList<HashMap<String, String>> list2 = b.query(sql1);
		String sql2 = "update userinfo set user_level = '"+list2.get(list2.size()-1).get("level_name")+"' where user_name = '"+user_name+"'";
		b.update(sql2);
	}
}
