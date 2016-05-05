package database;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;

import javabean.PageBean;

public class DBV2 {
	String url;
	Connection conn;
	PreparedStatement pstmt;

	public DBV2() {
		try {
			url = "jdbc:mysql://localhost:3306/tb";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "123");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void update(String sql, Object[] param) {
		try {
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < param.length; i++) {
				if (param[i] instanceof File) {
					File file = (File) param[i];
					FileInputStream fis = new FileInputStream(file);
					pstmt.setBinaryStream(i + 1, fis, (int) file.length());
				} else {
					pstmt.setString(i + 1, param[i].toString());
				}
			}
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public PageBean query(String sql, Object[] param, int page) {
		int max = 0;
		String sqlCount = "SELECT COUNT(1) AS num FROM ( " + sql + " ) s";
		ArrayList<HashMap<String, Object>> listCount = query(sqlCount, param);
		Object num = listCount.get(0).get("num");
		int maxRow = Integer.parseInt(num.toString());
		max = maxRow % 3 == 0 ? maxRow / 3 : maxRow / 3 + 1;
		if (page > max) {
			page = max;
		}
		if (page < 1) {
			page = 1;
		}
		int start = (page - 1) * 3;
		String sqlByPage = sql + "limit " + start + ",3";
		ArrayList<HashMap<String, Object>> list = query(sqlByPage, param);
		PageBean pb = new PageBean();
		pb.setList(list);
		pb.setMaxPage(max);
		pb.setMaxRow(maxRow);
		pb.setPage(page);
		int nextPage = (page + 1) > max ? max : page + 1;
		int prevPage = (page - 1) < 1 ? 1 : page - 1;
		pb.setNextPage(nextPage);
		pb.setPrevPage(prevPage);
		return pb;
	}

	public ArrayList<HashMap<String, Object>> query(String sql, Object[] param) {
		try {
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; param != null && i < param.length; i++) {
				if (param[i] instanceof File) {
					File file = (File) param[i];
					FileInputStream fis = new FileInputStream(file);
					pstmt.setBinaryStream(i + 1, fis, (int) file.length());
				} else {
					pstmt.setString(i + 1, param[i].toString());
				}

			}
			ResultSet rs = pstmt.executeQuery();
			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();
			while (rs.next()) {

				HashMap<String, Object> map = new HashMap<String, Object>();

				for (int i = 1; i <= columnCount; i++) {
					int type = rsmd.getColumnType(i);
					if (Types.LONGVARBINARY == type) {
						map.put(rsmd.getColumnName(i), rs.getBinaryStream(i));
					} else {
						map.put(rsmd.getColumnName(i),
								rs.getString(rsmd.getColumnName(i)));
					}

				}
				list.add(map);
			}
			rs.close();
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void close() {
		try {
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
