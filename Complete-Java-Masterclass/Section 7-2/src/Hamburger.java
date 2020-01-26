public class Hamburger extends MenuItem {

    private String bread;
    private String meat;
    private MenuItem additions[];

    public Hamburger() {
        this("Hamburger", 3.00, "White", "Ground Beef", new MenuItem[4]);
    }

    public Hamburger(String name, double price, String bread, String meat, MenuItem[] additions) {
        super(name, price);
        this.bread = bread;
        this.meat = meat;
        this.additions = additions;
        System.out.println(this.getName() + " Created.");
    }

    public double getCost() {
        double total = this.getPrice();
        for (int i = 0; i < this.additions.length; i++) {
            total = total + additions[i].getPrice();
        }
        return total;
    }

    public void addAddition(MenuItem addition) {
        for (int i=0; i < this.additions.length; i++) {
            if (additions[i] == null) {
                additions[i] = addition;
                System.out.println(addition.getName() + " Added.");
                return;
            }
        }
        System.out.println("You have no more additions to add on this burger.");
    }

    public String getBread() {
        return bread;
    }


    public String getMeat() {
        return meat;
    }

    public MenuItem[] getAdditions() {
        return additions;
    }

    public static void main(String[] args) {
        // create burger add 4 items to it check price
        Hamburger burger = new Hamburger();
        // add 4 items
        burger.addAddition(new MenuItem("Lettuce", 0.50));
        burger.addAddition(new MenuItem("Lettuce", 0.50));
        burger.addAddition(new MenuItem("Lettuce", 0.50));
        burger.addAddition(new MenuItem("Lettuce", 0.50));
        //try to add 5th and fail
        burger.addAddition(new MenuItem("Lettuce", 0.50));
        // check price
        burger.getCost();
        // create healthy burger add 6 items and check price
        HealthyBurger healthy = new HealthyBurger();
        // add 6 items
        healthy.addAddition(new MenuItem("Lettuce", 0.50));
        healthy.addAddition(new MenuItem("Lettuce", 0.50));
        healthy.addAddition(new MenuItem("Lettuce", 0.50));
        healthy.addAddition(new MenuItem("Lettuce", 0.50));
        healthy.addAddition(new MenuItem("Lettuce", 0.50));
        healthy.addAddition(new MenuItem("Lettuce", 0.50));
        // try to add 7th and fail
        healthy.addAddition(new MenuItem("Lettuce", 0.50));
        // check price
        healthy.getCost();
        // create deluxe burger check additions and price check
        DeluxeBurger deluxe = new DeluxeBurger();
        // try to add item and fail
        deluxe.addAddition(new MenuItem("Lettuce", 0.50));
        MenuItem[] additions = deluxe.getAdditions();
        System.out.println("Additions:");
        for(int i=0; i<additions.length; i++) {
            System.out.println(additions[i].getName());
        }
    }
}

