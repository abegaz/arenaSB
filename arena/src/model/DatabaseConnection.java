package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static String DB_DRIVER = "com.mysql.jdbc.Driver";
	public String db_url;
	public String db_user;
	public String db_pass;
	public Connection conn;
	
	public DatabaseConnection(String db_url, String db_user, String db_pass) {
		this.db_url = db_url;
		this.db_user = db_user;
		this.db_pass = db_pass;
		Connection conn = null;
		try {
			Class.forName(DB_DRIVER);
			conn = DriverManager.getConnection(db_url,db_user,db_pass);
		} catch(SQLException se) {
		      //Handle errors for JDBC
		      se.printStackTrace();
		} catch(Exception e) {
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		this.conn = conn;
	}
	
	public void createUser(String username, String email, String password) {
		String query = "BEGIN;\n" + 
				"INSERT INTO user (Username, Email, DateJoined) VALUES('"+ username +"', '"+ email +"', NOW());\n" + 
				"INSERT INTO passwords (UIDno, encrypted) VALUES(LAST_INSERT_ID(), '"+  password +"');\n" + 
				"COMMIT;";
		try {
			conn.prepareStatement(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Username: " + username + "\nPassword: " + password);
	}
}
