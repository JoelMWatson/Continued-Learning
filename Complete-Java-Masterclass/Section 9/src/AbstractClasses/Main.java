package AbstractClasses;

public class Main {

    public static void main(String[] args) {
//        String stringData = "Adelaide Brisbane Canberra Darwin Joel Melbourne Perth Sydney";
        String stringData = "Darwin Brisbane Perth Melbourne Canberra Adelaide Sydney Canberra";
        String[] data = stringData.split(" ");
        Node me = new Node("Joel");

        // Linked List
//        NodeList nodeList = new NodeList(me);
        // Binary Search Tree
        BST nodeList = new BST(me);

        for (String s : data) {
            nodeList.addNode(new Node(s));
        }

        nodeList.traverse(nodeList.getRoot());

//        System.out.println();
//        System.out.println();
//
//        nodeList.removeNode(me);
//
//        nodeList.traverse(nodeList.getRoot());

    }
}
