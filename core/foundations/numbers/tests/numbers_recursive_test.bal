import ballerina/io;
import ballerina/test;

// Before Suite Function

@test:BeforeSuite
function beforeRecursiveSuiteFunc() {
    io:println("Starting recursive test suite...");
}

// Test function

@test:Config {}
function testSumOfFirstNRec(){
    int n = 0;
    test:assertEquals(sumOfFirstNRec(n), 0, "Slould be zero");
    n = 3;
    test:assertEquals(sumOfFirstNRec(n), 6, "Should be 6");
}

@test:Config {}
function testFactorialRec(){
    int n = 0;
    test:assertEquals(factorialRec(n), 1, "Should be 1");
    n = 4;
    test:assertEquals(factorialRec(n), 24, "Should be 24");
}

@test:Config {}
function testFibonacciRec(){
    int n = 0;
    test:assertEquals(fibonacciRec(n), 0, "Should be 0");
    n = 1;
    test:assertEquals(fibonacciRec(n), 1, "Should be 1");
    n = 6;
    test:assertEquals(fibonacciRec(n), 8, "Should be 8");
}

@test:Config {}
function testGreatestCommonDivisorRec(){
    int a = 12;
    int b = 8;
    test:assertEquals(greatestCommonDivisorRec(a, b), 4, "Should be 4");
    a = 7;
    b = 5;
    test:assertEquals(greatestCommonDivisorRec(a, b), 1, "Should be 1");
}

@test:Config {}
function testLeastCommonMultipleRec(){
    int a = 4;
    int b = 6;
    test:assertEquals(leastCommonMultipleRec(a, b), 12, "Should be 12");
    a = 6;
    b = 8;
    test:assertEquals(leastCommonMultipleRec(a, b), 24, "Should be 24");
}

// After Suite Function

@test:AfterSuite
function afterRecursiveSuiteFunc() {
    io:println("All tests completed.");
}
