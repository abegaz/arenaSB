package model;

import static org.apache.commons.codec.digest.MessageDigestAlgorithms.SHA_256;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.commons.codec.digest.DigestUtils;

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
		String hashPassword = new DigestUtils(SHA_256).digestAsHex(password);
		String query = "BEGIN;\n" + 
				"INSERT INTO user (Username, Email, DateJoined) VALUES('"+ username +"', '"+ email +"', NOW());\n" + 
				"INSERT INTO passwords (UIDno, encrypted) VALUES(LAST_INSERT_ID(), '"+  hashPassword +"');\n" + 
				"COMMIT;";
		try {
			conn.prepareStatement(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Username: " + username + "\nPassword: " + password);
	}
	
	public void loginUser(String username, String password) {
		String hashPassword = new DigestUtils(SHA_256).digestAsHex(password);
		String query = "SELECT encrypted FROM passwords as p," + 
					   "user as u WHERE u.Username LIKE 'nameEntry' AND p.UIDno = u.UID";
		try {
			conn.prepareStatement(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Username: " + username + "\nPassword: " + password);
	}
}
