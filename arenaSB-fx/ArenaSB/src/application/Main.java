package application;
	
import java.net.URL;

import javafx.application.Application;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.layout.VBox;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;

public class Main extends Application {
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
	}
	
	public static void main(String[] args) {
		launch(args);
	}
}
