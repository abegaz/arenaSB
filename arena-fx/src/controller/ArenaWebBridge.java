package controller;

import org.apache.commons.codec.digest.DigestUtils;

import model.DatabaseConnection;

import static org.apache.commons.codec.digest.MessageDigestAlgorithms.SHA_256;

import java.net.URL;
import java.time.LocalTime;

import application.Main;

public class ArenaWebBridge{

	DatabaseConnection db;
	public ArenaWebBridge() {
		System.out.println(LocalTime.now() + " Starting ArenaWebBridge");
	}

	public void createUser(String username, String email, String password) {
		System.out.println("Creating User: "+username);
		
		db = new DatabaseConnection("jdbc:mysql://67.205.191.64/arena","root", "arenasb");
		String hashPassword = new DigestUtils(SHA_256).digestAsHex(password);
		boolean createUser = db.createUser(username, email, hashPassword);
		// Gets boolean value to see if the user should be redirected after successful sign up.
		if(createUser != false) {
	    		URL url = this.getClass().getResource("../view/directory.html");
	    		Main.engine.load(url.toString());
		}
	}
	
	public void loginUser(String username, String password) {
		System.out.println("Username: "+username+"\nPassword: "+password);
		
		db = new DatabaseConnection("jdbc:mysql://67.205.191.64/arena","root", "arenasb");
		String hashPassword = new DigestUtils(SHA_256).digestAsHex(password);
		db.loginUser(username, hashPassword);
	}
}
