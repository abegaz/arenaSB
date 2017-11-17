package model;

import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.LinkedList;
import java.time.LocalTime;

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
			System.out.println(LocalTime.now() + " Successfully connected to the database");
			conn = DriverManager.getConnection(db_url,db_user,db_pass);
		} catch(SQLException se) {
		      //Handle errors for JDBC
		      se.printStackTrace();
		} catch(Exception e) {
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
	}
	public void createTeam(String team) {
		String queryTeam = "INSERT INTO team (Name) VALUES('"+ team +"', NOW());"; 
		try {
			conn.setAutoCommit(false);
			PreparedStatement prepStatementTeam = (PreparedStatement) conn.prepareStatement(queryTeam);
		    // execute the preparedstatement
		    prepStatementTeam.execute();
		    conn.commit();
		    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Team Name: " + team);
	}
	public boolean createUser(String username, String email, String hashPassword) {
		String queryUser = "INSERT INTO user (Username, Email, DateJoined) VALUES('"+ username +"', '"+email+"', NOW());"; 
		String queryPassword = "INSERT INTO passwords (UIDno, encrypted) VALUES(LAST_INSERT_ID(), '"+hashPassword+"');";
		boolean createSuccess = false;
		try {
			conn.setAutoCommit(false);
			PreparedStatement prepStatementUser = (PreparedStatement) conn.prepareStatement(queryUser);
			PreparedStatement prepStatementPass = (PreparedStatement) conn.prepareStatement(queryPassword);
		    // execute the preparedstatement
		    prepStatementUser.execute();
		    prepStatementPass.execute();
		    conn.commit();
		    conn.close();
		    createSuccess = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(createSuccess == true) {
			// Stores user meta-data that can be rendered to the screen.
			Main.userMetaData.put("Username", username);
			Main.userMetaData.put("Email", email);
			Main.userMetaData.put("LoginTime", LocalDateTime.now());
		}
		else
			System.out.println("Could not create the user " + username + ".");
		System.out.println(Main.userMetaData.get("LoginTime"));
		System.out.println("Username: " + username + "\nPassword: " + hashPassword);
		
		return createSuccess;
	}
	
	public void loginUser(String username, String password) {
		// This is the code for the redirect
		// Call this if user is found
		
		String storedPassword = null;
		String query = "SELECT encrypted FROM passwords as p, user as u WHERE u.Username LIKE '"+ username +"' AND p.UIDno = u.UID";
		try {
			Statement st = conn.createStatement();
			ResultSet loginStatement = st.executeQuery(query);
			while(loginStatement.next())
		    		storedPassword = loginStatement.getString(1);
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(storedPassword.equals(password)) {
			System.out.print(LocalTime.now() + " Account has been verified, logging in");
			URL url = this.getClass().getResource("../view/directory.html");
			Main.engine.load(url.toString());
		}
	}
	
//	Pulls all the item types from the db and passes them to show.html
	public void pullItems() {
		System.out.println("Pulling items");
		
		String queryTournaments = "SELECT TrnName FROM tournament";
		String queryGames = "SELECT Name FROM game";
		String queryLeagues = "SELECT NAME FROM league";
		try {
			Statement qT = conn.createStatement();
			ResultSet tourns = qT.executeQuery(queryTournaments);
			
			Statement qG = conn.createStatement();
			ResultSet games = qG.executeQuery(queryGames);
			
			Statement qL = conn.createStatement();
			ResultSet leagues = qL.executeQuery(queryLeagues);
			
			LinkedList<String> tournamentList = new LinkedList<String>();
			LinkedList<String> gameList = new LinkedList<String>();
			LinkedList<String> leagueList = new LinkedList<String>();
			
			while (tourns.next()) {
				tournamentList.push(tourns.getString(1));
			}
			while (games.next()) {
				gameList.push(games.getString(1));
			}
			while (leagues.next()) {
				leagueList.push(leagues.getString(1));
			}
			
			System.out.println(tournamentList.toString()+"\n"+gameList.toString()+"\n"+leagueList.toString());
			
			tourns.next();
			String foundType = tourns.getString(1);
			System.out.println(foundType);
			
			qT.close();
			qG.close();
			qL.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
