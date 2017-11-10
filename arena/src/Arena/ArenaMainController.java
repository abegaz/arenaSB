package Arena;

import javafx.scene.layout.AnchorPane;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;

import javafx.fxml.*;

public class ArenaMainController {
	@FXML AnchorPane webPane;
	@FXML WebView webView;
	WebEngine engine;
	
	ArenaMainController() {}
	public void startWebEngine() {
		engine = webView.getEngine();
		engine.loadContent("http://67.205.191.64");
	}
}
