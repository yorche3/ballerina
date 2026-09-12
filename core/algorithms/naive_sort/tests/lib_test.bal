import ballerina/io;
import ballerina/test;

type SortFunction function(int[]? arr) returns int[]?;

// Fixtures are declared once and reused by the three algorithms. Each call
// passes a clone, since the implementation may sort in place.
final int[] STANDARD_INPUT = [5, 2, 9, 1, 5, 6];
final int[] STANDARD_OUTPUT = [1, 2, 5, 5, 6, 9];
final int[] SORTED_INPUT = [1, 2, 3, 4, 5];
final int[] REVERSE_INPUT = [5, 4, 3, 2, 1];
final int[] REVERSE_OUTPUT = [1, 2, 3, 4, 5];
final int[] EQUAL_INPUT = [7, 7, 7, 7];
final int[] NEGATIVE_INPUT = [3, -1, 4, -5, 0];
final int[] NEGATIVE_OUTPUT = [-5, -1, 0, 3, 4];
final int[] SINGLE_INPUT = [42];
final int[] EMPTY_INPUT = [];

// Runs the 8 shared cases against any sort function.
function assertAllCases(SortFunction sortFn, string algorithm) {
    test:assertEquals(sortFn(STANDARD_INPUT.clone()), STANDARD_OUTPUT,
        string `${algorithm}: should sort an unsorted array`);
    test:assertEquals(sortFn(SORTED_INPUT.clone()), SORTED_INPUT,
        string `${algorithm}: should preserve an already sorted array`);
    test:assertEquals(sortFn(REVERSE_INPUT.clone()), REVERSE_OUTPUT,
        string `${algorithm}: should sort a reverse-order array`);
    test:assertEquals(sortFn(EQUAL_INPUT.clone()), EQUAL_INPUT,
        string `${algorithm}: should preserve equal elements`);
    test:assertEquals(sortFn(NEGATIVE_INPUT.clone()), NEGATIVE_OUTPUT,
        string `${algorithm}: should sort negative values`);
    test:assertEquals(sortFn(SINGLE_INPUT.clone()), SINGLE_INPUT,
        string `${algorithm}: should preserve a single-element array`);
    test:assertEquals(sortFn(EMPTY_INPUT.clone()), EMPTY_INPUT,
        string `${algorithm}: should preserve an empty array`);
    test:assertEquals(sortFn(()), (),
        string `${algorithm}: should return the nil failure indicator for a nil array`);
}

// Before Suite Function

@test:BeforeSuite
function beforeSuiteFunc() {
    io:println("Starting naive_sort test suite...");
}

// Test function

@test:Config {}
function testSelectionSort() {
    assertAllCases(selectionSort, "SelectionSort");
}

@test:Config {}
function testBubbleSort() {
    assertAllCases(bubbleSort, "BubbleSort");
}

@test:Config {}
function testInsertionSort() {
    assertAllCases(insertionSort, "InsertionSort");
}

// After Suite Function

@test:AfterSuite
function afterSuiteFunc() {
    io:println("All tests completed.");
}
