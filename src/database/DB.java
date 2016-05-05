package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;


public class DB {
	String name = "root";
	String password = "123";
	String url;
	Connection conn;
	Statement stmt;
	public DB(){
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			this.url = "jdbc:mysql://localhost:3306/tb";
			try {
				this.conn = DriverManager.getConnection(url, name, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				this.stmt = conn.createStatement();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	public void trans(ArrayList<String> sqls) {
		try {
			conn.setAutoCommit(false);
			for(int i = 0; i < sqls.size(); i ++) {
				stmt.executeUpdate(sqls.get(i));	
			}
		 } catch (SQLException e) {
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
		}finally {
						try {
							conn.commit();
						} catch (SQLException e) {
							e.printStackTrace();
						}
		}
	}
	public void updateBatch(ArrayList<String> sqls) {

			try {	
				for (int i = 0; i < sqls.size(); i++) {
					stmt.addBatch(sqls.get(i));
				}
				stmt.executeBatch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	public int update(String sql) {
			try {	
				return stmt.executeUpdate(sql);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return 0;
	}
	public ArrayList<HashMap<String,String>> query(String sql) {
			try {	
				ResultSet rs = stmt.executeQuery(sql);
				ArrayList<HashMap<String,String>> list = new  ArrayList<HashMap<String,String>>();
					
				ResultSetMetaData rsmd = rs.getMetaData();
				int columnCount = rsmd.getColumnCount();
				
				while (rs.next()) {
					
					HashMap<String,String> map = new HashMap<String,String>();	
					
					for (int i = 1; i <= columnCount; i++) {
						map.put(rsmd.getColumnName(i), rs.getString(rsmd.getColumnName(i)));
					}
					list.add(map);
				}
				rs.close();
				return list;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
	}
	public void close() {
		try {
			stmt.close();
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
