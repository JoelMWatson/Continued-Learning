package interfaces;

import java.util.ArrayList;
import java.util.List;

public class Player implements ISaveable {

    private String name;
    private int power;
    private int health;

    public Player() {
        this("No Name", 3, 10);
    }

    public Player(String name, int power, int health) {
        this.name = name;
        this.power = power;
        this.health = health;
    }

    @Override
    public List<String> write() {
        List<String> list = new ArrayList<String>();
        list.add(this.name);
        list.add(""+this.power);
        list.add(""+this.health);
        return list;
    }

    @Override
    public void read(List<String> list) {
        if (list != null && list.size() > 0) {
            this.name = list.get(0);
            this.power = (Integer.parseInt(list.get(1)));
            this.power = (Integer.parseInt(list.get(1)));
        }
    }

    @Override
    public String toString() {
        return "Player{" +
                "name='" + name + '\'' +
                ", health=" + health +
                ", power=" + power +
                '}';
    }
}
