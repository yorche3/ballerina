# Returns the sum of two integers.
# Parameters:
# 
# + a - first addend
# + b - second addend
# + return - the sum of a and b
public function addition(int a, int b) returns int {
    return a + b;
}

# Return the difference between two integers.
# Parameters:
# 
# + a - minuend
# + b - subtrahend
# + return - the difference a - b
public function subtraction(int a, int b) returns int {
    return a - b;
}

# Return the product of two integers.
# Product is the result of add a to itself b times.
# Parameters:
# 
# + a - multiplicand
# + b - multiplier, how many times a is added
# + return - the product, built as repeated addition
public function multiplication(int a, int b) returns int {
    int product = 0;
    foreach var i in 0..<b {
        product = addition(product, a);
    }
    return product;
}

# Return the quotient of two integers.
# Quotient is the result of how many times b can be subtracted from a.
# Parameters:
#
# + a - dividend
# + b - divisor
# + return - the quotient, counted as repeated subtraction
public function division(int a, int b) returns int {
    int quotient = 0;
    int remainder = a;
    while (remainder >= b) {
        remainder = subtraction(remainder, b);
        quotient = addition(quotient, 1);
    }
    return quotient;
}

# Return the remainder of two integers.
# Remainder is what is left after subtracting b from a.
# Parameters:
# 
# + a - dividend
# + b - divisor
# + return - the remainder a - (quotient * b)
public function modulus(int a, int b) returns int {
    int quotient = division(a, b);
    return subtraction(a, multiplication(b, quotient));
}