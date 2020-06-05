package AbstractClasses;

public abstract class ListItem {

    protected ListItem leftLink = null;
    protected ListItem rightLink = null;
    protected Object value;

    public ListItem(Object value) {
        this.value = value;
    }

    public Object getValue() {
        return this.value;
    }

    public void setVal(Object object) {
        this.value = object;
    }

    public abstract ListItem getLeftLink();
    public abstract ListItem getRightLink();
    public abstract ListItem setRightLink(ListItem item);
    public abstract ListItem setLeftLink(ListItem item);

    public abstract int compareTo(ListItem listItem);

}
