package application;

import java.net.URL;

import controller.ArenaWebBridge;
import java.util.HashMap;
import javafx.application.Application;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.stage.Stage;
import netscape.javascript.JSObject;
import javafx.scene.Scene;
import javafx.scene.layout.VBox;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;
import javafx.concurrent.Worker.State;

public class Main extends Application {
	public static WebEngine engine;
	public static HashMap<String, Object> userMetaData = new HashMap<>();
	ArenaWebBridge bridge = new ArenaWebBridge();
	
	@Override
	public void start(Stage primaryStage) {
		WebView browser = new WebView();
		browser.setPrefHeight(1080.00);
		engine = browser.getEngine();
		
		// String url = "../view/index.html";
		URL url = this.getClass().getResource("../view/index.html");
		engine.load(url.toString());
		
		VBox root = new VBox();
		root.getChildren().addAll(browser);
		
		Scene scene = new Scene(root, 1080, 840);
		primaryStage.setScene(scene);
		
		primaryStage.show();
		
		// engine.executeScript(script) // <--- Execute javascript from JavaFX code
		
		// Creates a JSObject, and can execute functions in the JavaFX Code
		engine.getLoadWorker().stateProperty().addListener( new ChangeListener<State>() {
			public void changed(@SuppressWarnings("rawtypes") ObservableValue ov, State oldState, State newState) {
				if (newState == State.SUCCEEDED) {
					JSObject js = (JSObject) engine.executeScript("window"); 
			        	js.setMember("app", bridge);
			        
		        }
		    }
		});
	}
	
	public static void main(String[] args) {
		launch(args);
	}
}
