import ballerina/io;
import ballerina/test;

// Before Suite Function

@test:BeforeSuite
function beforeSuiteFunc() {
    io:println("Starting Calculator suite");
}

// Test function

@test:Config {}
function testAddition() {
    test:assertEquals(addition(2, 3), 5, "should be 5");
}

@test:Config {}
function testSubtraction() {
    test:assertEquals(subtraction(5, 2), 3, "should be 2");
}

@test:Config {}
function testMultiplication() {
    test:assertEquals(multiplication(3, 4), 12, "should be 12");
}

@test:Config {}
function testDivision() {
    test:assertEquals(division(10, 3), 3, "should be 3");
}

@test:Config {}
function testModulus() {
    test:assertEquals(modulus(10, 3), 1, "should be 1");
}

// After Suite Function

@test:AfterSuite
function afterSuiteFunc() {
    io:println("All tests are done!");
}
