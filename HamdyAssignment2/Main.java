import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        
        System.out.println("Warming up...");
        // Dry runs to warm up JVM
        testAvlTree();
        testSplayTree();
        testChainingHashTable();
        testQuadraticHashTable();

        System.out.println("Running tests...");

        // Test data structures and store times
        int[] AvlMetrics = testAvlTree();
        int[] SplayMetrics = testSplayTree();
        int[] ChainMetrics = testChainingHashTable();
        int[] QuadMetrics = testQuadraticHashTable();
        
        // Print out results (Insertion)
        System.out.println("Insertion Performance (Time in ms)");
        System.out.printf("%-25s %-10s %-10s %-10s%n", "Data Structures", "1000", "10000", "100000");
        System.out.printf("%-25s %-10d %-10d %-10d%n", "AVL Tree", AvlMetrics[0], AvlMetrics[1], AvlMetrics[2]);
        System.out.printf("%-25s %-10d %-10d %-10d%n", "Splay Tree", SplayMetrics[0], SplayMetrics[1], SplayMetrics[2]);
        System.out.printf("%-25s %-10d %-10d %-10d%n", "Hash Table (Chaining)", ChainMetrics[0], ChainMetrics[1], ChainMetrics[2]);
        System.out.printf("%-25s %-10d %-10d %-10d%n", "Hash Table (Quadratic)", QuadMetrics[0], QuadMetrics[1], QuadMetrics[2]);

        System.out.println();

        // Print out results (Search)
        System.out.println("Search Performance (Time in ms)");
        System.out.printf("%-25s %-10s %-10s %-10s%n", "Data Structures", "1000", "10000", "100000");
        System.out.printf("%-25s %-10d %-10d %-10d%n", "AVL Tree", AvlMetrics[3], AvlMetrics[4], AvlMetrics[5]);
        System.out.printf("%-25s %-10d %-10d %-10d%n", "Splay Tree", SplayMetrics[3], SplayMetrics[4], SplayMetrics[5]);
        System.out.printf("%-25s %-10d %-10d %-10d%n", "Hash Table (Chaining)", ChainMetrics[3], ChainMetrics[4], ChainMetrics[5]);
        System.out.printf("%-25s %-10d %-10d %-10d%n", "Hash Table (Quadratic)", QuadMetrics[3], QuadMetrics[4], QuadMetrics[5]);

        System.out.println();

        // Print out results (Insertion)
        System.out.println("Insertion Performance (Memory in KB)");
        System.out.printf("%-25s %-10s %-10s %-10s%n", "Data Structures", "1000", "10000", "100000");
        System.out.printf("%-25s %-10d %-10d %-10d%n", "AVL Tree", AvlMetrics[6], AvlMetrics[7], AvlMetrics[8]);
        System.out.printf("%-25s %-10d %-10d %-10d%n", "Splay Tree", SplayMetrics[6], SplayMetrics[7], SplayMetrics[8]);
        System.out.printf("%-25s %-10d %-10d %-10d%n", "Hash Table (Chaining)", ChainMetrics[6], ChainMetrics[7], ChainMetrics[8]);
        System.out.printf("%-25s %-10d %-10d %-10d%n", "Hash Table (Quadratic)", QuadMetrics[6], QuadMetrics[7], QuadMetrics[8]);

        System.out.println();

        // Print out results (Search)
        System.out.println("Search Performance (Memory in KB) *Garbage collection artifacts");
        System.out.printf("%-25s %-10s %-10s %-10s%n", "Data Structures", "1000", "10000", "100000");
        System.out.printf("%-25s %-10d %-10d %-10d%n", "AVL Tree", AvlMetrics[9], AvlMetrics[10], AvlMetrics[11]);
        System.out.printf("%-25s %-10d %-10d %-10d%n", "Splay Tree", SplayMetrics[9], SplayMetrics[10], SplayMetrics[11]);
        System.out.printf("%-25s %-10d %-10d %-10d%n", "Hash Table (Chaining)", ChainMetrics[9], ChainMetrics[10], ChainMetrics[11]);
        System.out.printf("%-25s %-10d %-10d %-10d%n", "Hash Table (Quadratic)", QuadMetrics[9], QuadMetrics[10], QuadMetrics[11]);
    }

    public static int[] testAvlTree() throws InterruptedException  {
        AvlTree theTree = new AvlTree();

        long[] metrics = new long[12];
        int[] output = new int[12];

        // Test insertions
        for(int i = 1; i < 4; i++) {
            String fileName = String.format("iter%d_insert_keys.txt", i);

            try(BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
                String line;
                
                // Memory measurement
                forceGC();

                Runtime rt = Runtime.getRuntime(); 
                long before = rt.totalMemory() - rt.freeMemory(); 

                // Log Start time
                long startTime = System.nanoTime();

                // Main reading loop
                while ((line = reader.readLine()) != null) {
                    int key = Integer.parseInt(line);
                    theTree.insert(key);
                }

                // Log end time
                long endTime = System.nanoTime();

                // Clean up temporary strings
                forceGC();

                // Memory Measurement
                long after  = rt.totalMemory() - rt.freeMemory(); 
                long usedBytes = after - before;
                metrics[i + 5] = usedBytes;

                // Calculate and store duration
                long duration = (endTime - startTime);  // Total time in nanoseconds
                metrics[i - 1] = duration;
            }
            catch(IOException e) {
                System.out.println("Could not read from file: " + fileName);
            }
        }

        // Test searches
        for(int i = 1; i < 4; i++) {
            String fileName = String.format("iter%d_search_keys.txt", i);

            try(BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
                String line;

                // Memory measurement
                forceGC();

                Runtime rt = Runtime.getRuntime(); 
                long before = rt.totalMemory() - rt.freeMemory(); 

                // Log start time
                long startTime = System.nanoTime();

                // Main reading loop
                while ((line = reader.readLine()) != null) {
                    int key = Integer.parseInt(line);
                    theTree.search(key);
                }

                // Log end time
                long endTime = System.nanoTime();

                // Clean up temporary strings
                forceGC();

                // Memory Measurement
                long after  = rt.totalMemory() - rt.freeMemory(); 
                long usedBytes = after - before;

                metrics[i + 8] = usedBytes;

                // Calculate and store duration
                long duration = (endTime - startTime);  // Total time in nanoseconds
                metrics[i + 2] = duration;
            }
            catch(IOException e) {
                System.out.println("Could not read from file: " + fileName);
            }
        }

        // Convert times to ms and round
        for (int i = 0; i < 6; i++) {
            output[i] = (int)Math.ceil(metrics[i] / 1000000.0);
        }

        // Convert memory values to KB
        for (int i = 6; i < 12; i++) {
            output[i] = (int)Math.ceil(metrics[i] / 1024.0);
        }

        return output; 
    }

    public static int[] testSplayTree() throws InterruptedException {
        SplayTree theTree = new SplayTree();

        long[] metrics = new long[12];
        int[] output = new int[12];

        // Test insertions
        for(int i = 1; i < 4; i++) {
            String fileName = String.format("iter%d_insert_keys.txt", i);

            try(BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
                String line;
                
                // Memory measurement
                forceGC();

                Runtime rt = Runtime.getRuntime(); 
                long before = rt.totalMemory() - rt.freeMemory(); 

                // Log Start time
                long startTime = System.nanoTime();

                // Main reading loop
                while ((line = reader.readLine()) != null) {
                    int key = Integer.parseInt(line);
                    theTree.insert(key);
                }

                // Log end time
                long endTime = System.nanoTime();

                // Clean up temporary strings
                forceGC();

                // Memory Measurement
                long after  = rt.totalMemory() - rt.freeMemory(); 
                long usedBytes = after - before;
                metrics[i + 5] = usedBytes;

                // Calculate and store duration
                long duration = (endTime - startTime);  // Total time in nanoseconds
                metrics[i - 1] = duration;
            }
            catch(IOException e) {
                System.out.println("Could not read from file: " + fileName);
            }
        }

        // Test searches
        for(int i = 1; i < 4; i++) {
            String fileName = String.format("iter%d_search_keys.txt", i);

            try(BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
                String line;

                // Memory measurement
                forceGC();

                Runtime rt = Runtime.getRuntime(); 
                long before = rt.totalMemory() - rt.freeMemory(); 

                // Log start time
                long startTime = System.nanoTime();

                // Main reading loop
                while ((line = reader.readLine()) != null) {
                    int key = Integer.parseInt(line);
                    theTree.search(key);
                }

                // Log end time
                long endTime = System.nanoTime();

                // Clean up temporary strings
                forceGC();

                // Memory Measurement
                long after  = rt.totalMemory() - rt.freeMemory(); 
                long usedBytes = after - before;
                metrics[i + 8] = usedBytes;

                // Calculate and store duration
                long duration = (endTime - startTime);  // Total time in nanoseconds
                metrics[i + 2] = duration;
            }
            catch(IOException e) {
                System.out.println("Could not read from file: " + fileName);
            }
        }

        // Convert times to ms and round
        for (int i = 0; i < 6; i++) {
            output[i] = (int)Math.ceil(metrics[i] / 1000000.0);
        }

        // Convert memory values to KB
        for (int i = 6; i < 12; i++) {
            output[i] = (int)Math.ceil(metrics[i] / 1024.0);
        }

        return output;
    }

    public static int[] testChainingHashTable() throws InterruptedException  {
        ChainingHashTable theTable = new ChainingHashTable(11);

        long[] metrics = new long[12];
        int[] output = new int[12];

        // Test insertions
        for(int i = 1; i < 4; i++) {
            String fileName = String.format("iter%d_insert_keys.txt", i);

            try(BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
                String line;

                // Log Start time
                long startTime = System.nanoTime();

                // Memory measurement
                forceGC();

                Runtime rt = Runtime.getRuntime(); 
                long before = rt.totalMemory() - rt.freeMemory(); 

                // Main reading loop
                while ((line = reader.readLine()) != null) {
                    int key = Integer.parseInt(line);
                    theTable.insert(key);
                }

                // Log end time
                long endTime = System.nanoTime();

                // Clean up temporary strings
                forceGC();

                // Memory Measurement
                long after  = rt.totalMemory() - rt.freeMemory(); 
                long usedBytes = after - before;
                metrics[i + 5] = usedBytes;


                // Calculate and store duration
                long duration = (endTime - startTime);  // Total time in nanoseconds
                metrics[i - 1] = duration;
            }
            catch(IOException e) {
                System.out.println("Could not read from file: " + fileName);
            }
        }

        // Test searches
        for(int i = 1; i < 4; i++) {
            String fileName = String.format("iter%d_search_keys.txt", i);
            
            try(BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
                String line;

                // Log Start time
                long startTime = System.nanoTime();

                // Memory measurement
                forceGC();

                Runtime rt = Runtime.getRuntime(); 
                long before = rt.totalMemory() - rt.freeMemory(); 

                // Main reading loop
                while ((line = reader.readLine()) != null) {
                    int key = Integer.parseInt(line);
                    theTable.search(key);
                }

                // Log end time
                long endTime = System.nanoTime();

                // Clean up temporary strings
                forceGC();

                // Memory Measurement
                long after  = rt.totalMemory() - rt.freeMemory(); 
                long usedBytes = after - before;
                metrics[i + 8] = usedBytes;


                // Calculate and store duration
                long duration = (endTime - startTime);  // Total time in nanoseconds
                metrics[i + 2] = duration;
            }
            catch(IOException e) {
                System.out.println("Could not read from file: " + fileName);
            }
        }

        // Convert times to ms and round
        for (int i = 0; i < 6; i++) {
            output[i] = (int)Math.ceil(metrics[i] / 1000000.0);
        }

        // Convert memory values to KB
        for (int i = 6; i < 12; i++) {
            output[i] = (int)Math.ceil(metrics[i] / 1024.0);
        }

        return output;
    }

    public static int[] testQuadraticHashTable() throws InterruptedException  {
        QuadraticHashTable theTable = new QuadraticHashTable(11);

        long[] metrics = new long[12];
        int[] output = new int[12];

        // Test insertions
        for(int i = 1; i < 4; i++) {
            String fileName = String.format("iter%d_insert_keys.txt", i);

            try(BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
                String line;

                // Log Start time
                long startTime = System.nanoTime();

                // Memory measurement
                forceGC();

                Runtime rt = Runtime.getRuntime(); 
                long before = rt.totalMemory() - rt.freeMemory(); 

                // Main reading loop
                while ((line = reader.readLine()) != null) {
                    int key = Integer.parseInt(line);
                    theTable.insert(key);
                }

                // Log end time
                long endTime = System.nanoTime();

                // Clean up temporary strings
                forceGC();

                // Memory Measurement
                long after  = rt.totalMemory() - rt.freeMemory(); 
                long usedBytes = after - before;
                metrics[i + 5] = usedBytes;

                // Calculate and store duration
                long duration = (endTime - startTime);  // Total time in nanoseconds
                metrics[i - 1] = duration;
            }
            catch(IOException e) {
                System.out.println("Could not read from file: " + fileName);
            }
        }

        // Test searches
        for(int i = 1; i < 4; i++) {
            String fileName = String.format("iter%d_search_keys.txt", i);

            try(BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
                String line;

                // Log Start time
                long startTime = System.nanoTime();

                // Memory measurement
                forceGC();

                Runtime rt = Runtime.getRuntime(); 
                long before = rt.totalMemory() - rt.freeMemory(); 

                // Main reading loop
                while ((line = reader.readLine()) != null) {
                    int key = Integer.parseInt(line);
                    theTable.search(key);
                }

                // Log end time
                long endTime = System.nanoTime();

                // Clean up temporary strings
                forceGC();

                // Memory Measurement
                long after  = rt.totalMemory() - rt.freeMemory(); 
                long usedBytes = after - before;
                metrics[i + 8] = usedBytes;

                // Calculate and store duration
                long duration = (endTime - startTime);  // Total time in nanoseconds
                metrics[i + 2] = duration;
            }
            catch(IOException e) {
                System.out.println("Could not read from file: " + fileName);
            }
        }
        // Convert times to ms and round
        for (int i = 0; i < 6; i++) {
            output[i] = (int)Math.ceil(metrics[i] / 1000000.0);
        }

        // Convert memory values to KB
        for (int i = 6; i < 12; i++) {
            output[i] = (int)Math.ceil(metrics[i] / 1024.0);
        }

        return output;
    }

    public static void forceGC() {
    // Request a cleanup
    System.gc();
    
    // Pause briefly
    try { Thread.sleep(50); } catch (InterruptedException e) {}
    
    // Request a SECOND cleanup to catch anything that survived the first
    System.gc();
    try { Thread.sleep(50); } catch (InterruptedException e) {}
    }
}
