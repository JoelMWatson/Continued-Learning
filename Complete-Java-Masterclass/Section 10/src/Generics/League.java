package Generics;

import java.util.ArrayList;
import java.util.Collections;

public class League<T extends Team> {

    ArrayList<T> teams;

    public League() {
        this.teams = new ArrayList<>();
    }

    public boolean add(T team) {
        if (teams.contains(team.getName())) {
            return false;
        } else {
            teams.add(team);
            return true;
        }
    }

    public void printLeague() {
        Collections.sort(this.teams);
        for (T t: this.teams) {
            System.out.println(t.getName() + ": " + t.ranking());
        }
    }
}
