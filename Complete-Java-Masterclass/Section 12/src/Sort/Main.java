package Sort;

import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/16/2019
 * Project: Section 12
 * Description: ...
 */

public class Main {

    private static StockList list = new StockList();

    public static void main(String[] args) {
        StockItem temp = new StockItem("bread", 0.86, 100);
        list.addStock(temp);

        temp = new StockItem("cake", 1.10, 7);
        list.addStock(temp);

        temp = new StockItem("car", 12.50, 2);
        list.addStock(temp);

        temp = new StockItem("juice", 1.50, 20);
        list.addStock(temp);

        temp = new StockItem("phone", 6.99, 80);
        list.addStock(temp);

        temp = new StockItem("vase", 8.76, 40);
        list.addStock(temp);

        temp = new StockItem("towel", 2.40, 35);
        list.addStock(temp);

        temp = new StockItem("cup", 2.00, 100);
        list.addStock(temp);

//        System.out.println(list);

        // Build Joels List
        Basket joels = new Basket("joel");
        moveItem(joels, "car", 1);
        moveItem(joels, "cup", 50);
        moveItem(joels, "towel", 5);
        moveItem(joels, "cake", 7);
        process(joels);

        // Build Tylers List
        Basket tylers = new Basket("tyler");
        moveItem(tylers, "car", 1);
        moveItem(tylers, "vase", 17);
        moveItem(tylers, "juice", 6);
        moveItem(tylers, "bread", 17);
        process(tylers);

        // Build Daniels List
        Basket daniels = new Basket("daniel");
        moveItem(daniels, "car", 1);
        moveItem(daniels, "towel", 3);
        moveItem(daniels, "cake", 5);
        process(daniels);

        System.out.println(joels);
        System.out.println(tylers);
        System.out.println(daniels);

        System.out.println(list);


    }

    public static int moveItem(Basket basket, String item, int quantity) {
        StockItem stockItem = list.get(item);
        if (stockItem == null) {
            System.out.println("We dont sell " + item);
            return 0;
        }
        if (list.reserveStock(item, quantity) != 0) {
            return basket.addToBasket(stockItem, quantity);
        }
        System.out.println("Not enough " + item + " in stock or too many already reserved");
        return 0;
    }

    public static void process(Basket basket) {
        Map items = basket.Items();
        items.forEach((k,v) -> list.sellStock(((StockItem) k).getName(), (Integer) v));
        basket.clear();
    }
}
