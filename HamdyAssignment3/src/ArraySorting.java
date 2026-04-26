import java.lang.Math;
public static void main(String[] args) {
    testSorts(0, 100);
}

// Tests algorithms on arrays of increasing size and specified range (min to max)
// Displays formatted results
public static void testSorts(int min, int max) {
    System.out.printf("Range: %d to %d%n", min, max);
    // Generate random arrays
    int[] arr50 = generateRandArray(min, max,50);
    int[] arr500 = generateRandArray(min, max, 500);
    int[] arr1k = generateRandArray(min, max, 1000);
    int[] arr2k = generateRandArray(min, max, 2000);
    int[] arr5k = generateRandArray(min, max, 5000);
    int[] arr10k = generateRandArray(min, max, 10000);
    int[] arr50k = generateRandArray(min, max, 50000);
    int[] arr100k = generateRandArray(min, max, 100000);

    // Line 1 - Labels
    System.out.printf("%-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s%n",
            "Input Size", "Insertion Sort", "Heap Sort", "Merge Sort", "Quick Sort", "Cutoff 10", "Cutoff 50", "Cutoff 500");

    // Line 2 - 50
    System.out.printf("%-20s %-20d %-20d %-20d %-20d %-20d %-20d %-20d%n",
            "50", testInsertionSort(arr50), testHeapSort(arr50), testMergeSort(arr50),
            testQuickSort(arr50), testQuickSort(arr50, 10), testQuickSort(arr50, 50), testQuickSort(arr50, 500));

    // Line 3 - 500
    System.out.printf("%-20s %-20d %-20d %-20d %-20d %-20d %-20d %-20d%n",
            "500", testInsertionSort(arr500), testHeapSort(arr500), testMergeSort(arr500),
            testQuickSort(arr500), testQuickSort(arr500, 10), testQuickSort(arr500, 50), testQuickSort(arr500, 500));

    // Line 4 - 1000
    System.out.printf("%-20s %-20d %-20d %-20d %-20d %-20d %-20d %-20d%n",
            "1000", testInsertionSort(arr1k), testHeapSort(arr1k), testMergeSort(arr1k),
            testQuickSort(arr1k), testQuickSort(arr1k, 10), testQuickSort(arr1k, 50), testQuickSort(arr1k, 500));

    // Line 5 - 2000
    System.out.printf("%-20s %-20d %-20d %-20d %-20d %-20d %-20d %-20d%n",
            "2000", testInsertionSort(arr2k), testHeapSort(arr2k), testMergeSort(arr2k),
            testQuickSort(arr2k), testQuickSort(arr2k, 10), testQuickSort(arr2k, 50), testQuickSort(arr2k, 500));

    // Line 6 - 5000
    System.out.printf("%-20s %-20d %-20d %-20d %-20d %-20d %-20d %-20d%n",
            "5000", testInsertionSort(arr5k), testHeapSort(arr5k), testMergeSort(arr5k),
            testQuickSort(arr5k), testQuickSort(arr5k, 10), testQuickSort(arr5k, 50), testQuickSort(arr5k, 500));

    // Line 7 - 10000
    System.out.printf("%-20s %-20d %-20d %-20d %-20d %-20d %-20d %-20d%n",
            "10000", testInsertionSort(arr10k), testHeapSort(arr10k), testMergeSort(arr10k),
            testQuickSort(arr10k), testQuickSort(arr10k, 10), testQuickSort(arr10k, 50), testQuickSort(arr10k, 500));

    // Line 8 - 50000
    System.out.printf("%-20s %-20d %-20d %-20d %-20d %-20d %-20d %-20d%n",
            "50000", testInsertionSort(arr50k), testHeapSort(arr50k), testMergeSort(arr50k),
            testQuickSort(arr50k), testQuickSort(arr50k, 10), testQuickSort(arr50k, 50), testQuickSort(arr50k, 500));

    // Line 9 - 100000
    System.out.printf("%-20s %-20d %-20d %-20d %-20d %-20d %-20d %-20d%n%n",
            "100000", testInsertionSort(arr100k), testHeapSort(arr100k), testMergeSort(arr100k),
            testQuickSort(arr100k), testQuickSort(arr100k, 10), testQuickSort(arr100k, 50), testQuickSort(arr100k, 500));
}

public static void insertionSort(int[] arr) {
    insertionSort(arr, 0, arr.length - 1);
}

public static void insertionSort(int[] arr, int start, int end) {
    int i = start;

    for(int p = start; p <= end; p++) {
        int temp = arr[p];

        for(i = p; i > 0 && temp < arr[i - 1]; i--) {
            arr[i] = arr[i - 1];
        }

        arr[i] = temp;
    }
}

public static void heapSort(int[] arr) {
    int n = arr.length;
    buildMaxHeap(arr, n);
    for (int i = n - 1; i >= 0; i--) {
        arr[i] = deleteMax(arr, n);
        n--;
    }
}

// "Percolates" an element down by swapping with its children in order to maintain heap order
public static void percolateDown(int[] arr, int i, int n) {
    int l = 2 * i + 1; // left child
    int r = 2 * i + 2; // right child
    int large = i;

    // parent less than left child
    if(l < n && arr[large] < arr[l]) {
        large = l;
    }

    // parent less than right child
    if(r < n && arr[large] < arr[r]) {
        large = r;
    }

    // if largest isn't root:
    // swap root with largest
    // keep going
    if(large != i) {
        swap(arr, i, large);
        percolateDown(arr, large, n);
    }
}

// Orders an array into a max heap
public static void buildMaxHeap(int[] arr, int n) {
    int lastParent = (n - 1) / 2;
    for (int i = lastParent; i >= 0; i--) {
        percolateDown(arr, i, n);
    }
}

// Removes and returns the max element from the heap
public static int deleteMax(int[] arr, int n) {
    int max = arr[0];
    arr[0] = arr[n - 1];
    percolateDown(arr, 0, n);

    return max;
}

public static void mergeSort(int[] arr) {
    mergeSort(arr, 0, arr.length - 1);
}

public static void mergeSort(int[] arr, int start, int end) {
    if(end > start) {
        int mid = (end + start) / 2;
        mergeSort(arr, start, mid);
        mergeSort(arr, mid + 1, end);
        merge(arr, start, mid, end);
    }
}

// Merges two sorted sections of an array (start to mid, mid+1 to end)
// Overwrites array section with sorted portion
public static void merge(int[] arr, int start, int mid, int end) {
    int[] temp = new int[end - start + 1];
    int i = start, j = mid + 1, k = 0;

    while(i <= mid && j <= end) {
        if (arr[i] < arr[j]) {
            temp[k] = arr[i];
            i++;
        } else {
            temp[k] = arr[j];
            j++;
        }
        k++;
    }

    // Copy remainder of array to temp
    while(i <= mid) {
        temp[k] = arr[i];
        i++;
        k++;
    }

    while(j <= end) {
        temp[k] = arr[j];
        j++;
        k++;
    }

    // Copy temp to original array
    for (int l = start; l <= end; l++) {
        arr[l] = temp[l - start];
    }
}

// Returns the median of the first, middle, and last elements of an array
// Sorts the elements it checks for a small optimization
public static int medianOfThree(int[]arr, int start, int end) {
    int mid = (end + start) / 2;

    if(arr[start] > arr[mid]) swap(arr, start, mid);

    if(arr[start] > arr[end]) swap(arr, start, end);

    if(arr[mid] > arr[end]) swap(arr, mid, end);

    swap(arr, mid, end - 1); // Place pivot in position

    return arr[end - 1]; // Return pivot value
}

public static void quickSort(int[] arr) {
    quickSort(arr, 0, arr.length - 1);
}

public static void quickSort(int[] arr, int start, int end) {
    int size = end - start + 1;

    if(size <= 1) {
        return;
    }
    else if(size == 2) {
        if(arr[start] > arr[end]) swap(arr, start, end);
        return;
    }

    int pivot = medianOfThree(arr, start, end);

    int i = start, j = end - 1;

    while(true) {
        do { i++; }
        while(arr[i] < pivot);

        do { j--; }
        while(arr[j] > pivot);

        if(i >= j) {
            break;
        }

        swap(arr, i, j);
    }

    swap(arr, i, end - 1); // Put pivot in position

    quickSort(arr, start, i - 1);
    quickSort(arr, i + 1, end);
}

public static void quickSort(int[] arr, int cutoff) {
    quickSort(arr, 0, arr.length - 1, cutoff);
}

// Quicksort that stops at a cutoff value and then performs insertion sort
public static void quickSort(int[] arr, int start, int end, int cutoff) {
    int size = end - start + 1;

    if(size <= cutoff) {
        insertionSort(arr, start, end);
        return;
    }

    int pivot = medianOfThree(arr, start, end);

    int i = start, j = end - 1;

    while(true) {
        do { i++; }
        while(arr[i] < pivot);

        do { j--; }
        while(arr[j] > pivot);

        if(i >= j) {
            break;
        }

        swap(arr, i, j);
    }

    swap(arr, i, end - 1); // Put pivot in position

    quickSort(arr, start, i - 1, cutoff);
    quickSort(arr, i + 1, end, cutoff);
}

// Swaps two elements in an array
public static void swap(int[] arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}

// Generates a random array of specified size and range (min to max)
public static int[] generateRandArray(int min, int max, int size) {
    int[] array = new int[size];
    for (int i = 0; i < size; i++) {
        array[i] = (int)Math.floor(Math.random() * (max - min + 1)) + min;
    }
    return array;
}

// Displays an array
public static void printArray(int[] arr) {
    for(int j : arr) {
        System.out.print(j + " ");
    }
    System.out.println();
}

// Checks if an array is sorted
public static boolean isSorted(int[] arr) {
    for (int i = 1; i < arr.length; i++) {
        if ((arr[i - 1] > arr[i])) {
            return false;
        }
    }
    return true;
}

// Runs insertion sort on an array 5 times and returns average time
public static long testInsertionSort(int[] arr) {
    long total = 0;

    for (int i = 0; i < 5; i++) {
        int[] copy = arr.clone();

        long startTime = System.nanoTime();
        insertionSort(copy);
        long endTime = System.nanoTime();

        if(!isSorted(copy)) System.out.println("Error: array was not sorted");
        total += endTime - startTime;
    }

    return total / 5;
}

// Runs heap sort on an array 5 times and returns average time
public static long testHeapSort(int[] arr) {
    long total = 0;

    for (int i = 0; i < 5; i++) {
        int[] copy = arr.clone();

        long startTime = System.nanoTime();
        heapSort(copy);
        long endTime = System.nanoTime();

        if(!isSorted(copy)) System.out.println("Error: array was not sorted");
        total += endTime - startTime;
    }

    return total / 5;
}

// Runs merge sort on an array 5 times and returns average time
public static long testMergeSort(int[] arr) {
    long total = 0;

    for (int i = 0; i < 5; i++) {
        int[] copy = arr.clone();

        long startTime = System.nanoTime();
        mergeSort(copy);
        long endTime = System.nanoTime();

        if(!isSorted(copy)) System.out.println("Error: array was not sorted");
        total += endTime - startTime;
    }

    return total / 5;
}

// Runs basic quick sort on an array 5 times and returns average time
public static long testQuickSort(int[] arr) {
    long total = 0;

    for (int i = 0; i < 5; i++) {
        int[] copy = arr.clone();

        long startTime = System.nanoTime();
        quickSort(copy);
        long endTime = System.nanoTime();

        if(!isSorted(copy)) System.out.println("Error: array was not sorted");
        total += endTime - startTime;
    }

    return total / 5;
}

// Runs cutoff quick sort on an array 5 times and returns average time
public static long testQuickSort(int[] arr, int cutoff) {
    long total = 0;

    for (int i = 0; i < 5; i++) {
        int[] copy = arr.clone();

        long startTime = System.nanoTime();
        quickSort(copy, cutoff);
        long endTime = System.nanoTime();

        if(!isSorted(copy)) System.out.println("Error: array was not sorted");
        total += endTime - startTime;
    }

    return total / 5;
}