# Returns the sum of two integers.
# Parameters:
# 
# + a - parameter description  
# + b - parameter description
# + return - return value description
public function addition(int a, int b) returns int {
    return a + b;
}

# Return the difference between two integers.
# Parameters:
# 
# + a - parameter description  
# + b - parameter description
# + return - return value description
public function subtraction(int a, int b) returns int {
    return a - b;
}

# Return the product of two integers.
# Product is the result of add a to itself b times.
# Parameters:
# 
# + a - parameter description  
# + b - parameter description
# + return - return value description
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
# + a - parameter description  
# + b - parameter description
# + return - return value description
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
# + a - parameter description 
# + b - parameter description
# + return - return value description
public function modulus(int a, int b) returns int {
    int quotient = division(a, b);
    return subtraction(a, multiplication(b, quotient));
}