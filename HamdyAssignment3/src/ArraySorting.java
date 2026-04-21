public static void main(String[] args) {
    int[] array = {6,4,89,15,65,17,12,76,23,2};

    for (int j : array) {
        System.out.print(j + " ");
    }
    System.out.println();

    heapSort(array);

    for (int j : array) {
        System.out.print(j + " ");
    }

}

public static void insertionSort(int[] arr) {
    int n = arr.length;
    int i = 0;

    for(int p = 0; p < n; p++) {
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

public static void swap(int[] arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}

public static void maxHeapify(int[] arr, int i, int n) {
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
        maxHeapify(arr, large, n);
    }
}

public static void buildMaxHeap(int[] arr, int n) {
    int lastParent = (n - 1) / 2;
    for (int i = lastParent; i >= 0; i--) {
        maxHeapify(arr, i, n);
    }
}

public static int deleteMax(int[] arr, int n) {
    int max = arr[0];
    arr[0] = arr[n - 1];
    maxHeapify(arr, 0, n);

    return max;
}