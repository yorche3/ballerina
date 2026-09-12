// Implements naive sorting algorithms: selection sort, bubble sort, and insertion sort.

// Selection sort algorithm
// input: arr - an array of integers or nil
// output: a sorted array of integers or nil
function selectionSort(int[]? arr) returns int[]? {
    if arr is () {
        return ();
    }
    if arr.length() <= 1 {
        return arr;
    }
    int[] result = arr.clone();
    int n = result.length();
    foreach int i in 0 ..< (n - 1) {
        int minIdx = i;
        foreach int j in (i + 1) ..< n {
            if result[j] < result[minIdx] {
                minIdx = j;
            }
        }
        if minIdx != i {
            int temp = result[i];
            result[i] = result[minIdx];
            result[minIdx] = temp;
        }
    }
    return result;
}

// Bubble sort algorithm
// input: arr - an array of integers or nil
// output: a sorted array of integers or nil
function bubbleSort(int[]? arr) returns int[]? {
    if arr is () {
        return ();
    }
    if arr.length() <= 1 {
        return arr;
    }
    int[] result = arr.clone();
    int n = result.length();
    foreach int i in 0 ..< (n - 1) {
        boolean swapped = false;
        foreach int j in 0 ..< (n - i - 1) {
            if result[j] > result[j + 1] {
                int temp = result[j];
                result[j] = result[j + 1];
                result[j + 1] = temp;
                swapped = true;
            }
        }
        if !swapped {
            break;
        }
    }
    return result;
}

// Insertion sort algorithm
// input: arr - an array of integers or nil
// output: a sorted array of integers or nil
function insertionSort(int[]? arr) returns int[]? {
    if arr is () {
        return ();
    }
    if arr.length() <= 1 {
        return arr;
    }
    int[] result = arr.clone();
    int n = result.length();
    foreach int i in 1 ..< n {
        final int key = result[i];
        int j = i - 1;
        while j >= 0 && result[j] > key {
            result[j + 1] = result[j];
            j -= 1;
        }
        result[j + 1] = key;
    }
    return result;
}