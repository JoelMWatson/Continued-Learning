package AbstractClasses;

public class NodeList implements ItemList {

    private ListItem root = null;

    public NodeList(ListItem root) {
        this.root = root;
    }

    @Override
    public ListItem getRoot() {
        return this.root;
    }

    @Override
    public boolean addNode(ListItem item) {
        if (this.root == null) {
            this.root = item;
            return true;
        }
        ListItem current = root;
        while (current != null) {
            int comparison = current.compareTo(item);
            //System.out.println("Comparison for: "+ item.getValue() + " vs " + current.getValue() + " = " + comparison);
            if (comparison == 0) {
                //System.out.println(item.getValue() + " was already in the list");
                return false;
            } else if (comparison < 0) {
                if (current.getLeftLink() == null) {
                    //System.out.println("Adding " + item.getValue() + " to the end");
                    item.setLeftLink(current);
                    current.setRightLink(item);
                    return true;
                }
            } else if (comparison > 0) {
                // if currently on root
                if (current.getRightLink() == null) {
                    //System.out.println("Adding " + item.getValue() + " to the start");
                    current.setLeftLink(item);
                    item.setRightLink(current);
                    this.root = item;
                    return true;
                }
                //System.out.println("Adding " + item.getValue() + " to the middle");
                item.setLeftLink(current.getRightLink());
                item.setRightLink(current);
                current.getRightLink().setRightLink(item);
                current.setLeftLink(item);
                return true;
            }
            //System.out.println("Moving to rightLink position");
            current = current.getLeftLink();
        }
        System.out.println(item.getValue() + " was not added to the list");
        return false;
    }

    @Override
    public boolean removeNode(ListItem item) {
        if (this.root == null) {
            return false;
        }
        ListItem current = root;
        while (current != null) {
            int comparison = current.compareTo(item);
            if (comparison == 0) {
                current.getLeftLink().setLeftLink(current.getRightLink());
                current.getRightLink().setRightLink(current.getLeftLink());
                return true;
            }
            current = current.getLeftLink();
        }
        return false;
    }

    @Override
    public void traverse(ListItem root) {
        ListItem current = root;
        while (current != null) {
            System.out.println("Currently on: " + current.getValue());
            current = current.getLeftLink();
        }
    }

}
