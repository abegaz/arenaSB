package arena_source;

public class Team {
	public String teamName;
	public Player[] players;
	private int wins;
	private int losses;
	
	Team(String teamName, Player[] players) {
		this.teamName = teamName;
		this.players = players;
	}

	public int getWins() {
		return wins;
	}

	public void setWins(int wins) {
		this.wins = wins;
	}

	public int getLosses() {
		return losses;
	}

	public void setLosses(int losses) {
		this.losses = losses;
	}
}
