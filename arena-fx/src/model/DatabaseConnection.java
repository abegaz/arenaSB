package model;

import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.time.LocalTime;

import application.Main;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.Scene;
import javafx.stage.Stage;

import com.mysql.jdbc.PreparedStatement;

public class DatabaseConnection {
	private static String DB_DRIVER = "com.mysql.jdbc.Driver";
	
	public String db_url;
	public String db_user;
	public String db_pass;
	public static Connection conn;
	public static boolean loginSuccess = false;
	
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
		    
//		    conn.close(); // Causing conflicts with logging out and trying to log back in
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
			//System.out.println("Incorrect username or password!");
		}
		if(storedPassword.equals(password)) {
			System.out.print(LocalTime.now() + " Account has been verified, logging in\n");
			Platform.runLater(Main.runRedirect);
			loginSuccess = true;
		} else {
			System.out.println(LocalTime.now() + " Login Failed");
			
		} 
	}
	
	//	Pulls all the item types from the db and passes them to show.html
	public void pullItems() {
		System.out.println("Pulling items");
		
		String queryTournaments = "SELECT TrnName FROM tournament";
		String queryGames = "SELECT Name FROM game";
		String queryLeagues = "SELECT NAME FROM league";
		String queryTeams = "SELECT NAME FROM team";
		try {
			Statement qT = conn.createStatement();
			ResultSet tourns = qT.executeQuery(queryTournaments);
			
			Statement qG = conn.createStatement();
			ResultSet games = qG.executeQuery(queryGames);
			
			Statement qL = conn.createStatement();
			ResultSet leagues = qL.executeQuery(queryLeagues);
			
			Statement qTeams = conn.createStatement();
			ResultSet teams = qTeams.executeQuery(queryTeams);
			
			ArrayList<String> tournamentList = new ArrayList<String>();
			ArrayList<String> gameList = new ArrayList<String>();
			ArrayList<String> leagueList = new ArrayList<String>();
			ArrayList<String> teamList = new ArrayList<String>();
			
			while (tourns.next()) {
				tournamentList.add(tourns.getString(1));
			}
			while (games.next()) {
				gameList.add(games.getString(1));
			}
			while (leagues.next()) {
				leagueList.add(leagues.getString(1));
			}
			while (teams.next()) {
				teamList.add(teams.getString(1));
			}
			
			// Pass that data to javascript
			
			Main.engine.executeScript("dataTransfer("+toJsArr(gameList)+", "+toJsArr(leagueList)+", "+toJsArr(tournamentList)+", "+ toJsArr(teamList) +")");
			
			qT.close();
			qG.close();
			qL.close();
			qTeams.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	 
	public void createGame(String name) {
		// This is for creating games and such.
		 
		String queryGame = "INSERT INTO game (name) VALUES('"+ name +"')";
		try {
			conn.setAutoCommit(false);
			PreparedStatement prepStatementGame = (PreparedStatement) conn.prepareStatement(queryGame);
		    // execute the prepared statement
		    prepStatementGame.execute();
		    conn.commit();
		//    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		System.out.println("Game name: " + name); 
		
	}
	public void createTournament(String trnname, String leagueName) {
		// This is for creating games and such.
		 
		String queryTournament = "INSERT INTO tournament (TrnName, leagueID) VALUES('"+ trnname +"', (SELECT LID FROM league WHERE NAME LIKE '"+leagueName+"'))";
		try {
			System.out.println(trnname + "\t" + leagueName); // debug operation
			conn.setAutoCommit(false);
			PreparedStatement prepStatementGame = (PreparedStatement) conn.prepareStatement(queryTournament);
		    // execute the prepared statement
		    prepStatementGame.execute();
		    conn.commit();
	     //   conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		System.out.println("Tournament name: " + trnname);
	
    }	
	public void createLeague(String name) {
		// This is for creating games and such.
		 
		String queryLeague = "INSERT INTO league (name) VALUES('"+ name +"')";
		try {
			conn.setAutoCommit(false);
			PreparedStatement prepStatementGame = (PreparedStatement) conn.prepareStatement(queryLeague);
		    // execute the prepared statement
		    prepStatementGame.execute();
		    conn.commit();
		//    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		System.out.println("League name: " + name);
		
  }
	
	public void createTeam(String name, String ownerName) {
		String queryTeam = "INSERT INTO team (Name, OwnerID) VALUES('"+ name +"',(SELECT UID FROM user WHERE Username LIKE '"+ownerName+"'));"; 
		try {
			System.out.println(name + "\t" + ownerName); // debug operation
			conn.setAutoCommit(false);
			PreparedStatement prepStatementTeam = (PreparedStatement) conn.prepareStatement(queryTeam);
		    // execute the prepared statement
		    prepStatementTeam.execute();
		    conn.commit();
		//    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Team Name: " + name);
	}
	
	
	public static void closeConnection() throws SQLException {
		 if(conn != null) {
			 try {
				 conn.close();
				 System.out.println(LocalTime.now() + " Connection has been terminated");
		     } catch (SQLException se) {
		    	 	se.printStackTrace();
		     } 
		 }  
	}

	//	JS Array Helper
	private String toJsArr(ArrayList<String> arr) {
        StringBuffer sb = new StringBuffer();
        sb.append("[");

        for (String str : arr)
            sb.append("\"").append(str).append("\"").append(", ");

        if (sb.length() > 1)
            sb.replace(sb.length() - 2, sb.length(), "");

        sb.append("]");

        return sb.toString();
    }
}

