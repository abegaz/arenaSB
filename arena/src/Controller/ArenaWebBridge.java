package controller;

import org.apache.commons.codec.digest.DigestUtils;
import static org.apache.commons.codec.digest.MessageDigestAlgorithms.SHA_256;;

public class ArenaWebBridge {
	public ArenaWebBridge() {}
	
	public void getCredentials(String userName, String passWord) {
		String hashPassword = new DigestUtils(SHA_256).digestAsHex(passWord);
		System.out.println("Username: " + userName + "\nPassword: " + hashPassword);
	}
}
