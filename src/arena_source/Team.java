package arena_source;

import java.util.Calendar;
import java.util.Date;

public class Team {
	public String teamName;
	public Player[] players;
	private int wins;
	private int losses;
	private Date creationTime;
	
	Team(String teamName, Player[] players) {
		Calendar time = Calendar.getInstance();
		this.teamName = teamName;
		this.players = players;
		this.setCreationTime(time.getTime());
	}
	/*
	public void addPlayerTeams() {
		for(Player player : players) {
			player.memberOf.add(teamName);
			player.memberSize++;
		}
	}
	*/

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
	
	public void printTeam() {
		System.out.println("Team: " + teamName);
		System.out.println("Created: " + creationTime + "\n");
		for(Player player : players) {
			player.getPlayerStats();
		}
	}

	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}
}
