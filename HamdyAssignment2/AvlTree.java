public class AvlTree {
    private AvlNode root;
    private final int ALLOWED_IMBALANCE = 1;
    public AvlTree() {
        root = null;
    }

    // Public insert method
    public void insert(int key) {
        root = insert(root, key);
    }

    // Private recursive insert method, balances the tree on the way back up
    private AvlNode insert(AvlNode node, int key) {

        if(node == null) return new AvlNode(key);

        if(key > node.key) node.right = insert(node.right, key);
        else if(key < node.key) node.left = insert(node.left, key);
        else return node;

        return balance(node);
    }

    // Search for a key, return true if found and false otherwise
    public boolean search(int key) {
        if(root == null) {
            return false;
        }

        AvlNode node = root;

        // Iterative traversal
        while(node != null) {
            if(key == node.key) return true;
            else if(key > node.key) node = node.right;
            else if(key < node.key) node = node.left;
        }

        return false;
    }

    // Balances the given subtree
    private AvlNode balance(AvlNode node) {
        if(node == null) return node;

        // Balance factor is left heavy
        if(height(node.left) - height(node.right) > ALLOWED_IMBALANCE) {
            // Is child also left heavy?
            if(height(node.left.left) >= height(node.left.right))
                node = rotateWithLeftChild(node);
            else
                node = doubleWithLeftChild(node);
        }

        // Balance factor is right heavy
        if(height(node.right) - height(node.left) > ALLOWED_IMBALANCE) {
            // Is child also right heavy?
            if(height(node.right.right) >= height(node.right.left))
                node = rotateWithRightChild(node);
            else
                node = doubleWithRightChild(node);
        }

        // Update height
        node.height = Math.max(height(node.left), height(node.right)) + 1;
        return node;
    }

    private AvlNode rotateWithLeftChild(AvlNode parent) {
        // Do the rotation
        AvlNode child = parent.left;
        parent.left = child.right;
        child.right = parent;
        // Update heights
        parent.height = Math.max(height(parent.left), height(parent.right)) + 1;
        child.height = Math.max(height(child.left), parent.height) + 1;

        return child;
    }

    private AvlNode rotateWithRightChild(AvlNode parent) {
        // Do the rotation
        AvlNode child = parent.right;
        parent.right = child.left;
        child.left = parent;
        // Update heights
        parent.height = Math.max(height(parent.left), height(parent.right)) + 1;
        child.height = Math.max(parent.height, height(child.right)) + 1;

        return child;
    }

    // Double rotate with left child
    private AvlNode doubleWithLeftChild(AvlNode grandparent) {
        grandparent.left = rotateWithRightChild(grandparent.left);
        return rotateWithLeftChild(grandparent);
    }

    // Double rotate with right child
    private AvlNode doubleWithRightChild(AvlNode grandparent) {
        grandparent.right = rotateWithLeftChild(grandparent.right);
        return rotateWithRightChild(grandparent);
    }

    // Return the height of a given node, -1 for null
    private int height(AvlNode node) {
        if(node == null) return -1;
        return node.height;
    }

    // Same as search but returns height instead of whether it was found or not
    private int getAVLKeyHeight(int key) {
        if(root == null) {
            return -1;
        }

        AvlNode node = root;

        // Iterative traversal
        while(node != null) {
            if(key == node.key) return node.height;
            else if(key > node.key) node = node.right;
            else if(key < node.key) node = node.left;
        }

        return -1;
    }
    
    // Node class - must track height value
    private static class AvlNode {
        int key;
        AvlNode left;
        AvlNode right;
        int height;

        public AvlNode(int k) {
            this(k, null, null);
        }

        public AvlNode(int k, AvlNode l, AvlNode r) {
            key = k;
            left = l;
            right = r;
            height = 0;
        }
    }
}
