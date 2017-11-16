package application;

import javafx.scene.layout.AnchorPane;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;

import javafx.fxml.*;

public class MainController {
	@FXML AnchorPane webPane;
	@FXML WebView webView;
	WebEngine engine;
	
	MainController() {}
	public void startWebEngine() {
		engine = webView.getEngine();
		engine.loadContent("http://67.205.191.64");
	}
}
