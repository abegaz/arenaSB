package arena_source;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class Player {
	private String name;
	private int age;
	private Date creationTime;
	public boolean isAdmin;
	public ArrayList<String> memberOf;
	public int memberSize = 0;
	
	Player(String name, int age, boolean isAdmin) {
		Calendar time = Calendar.getInstance();
		this.setName(name);
		this.setAge(age);
		this.setCreationTime(time.getTime());
		this.isAdmin = isAdmin;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}
	
	public void getPlayerStats() {
		System.out.println("Name: " + getName());
		System.out.println("Age: " + getAge());
		System.out.println("Created: " + getCreationTime());
		System.out.println("Admin: " + isAdmin + "\n");
		/*
		System.out.println("Member of: [");
		for(int i = 0; i <= memberSize; i++)
			System.out.print(memberOf.get(i) + ", ");
		System.out.println("]");
		*/
	}
}