package AbstractClasses;

public class BST implements ItemList {

    private ListItem root = null;

    public BST(ListItem root) {
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
        return addNode(this.root, item);
    }

    private boolean addNode(ListItem base, ListItem item) {
        int comparison = item.compareTo(base);
        if (comparison == 0) {
            System.out.println(item.getValue() + " was already in the Tree");
            return false;
        } else if (comparison < 0) {
            // leftLink
            if (base.getLeftLink() == null) {
                base.setLeftLink(item);
                System.out.println("Adding " + item.getValue());
                return true;
            } else {
                addNode(base.getLeftLink(), item);
                return true;
            }
        } else if (comparison > 0) {
            // rightLink
            if (base.getRightLink() == null) {
                base.setRightLink(item);
                System.out.println("Adding " + item.getValue());
                return true;
            } else {
                addNode(base.getRightLink(), item);
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean removeNode(ListItem item) {
        return false;
    }

    @Override
    public void traverse(ListItem base) {
        if (base.getLeftLink() != null) {
            traverse(base.getLeftLink());
        }
        System.out.println(base.getValue());
        if (base.getRightLink() != null) {
            traverse(base.getRightLink());
        }
    }

    private boolean found(ListItem base, ListItem item) {
        int comparison = item.compareTo(base);
        if (comparison == 0) {
            return true;
        } else if (comparison < 0) {
            // leftLink
            if (base.getLeftLink() == null) {
                return false;
            } else {
                return found(base.getLeftLink(), item);
            }
        } else if (comparison > 0) {
            // rightLink
            if (base.getRightLink() == null) {
                return false;
            } else {
                return found(base.getRightLink(), item);
            }
        }
        return false;
    }
}
