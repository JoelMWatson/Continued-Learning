package Sort;

import java.util.Collections;
import java.util.Map;
import java.util.TreeMap;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/16/2019
 * Project: Section 12
 * Description: ...
 */

public class Basket {

    private final String name;
    private final Map<StockItem, Integer> list;

    public Basket(String name) {
        this.name = name;
        this.list = new TreeMap<>();
    }

    public int addToBasket(StockItem item, int quantity) {
        if ((item != null)) {
            int inBasket = list.getOrDefault(item, 0);
            list.put(item, inBasket + quantity);
            if (list.get(item) == 0){
                list.remove(item);
            }
            return inBasket;
        }
        return 0;
    }

    public void clear() {
        list.clear();
    }

    public Map<StockItem, Integer> Items() {
        return Collections.unmodifiableMap(list);
    }

    @Override
    public String toString() {
        String s = "\nShopping basket: " + name + " contains " + list.size() + " items\n";
        double totalCost = 0.0;
        for (Map.Entry<StockItem, Integer> item : list.entrySet()) {
            s = s + item.getKey() + ", " + item.getValue() + " in basket\n";
            totalCost += item.getKey().getPrice() * item.getValue();
        }
        return s + "Total cost: " + totalCost;
    }
}
