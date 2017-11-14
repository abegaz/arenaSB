package controller;

import org.apache.commons.codec.digest.DigestUtils;

import model.DatabaseConnection;

import static org.apache.commons.codec.digest.MessageDigestAlgorithms.SHA_256;;

public class ArenaWebBridge {
	DatabaseConnection db;
	public ArenaWebBridge() {
		db = new DatabaseConnection("jdbc:mysql://67.205.191.64/arena","root", "arenasb");
	}

	
	public void createUser(String username, String email, String password) {
		String hashPassword = new DigestUtils(SHA_256).digestAsHex(password);
		db.createUser(username, email, hashPassword);
	}
}
