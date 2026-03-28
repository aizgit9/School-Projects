import java.math.BigInteger;

public class QuadraticHashTable {
    private int tableSize;
    private int itemCount;
    private int[] table;

    public QuadraticHashTable(int capacity) {
        tableSize = ((BigInteger.valueOf(capacity * 2)).nextProbablePrime()).intValue();
        table = new int[tableSize];
    }

    public void insert(int key) {
        if(key == 0) return;
        ensureCapacity();
        int index = quadraticProbe(key);
        if(table[index] == 0) {
            table[index] = key;
            itemCount++;
        }
    }

    public boolean search(int key) {
        return table[quadraticProbe(key)] != 0;
    }

    // Returns the result of quadratic probing calculation
    public int getQuadraticIndex(int key) {
        int index = quadraticProbe(key);

        if(table[index] == 0) return -1;

        return index;

    }

    private void ensureCapacity() {
        // Check if load factor is less than acceptable
        if((double)itemCount / tableSize < 0.5) {
            return;
        }

        int[] oldTable = table;
        int oldTableSize = tableSize;
        
        // Find next prime value roughly near tableSize * 2
        tableSize = ((BigInteger.valueOf((long)tableSize * 2)).nextProbablePrime()).intValue();

        table = new int[tableSize];

        for(int i = 0; i < oldTableSize; i++) {
            if(oldTable[i] != 0) {

                int key = oldTable[i];
                // Hash the key with collision handling into the new table
                table[quadraticProbe(key)] = key;
            }
        }
    }

    // returns the index of a key using quadratic probing
    // This will not work if deletion needed to be supported,
    // but deletion is not required for the assignment.
    private int quadraticProbe(int key) {
        int start = hash(key);

        int j = 0;
        int index = start + j;
        while(table[index] != 0 && table[index] != key) {
            j++;
            index = (start + j * j) % tableSize;
        }

        return index;
    }

    // Basic modulo hashing function
    private int hash(int key) {
        // Absolute value the key because a negative key would break the table otherwise
        return Math.abs(key) % tableSize;
    }
}
