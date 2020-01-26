package Generics;

import java.util.ArrayList;
import java.util.Collections;

public class MainPractice {

    public static void main(String[] args) {
        FootballPlayer joel = new FootballPlayer("Joel");
        BaseballPlayer pat = new BaseballPlayer("Pat");
        SoccerPlayer beck = new SoccerPlayer("Beck");

        Team<FootballPlayer> fbTeam = new Team<>("Bulldogs");
        fbTeam.addPlayer(joel);
//        fbTeam.addPlayer(pat);
//        fbTeam.addPlayer(beck);

        System.out.println(fbTeam.numPlayers());

        Team<BaseballPlayer> bbTeam = new Team<>("BullFrogs");
        Team<BaseballPlayer> bbTeam2 = new Team<>("BullFrogs2");
        Team<BaseballPlayer> bbTeam3 = new Team<>("BullFrogs3");
//        bbTeam.addPlayer(joel);
        bbTeam.addPlayer(pat);
//        bbTeam.addPlayer(beck);

//        Team<String> brokenTeam = new Team<>("Failure");
//        brokenTeam.addPlayer("Nope");


        bbTeam.matchResult(bbTeam2, 2, 1);
        bbTeam2.matchResult(bbTeam3, 3, 4);
        bbTeam3.matchResult(bbTeam, 3, 4);

//        bbTeam.matchResult(fbTeam, 2, 3);

        System.out.println("Rankings:");
        System.out.println(bbTeam.getName() + ": " + bbTeam.ranking());
        System.out.println(bbTeam2.getName() + ": " + bbTeam2.ranking());
        System.out.println(bbTeam3.getName() + ": " + bbTeam3.ranking());

        System.out.println(bbTeam.compareTo(bbTeam2));
        System.out.println(bbTeam2.compareTo(bbTeam));
        System.out.println(bbTeam2.compareTo(bbTeam3));
        System.out.println(bbTeam3.compareTo(bbTeam));

        ArrayList<Team<BaseballPlayer>> teams = new ArrayList<Team<BaseballPlayer>>();
        Collections.sort(teams);
    }
}
