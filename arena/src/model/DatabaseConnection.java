package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {
	private static String DB_DRIVER = "com.mysql.jdbc.Driver";
	private static String DB_URL = "67.205.191.64";
	
	private static String DB_USER = "root";
	private static String DB_PASS = "arenasb";
	
	public static void newConnection() {
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName(DB_DRIVER);
			
			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASS);
			
		}catch(SQLException se) {
		      //Handle errors for JDBC
		      se.printStackTrace();
		} catch(Exception e) {
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
	}
}
