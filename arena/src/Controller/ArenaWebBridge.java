package controller;

import org.apache.commons.codec.digest.DigestUtils;

import model.DatabaseConnection;

import static org.apache.commons.codec.digest.MessageDigestAlgorithms.SHA_256;;

public class ArenaWebBridge {
	public ArenaWebBridge() {}
	DatabaseConnection db = new DatabaseConnection("http://67.205.191.64","root", "arenasb");
	
	public void submitUser(String username, String password) {
		String hashPassword = new DigestUtils(SHA_256).digestAsHex(password);
		db.createUser("test@gmail.com", username, hashPassword);
	}
}
