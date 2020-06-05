package AbstractClasses;

public interface ItemList {
    ListItem getRoot();
    boolean addNode(ListItem item);
    boolean removeNode(ListItem item);
    void traverse(ListItem root);
}
