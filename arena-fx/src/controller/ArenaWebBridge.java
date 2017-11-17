package controller;

import org.apache.commons.codec.digest.DigestUtils;

import model.DatabaseConnection;

import static org.apache.commons.codec.digest.MessageDigestAlgorithms.SHA_256;

import java.net.URL;
import java.time.LocalTime;

import application.Main;

public class ArenaWebBridge{

	DatabaseConnection db = new DatabaseConnection("jdbc:mysql://67.205.191.64/arena","root", "arenasb");
	public ArenaWebBridge() {
		System.out.println(LocalTime.now() + " Starting ArenaWebBridge");
	}

	public void createUser(String username, String email, String password) {
		System.out.println(LocalTime.now() + " Creating user "+username);
		
		String hashPassword = new DigestUtils(SHA_256).digestAsHex(password);
		db.createUser(username, email, hashPassword);
		// Gets boolean value to see if the user should be redirected after successful sign up.
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		URL url = this.getClass().getResource("../view/directory.html");
		Main.engine.load(url.toString());
		/*
		Runnable r = () -> {
			if(createUser != false) {
		    		URL url = this.getClass().getResource("../view/directory.html");
		    		Main.engine.load(url.toString());
			}
		};
		Thread t = new Thread(r);
		t.start();
		*/
	}
	public void createTeam(String team) {
		System.out.println("Team: " +team);
		db.createTeam(team);
	}
	public void loginUser(String username, String password) {
		String hashPassword = new DigestUtils(SHA_256).digestAsHex(password);
		db.loginUser(username, hashPassword);
	}
}
