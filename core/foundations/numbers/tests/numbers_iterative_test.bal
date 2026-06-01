import ballerina/io;
import ballerina/test;

// Before Suite Function

@test:BeforeSuite
function beforeIterativeSuiteFunc() {
    io:println("Starting Iterative test suite...");
}

// Test function

@test:Config {}
function testSumOfFirstNIte() {
    int n = 0;
    test:assertEquals(sumOfFirstNIte(n), 0, "Should be zero");
    n = 3;
    test:assertEquals(sumOfFirstNIte(n), 6, "Should be 6");
}

@test:Config {}
function testFactorialIte() {
    int n = 0;
    test:assertEquals(factorialIte(n), 1, "Should be 1");
    n = 4;
    test:assertEquals(factorialIte(n), 24, "Should be 24");
}

@test:Config {}
function testFibonacciIte() {
    int n = 0;
    test:assertEquals(fibonacciIte(n), 0, "Should be 0");
    n = 1;
    test:assertEquals(fibonacciIte(n), 1, "Should be 1");
    n = 6;
    test:assertEquals(fibonacciIte(n), 8, "Should be 8");
}

@test:Config {}
function testGreatestCommonDivisorIte() {
    int a = 12;
    int b = 8;
    test:assertEquals(greatestCommonDivisorIte(a, b), 4, "Should be 4");
    a = 7;
    b = 5;
    test:assertEquals(greatestCommonDivisorIte(a, b), 1, "Should be 1");
}

@test:Config {}
function testLeastCommonMultipleIte() {
    int a = 4;
    int b = 6;
    test:assertEquals(leastCommonMultipleIte(a, b), 12, "Should be 12");
    a = 6;
    b = 8;
    test:assertEquals(leastCommonMultipleIte(a, b), 24, "Should be 24");
}

// After Suite Function

@test:AfterSuite
function afterIterativeSuiteFunc() {
    io:println("All tests completed.");
}