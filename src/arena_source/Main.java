package arena_source;

public class Main {
	public static void main(String [] args) throws InterruptedException {
		Player luke = new Player("Luke Brady", 20, false);
		Thread.sleep(5000);
		Player jamie = new Player("Jamie Forester", 21, true);
		Thread.sleep(5000);
		Player connor = new Player("Connor Calhoun", 21, false);
		Thread.sleep(5000);
		Player dane = new Player("Dane Carpenter", 22, false);
		Player [] players = {luke,jamie,connor,dane};
		
		Team lol = new Team("League of Legends", players);
		lol.printTeam();
		
	}
}
