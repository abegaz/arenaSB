package arena_source;

import java.util.ArrayList;

public class League {
	protected String name;
	protected ArrayList<Team> teams = new ArrayList<>();
	protected int leagueSize = 0;
	
	League(String name) {
		this.name = name;
	}
	
	public void addTeam(Team team) {
		teams.add(team);
		leagueSize++;
	}
	
	public void printTeams() {
		for(Team team : teams) {
			System.out.println(team.teamName);
		}
		System.out.println();
	}
}
