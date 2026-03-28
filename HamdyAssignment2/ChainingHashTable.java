import java.math.BigInteger;

public class ChainingHashTable {

    // Size should be prime
    private int tableSize;
    private int itemCount;
    private Node[] table;

    public ChainingHashTable(int capacity) {
        tableSize = ((BigInteger.valueOf(capacity * 2)).nextProbablePrime()).intValue();
        table = new Node[tableSize];
    }

    public void insert(int key) {
        ensureCapacity();
        addAtIndex(key, hash(key));
    }

    public boolean search(int key) {
        Node current = table[hash(key)];
            while(current != null) {
                if(current.key == key) return true;
                current = current.next;
            }
        return false;
    }
    // Prints all keys in the hash table chaining bucket at the specified index
    public void getChain(int index) {
        Node current = table[index];

        while(current != null) {
                System.out.print(current.key + " ");
                current = current.next;
        }
        System.out.println();
    }

    private void ensureCapacity() {
        // Check if load factor is less than acceptable
        if((double)itemCount / tableSize < 0.7) {
            return;
        }

        Node[] oldTable = table;
        int oldTableSize = tableSize;
        
        // Find next prime value roughly near tableSize * 2
        tableSize = ((BigInteger.valueOf(tableSize * 2)).nextProbablePrime()).intValue();

        table = new Node[tableSize];

        // Rehashing the keys recalculates the itemCount so reset it
        itemCount = 0;

        // Rehash all keys
        for(int i = 0; i < oldTableSize; i++) {
            Node current = oldTable[i];
            while(current != null) {
                // Rehash the key into the new table
                addAtIndex(current.key, hash(current.key));
                current = current.next;
            }
        }
    }

    // Basic modulo hashing function
    private int hash(int key) {
        // Absolute value the key because a negative key would break the table otherwise
        return Math.abs(key) % tableSize;
    }

    // Returns true if successfully added and false if not (duplicate)
    private void addAtIndex(int key, int index) {
        if(table[index] == null) {
            table[index] = new Node(key);
            itemCount++;
            return;
        }

        Node current = table[index];

        while(current.next != null) {
            if(current.key == key) return;
            current = current.next;
        }

        // Check if last node was duplicate
        if(current.key == key) return;

        current.next = new Node(key);
        itemCount++;
    }

    private class Node {
        Node next;
        int key;

        public Node(int k){
            key = k;
            next = null;
        }
    }
}
