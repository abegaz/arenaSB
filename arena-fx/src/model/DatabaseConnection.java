package model;

import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;

import application.Main;

import com.mysql.jdbc.PreparedStatement;

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
	}
	
	public void createUser(String username, String email, String hashPassword) {
		String queryUser = "INSERT INTO user (Username, Email, DateJoined) VALUES('"+ username +"', '"+email+"', NOW());"; 
		String queryPassword = "INSERT INTO passwords (UIDno, encrypted) VALUES(LAST_INSERT_ID(), '"+hashPassword+"');";
		int createSuccess = 1;
		try {
			conn.setAutoCommit(false);
			PreparedStatement prepStatementUser = (PreparedStatement) conn.prepareStatement(queryUser);
			PreparedStatement prepStatementPass = (PreparedStatement) conn.prepareStatement(queryPassword);
		    // execute the preparedstatement
		    prepStatementUser.execute();
		    prepStatementPass.execute();
		    conn.commit();
		    conn.close();
		    createSuccess = 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(createSuccess == 0) {
			// Stores user meta-data that can be rendered to the screen.
			Main.userMetaData.put("Username", username);
			Main.userMetaData.put("Email", email);
			Main.userMetaData.put("LoginTime", LocalDateTime.now());
			URL url = this.getClass().getResource("../view/directory.html");
			Main.engine.load(url.toString());
			Main.engine.executeScript("document.getElementByID('test').value = " 
												+ Main.userMetaData.get("LoginTime"));
		}
		else
			System.out.println("Could not create the user " + username + ".");
		System.out.println(Main.userMetaData.get("LoginTime"));
		System.out.println("Username: " + username + "\nPassword: " + hashPassword);
	}
	
	public void loginUser(String username, String password) {
//		This is the code for the redirect
//		Call this if user is found
		URL url = this.getClass().getResource("../view/directory.html");
		Main.engine.load(url.toString());
		
		String storedPassword = null;
		String query = "SELECT encrypted FROM passwords as p," + 
					   "user as u WHERE u.Username LIKE 'nameEntry' AND p.UIDno = u.UID";
		try {
			Statement st = conn.createStatement();
			ResultSet loginStatement = st.executeQuery(query);
		    storedPassword = loginStatement.getString("passwords");
			System.out.println(storedPassword);
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Username: " + username + "\nPassword: " + password);
	}
}
