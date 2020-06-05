package AbstractClasses;

public class Ostrich extends Bird {

    public Ostrich(String name) {
        super(name);
    }

    @Override
    public void fly() {
        super.fly();
        System.out.println("Wings too small for my body to fly...but check out these legs.");
    }
}
