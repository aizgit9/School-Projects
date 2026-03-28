public class SplayTree {

    SplayNode root;

    public SplayTree() {
        root = null;
    }

    public void insert(int key) {
        root = insert(root, key);
    }

    private SplayNode insert(SplayNode node, int key) {
        if(node == null) return new SplayNode(key);

        if(key > node.key) node.right = insert(node.right, key);
        else if(key < node.key) node.left = insert(node.left, key);
        else return node;

        return node;
    }

    // search
    public boolean search(int key) {
        if(root == null) {
            return false;
        }

        SplayNode node = root;

        while(node != null) {
            if(key == node.key) {
                root = splay(node);
                return true;
            }
            else if(key > node.key) node = node.right;
            else if(key < node.key) node = node.left;
        }

        return false;
    }

    // Splays the node to the root
    private SplayNode splay(SplayNode node) {
        while(node.parent != null) {
            SplayNode p = node.parent;
            SplayNode g = node.parent.parent;

            // Grandparent is null
            if(g == null) {
                // Node is left child
                if(node == p.left) node = rotateWithLeftChild(p);
                else node = rotateWithRightChild(p);
            }
            // Zig-Zig L
            // Is node a left child? Is node's parent a left child?
            else if(node == p.left && p == g.left) {
                zigZigLeft(node);
            }
            // Zig-Zig R
            // Is node a right child? Is node's parent a right child?
            else if(node == p.right && p == g.right) {
                zigZigRight(node);
            }
            // Zig-Zag L
            // Is node a right child of a left child?
            else if(node == p.right && p == g.left) {
                zigZagLeft(node);
            }
            // Zig-Zag R
            // Is node a left child of a right child?
            else if(node == p.left && p == g.right) {
                zigZagRight(node);
            }
        }

        return node;
    }

    //zigZigLeft
    private SplayNode zigZigLeft(SplayNode x) {
        SplayNode p = rotateWithLeftChild(x.parent.parent);
        
        return rotateWithLeftChild(p);

    }
    //zigZigRight
    private SplayNode zigZigRight(SplayNode x) {
        SplayNode p = rotateWithRightChild(x.parent.parent);
        
        return rotateWithRightChild(p);
    }

    //zigZagLeft
    private SplayNode zigZagLeft(SplayNode x) {
        SplayNode p = x.parent;
        SplayNode g = x.parent.parent;

        rotateWithRightChild(p);
        rotateWithLeftChild(g);

        return x;
    }

    //zigZagRight
    private SplayNode zigZagRight(SplayNode x) {
        SplayNode p = x.parent;
        SplayNode g = x.parent.parent;

        rotateWithLeftChild(p);
        rotateWithRightChild(g);

        return x;
    }

    // Modified version of the AVL routine to update parent pointers
    private SplayNode rotateWithLeftChild(SplayNode k2) {
        // Do the rotation
        SplayNode k1 = k2.left;

        // k2.left should be k1.right
        k2.left = k1.right;

        // k1.right's parent should be k2 if not null
        if(k1.right != null) k1.right.parent = k2;

        // k1's parent should be k2.parent
        k1.parent = k2.parent;

        // Update the parent to point to k1 instead of k2
        if (k2.parent != null) {
            if (k2.parent.left == k2) k2.parent.left = k1;
            else k2.parent.right = k1;
        }

        // k1.right is now k2
        k1.right = k2;

        // k2's parent should be k1
        k2.parent = k1;

        return k1;
    }

    // Modified version of the AVL routine to update parent pointers
    private SplayNode rotateWithRightChild(SplayNode k2) {
        // Do the rotation
        SplayNode k1 = k2.right;

        // k2.right should be k1.left
        k2.right = k1.left;

        // k1.left's parent should be k2 if not null
        if(k1.left != null) k1.left.parent = k2;

        // k1's parent should be k2.parent
        k1.parent = k2.parent;

        // Update the parent to point to k1 instead of k2
        if (k2.parent != null) {
            if (k2.parent.left == k2) k2.parent.left = k1;
            else k2.parent.right = k1;
        }

        // k1.left is now k2
        k1.left = k2;

        // k2's parent should be k1
        k2.parent = k1;
        
        return k1;
    }

    public void DFSSplayTree() {
        System.out.println();
        preorderTraversal(root);
    }

    private void preorderTraversal(SplayNode node) {
        if(node == null) {
            return;
        }

        System.out.print(node.key + " ");

        preorderTraversal(node.left);
        preorderTraversal(node.right);
    }

    private static class SplayNode {
        int key;
        SplayNode left;
        SplayNode right;
        SplayNode parent;

        // No parent or children
        public SplayNode(int k) {
            this(k, null, null, null);
        }

        // All properties defined
        public SplayNode(int k, SplayNode p, SplayNode l, SplayNode r) {
            key = k;
            parent = p;
            left = l;
            right = r;
        }
    }
}
