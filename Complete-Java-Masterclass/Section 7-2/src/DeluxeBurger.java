public class DeluxeBurger extends Hamburger {

    public DeluxeBurger() {
        super("Deluxe Burger", 3.00, "White", "Ground Beef", new MenuItem[2]);
        addAddition(new MenuItem("Drink", 1.50));
        addAddition(new MenuItem("Fries", 1.50));
    }

}
