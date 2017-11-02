package application;
	
import java.net.URL;

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
	
	public static void main(String[] args) {
		launch(args);
	}
	
	@Override
	public void start(Stage primaryStage) {
		WebView browser = new WebView();
		WebEngine engine = browser.getEngine();
		
		URL index = getClass().getResource("/com/application/view/index.html");
		engine.load(index.toString());
		
		VBox root = new VBox();
		root.getChildren().addAll(browser);
		
		Scene scene = new Scene(root, 1200, 600);
		primaryStage.setScene(scene);
		
		primaryStage.show();
		
		
		// engine.executeScript(script) // <--- Execute javascript from JavaFX code
		
		// Creates a JSObject, and can execute functions in the JavaFX Code
		engine.getLoadWorker().stateProperty().addListener(
				new ChangeListener<State>() {
		            public void changed(ObservableValue ov, State oldState, State newState) {
		                if (newState == State.SUCCEEDED) {
			                	JSObject js = (JSObject) engine.executeScript("window"); 
			            		js.setMember("app", new Bridge());
		                }
		            }
		        });
		
	}
	
	public class Bridge {
		public void submitUser() {
			System.out.println("User form has been submitted");
		}
	}
}
