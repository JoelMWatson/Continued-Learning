package Generics;

import java.util.ArrayList;

public class Team<T extends Player> implements Comparable<Team<T>> {

    private String name;
    private ArrayList<T> members = new ArrayList<>();
    private int played = 0;
    private int won = 0;
    private int lost = 0;
    private int tied = 0;

    public Team(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public ArrayList<T> getMembers() {
        return members;
    }

    public int getPlayed() {
        return played;
    }

    public int getWon() {
        return won;
    }

    public int getLost() {
        return lost;
    }

    public int getTied() {
        return tied;
    }

    public boolean addPlayer(T player) {
        if (members.contains(player)) {
            System.out.println(((Player) player).getName() + " is already on the team.");
            return false;
        } else {
            members.add(player);
            System.out.println(((Player) player).getName() + " was added to the team.");
            return true;
        }
    }

    public int numPlayers() {
        return this.members.size();
    }
;
    public void matchResult(Team<T> opponenet, int ourScore, int theirScore) {

        String message;
        if (ourScore > theirScore) {
            this.won++;
            message = " beat ";
        } else if (ourScore == theirScore) {
            this.tied++;
            message = " tied ";
        } else {
            this.lost++;
            message = " lost to ";
        }
        this.played++;
        if (opponenet != null) {
            System.out.println(this.getName() + message + opponenet.getName());
            opponenet.matchResult(null, theirScore, ourScore);
        }
    }

    public int ranking() {
        return (this.won * 2) + tied;
    }

    @Override
    public int compareTo(Team<T> team) {
        if (this.ranking() > team.ranking()) {
            return -1;
        } else if (this.ranking() < team.ranking()) {
            return 1;
        } else {
            return 0;
        }
    }
}
