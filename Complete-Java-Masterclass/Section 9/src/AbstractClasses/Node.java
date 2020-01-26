package AbstractClasses;

public class Node extends ListItem {

    public Node(Object value) {
        super(value);
    }

    @Override
    public ListItem getLeftLink() {
        return this.leftLink;
    }

    @Override
    public ListItem getRightLink() {
        return this.rightLink;
    }

    @Override
    public ListItem setRightLink(ListItem item) {
        this.rightLink = item;
        return this.rightLink;
    }

    @Override
    public ListItem setLeftLink(ListItem item) {
        this.leftLink = item;
        return this.leftLink;
    }

    // Since we are testing with String
    @Override
    public int compareTo(ListItem listItem) {
        if (listItem != null) {
            return ((String) super.getValue()).compareTo((String) listItem.getValue());
        }
        return -1;
    }
}
