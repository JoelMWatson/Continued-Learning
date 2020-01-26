package AbstractClasses;

public class MainPractice {

    public static void main(String[] args) {
        Dog dog = new Dog("Dug the dog");
        dog.breathe();
        dog.eat();

        Bird parrot = new Parrot("Patty the parrot");
        parrot.breathe();
        parrot.eat();
        parrot.fly();

        Bird ostrich = new Ostrich("Ozzy the ostrich");
        ostrich.breathe();
        ostrich.eat();
        ostrich.fly();

    }
}
