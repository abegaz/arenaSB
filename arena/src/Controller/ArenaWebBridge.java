package controller;

import org.apache.commons.codec.digest.DigestUtils;

import static org.apache.commons.codec.digest.MessageDigestAlgorithms.SHA_256;;

public class ArenaWebBridge {
	public ArenaWebBridge() {}
	
	public void submitUser(String username, String password) {
		String hashPassword = new DigestUtils(SHA_256).digestAsHex(password);
		System.out.println("Username: " + username + "\nPassword: " + hashPassword);
	}
}
