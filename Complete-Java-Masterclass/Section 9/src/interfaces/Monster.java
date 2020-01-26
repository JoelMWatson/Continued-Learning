package interfaces;

import java.util.ArrayList;
import java.util.List;

public class Monster implements ISaveable {

    private String name;
    private int health;
    private int power;

    public Monster() {
        this("Generic Monster", 2, 10);
    }

    public Monster(String name, int power, int health) {
        this.name = name;
        this.health = health;
        this.power = power;
    }

    public String getName() {
        return name;
    }

    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
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
        return "Monster{" +
                "name='" + name + '\'' +
                ", health=" + health +
                ", power=" + power +
                '}';
    }
}
