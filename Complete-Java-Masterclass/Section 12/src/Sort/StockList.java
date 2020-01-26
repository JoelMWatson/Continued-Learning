package Sort;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/16/2019
 * Project: Section 12
 * Description: ...
 */

public class StockList {

    private final Map<String, StockItem> list;

    public StockList() {
        this.list = new LinkedHashMap<>();
    }

    public int addStock(StockItem item) {
        if (item != null) {
            // Checks if already have quantities of this item
            StockItem inStock = list.getOrDefault(item.getName(), item);
            // if there are already stock of this item, adjust the quantity
            if (inStock != item) {
                item.adjustStock(inStock.getQuantityStock());
            }

            list.put(item.getName(), item);
            return item.getQuantityStock();
        }
        return 0;
    }

    public int sellStock(String item, int quantity) {
        StockItem itemObj = list.getOrDefault(item, null);
        if ((itemObj != null) && (itemObj.getQuantityStock() >= quantity) && (quantity > 0)) {
            itemObj.adjustStock(-quantity);
            itemObj.reserve(-quantity);
            return quantity;
        }
        return 0;
    }

    public int reserveStock(String item, int quantity) {
        StockItem itemObj = list.getOrDefault(item, null);
        if ((itemObj != null) ) {
            if (itemObj.reserve(quantity)) {
                return quantity;
            }
        }
        return 0;
    }

    public StockItem get(String name) {
        return list.get(name);
    }

    public Map<String, StockItem> Items() {
        return Collections.unmodifiableMap(list);
    }

    public Map<String, Double> PriceList() {
        Map<String, Double> prices = new LinkedHashMap<>();
        for (Map.Entry<String, StockItem> item : list.entrySet()) {
            prices.put(item.getKey(), item.getValue().getPrice());
        }
        return Collections.unmodifiableMap(prices);
    }

    @Override
    public String toString() {
        String s = "\nStock List\n";
        double totalCost = 0.0;
        for (Map.Entry<String, StockItem> item : list.entrySet()) {
            StockItem stockItem = item.getValue();
            double itemValue = stockItem.getPrice() * stockItem.getQuantityStock();
            s = s + stockItem + ". There are " + stockItem.getQuantityStock() + " in stock with ";
            s = s + stockItem.getReserved() + " on reserve. Total value: " + String.format("%.2f", itemValue) + "\n";
            totalCost += itemValue;
        }

        return s + "Total stock value: " + String.format("%.2f", totalCost);
    }
}
