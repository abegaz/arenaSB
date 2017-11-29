package application;

import java.awt.event.ActionListener;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;
import java.time.LocalTime;

import application.Main;
import model.DatabaseConnection;
import controller.ArenaWebBridge;

import java.util.HashMap;


import javafx.application.Application;
import javafx.application.Platform;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.stage.Stage;
import netscape.javascript.JSObject;
import javafx.scene.Scene;
import javafx.scene.layout.VBox;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;
import javafx.concurrent.Worker.State;
import javafx.event.ActionEvent;

public class Main extends Application {
	public static WebView browser = new WebView();
	public final static WebEngine engine = browser.getEngine();
	public static Runnable runRedirect = null;
	public static HashMap<String, Object> userMetaData = new HashMap<>();
	
	private static VBox vb = new VBox();
	
	static Stage stage = null;
	
	ArenaWebBridge bridge = new ArenaWebBridge();
	
	@Override
	public void start(Stage primaryStage) {
		stage = primaryStage;
		
		vb.setId("root");
		browser.setPrefHeight(1080.00);
		
		System.out.println(LocalTime.now() + " Creating WebEngine");
		System.out.println(LocalTime.now() + " Loading content from server");
		// String url = "../view/index.html";
		//URL url = this.getClass().getResource("../view/index.html");
		engine.load("http://67.205.191.64/index.html");
		
		vb.getChildren().addAll(browser);
		
		Scene scene = new Scene(vb, 1080, 840);
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
		
		runRedirect = () -> {
			URL directory = null;
			try {
				directory = new URL("http://67.205.191.64/directory.html");
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Main.engine.load(directory.toString());
		}; 
	}
	
	public void exitApplication(ActionEvent event) {
	   Platform.exit();
	   System.out.println("Exiting...");
	}
	
	@Override
	public void stop(){
		System.out.println(LocalTime.now() + " Exiting...");
		try {
			DatabaseConnection.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    // Save file
	}
	
	public static void main(String[] args) {
		launch(args);
	}

	
//	Testing external method to redirect
	@SuppressWarnings("null")
	public static void loadDirectory() {
		System.out.println(LocalTime.now() + " Redirecting to directory...");
		URL directory = null;
		try {
			directory = new URL("http://67.205.191.64/directory.html");
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		engine.load(directory.toString());
		
//		Create new scene, get the stage of the browser, then
//		update that stage based on new engine load.
		
		Scene scene = new Scene(browser, 1080, 840);
		stage.setScene(scene);
		stage.show();
	}
}
