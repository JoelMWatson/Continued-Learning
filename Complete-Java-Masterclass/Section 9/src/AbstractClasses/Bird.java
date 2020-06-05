package AbstractClasses;

public abstract class Bird extends Animal implements CanFly {
    public Bird(String name) {
        super(name);
    }

    @Override
    public void eat() {
        System.out.println(getName() + " pecks at their food.");
    }

    @Override
    public void breathe() {
        System.out.println("Breathe, flap flap flap flap....Breathe, flap flap flap flap...");
    }

    @Override
    public void fly() {
        System.out.println("Flapping its wings.");
    }
}
