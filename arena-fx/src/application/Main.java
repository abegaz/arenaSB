package application;

import java.net.URL;
import java.time.LocalTime;

import application.Main;
import controller.ArenaWebBridge;

import java.util.HashMap;


import javafx.application.Application;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.stage.Stage;
import model.DatabaseConnection;
import netscape.javascript.JSObject;
import javafx.scene.Scene;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;
import javafx.concurrent.Worker.State;

public class Main extends Application {
	public static WebView browser = new WebView();
	public final static WebEngine engine = browser.getEngine();
	public static HashMap<String, Object> userMetaData = new HashMap<>();
	
	ArenaWebBridge bridge = new ArenaWebBridge();
	
	@Override
	public void start(Stage primaryStage) {
		browser.setPrefHeight(1080.00);
		
		System.out.println(LocalTime.now() + " Creating WebEngine");
		System.out.println(LocalTime.now() + " Loading content from server");
		// String url = "../view/index.html";
		URL url = this.getClass().getResource("../view/index.html");
		engine.load(url.toString());
		
		Scene scene = new Scene(browser, 1080, 840);
		primaryStage.setScene(scene);
		
		primaryStage.show();
		
		// engine.executeScript(script) // <--- Execute javascript from JavaFX code
		
		// Creates a JSObject, and can execute functions in the JavaFX Code
		engine.getLoadWorker().stateProperty().addListener( new ChangeListener<State>() {
			public void changed(@SuppressWarnings("rawtypes") ObservableValue ov, State oldState, State newState) {
				if (newState == State.SUCCEEDED) {
					JSObject js = (JSObject) engine.executeScript("window"); 
			        	js.setMember("app", bridge);
			        	
			        	String show = "show.html";
			        	String loc = engine.getLocation().substring(engine.getLocation().length()-9);
			        	
			        	if(show.equals(loc)) {
			        		DatabaseConnection db = new DatabaseConnection("jdbc:mysql://67.205.191.64/arena","root", "arenasb");
			        		db.pullItems();
			        	}
		        }
		    }
		});
		
	}
	
	public static void main(String[] args) {
		launch(args);
	}
	
//	Testing external method to redirect
	@SuppressWarnings("null")
	public static void loadDirectory() {
		System.out.println("Redirecting to directory...");
		URL directory = Main.class.getResource("../view/directory.html");
		engine.load(directory.toString());
		Scene scene = new Scene(browser, 1080, 840);
		Stage primaryStage = null;
		primaryStage.setScene(scene);
		
		primaryStage.show();
	}
}
