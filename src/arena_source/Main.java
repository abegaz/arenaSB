package arena_source;

public class Main {
	public static void main(String [] args) throws InterruptedException {
		Player luke = new Player("Luke Brady", 20, false);
		Player jamie = new Player("Jamie Forester", 21, true);
		Player connor = new Player("Connor Calhoun", 21, false);
		Player dane = new Player("Dane Carpenter", 22, false);
		Player [] players = {luke,jamie,connor,dane};
		Player [] players2 = {connor,dane};
		
		Team lol = new Team("League of Legends", players);
		Team lol2 = new Team("Pizza Team", players2);
		League loll = new League("Competition");
		loll.addTeam(lol);
		loll.addTeam(lol2);
		loll.printTeams();
		lol.printTeam();
		lol2.printTeam();
	}
}
