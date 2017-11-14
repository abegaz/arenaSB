package controller;

import org.apache.commons.codec.digest.DigestUtils;

import model.DatabaseConnection;

import static org.apache.commons.codec.digest.MessageDigestAlgorithms.SHA_256;;

public class ArenaWebBridge {
	public ArenaWebBridge() {}
	DatabaseConnection db = new DatabaseConnection("http://67.205.191.64/arenadb","root", "arenasb");
	
	public void createUser(String username, String email, String password) {
		String hashPassword = new DigestUtils(SHA_256).digestAsHex(password);
		db.createUser(username, email, hashPassword);
	}
}
