# Returns the sum of the first n natural numbers.
#
# + n - index of the last natural number in the series
# + return - the sum 1 + 2 + ... + n
public function sumOfFirstNRec(int n) returns int {
    if (n == 0) {
        return 0;
    }
    return n + sumOfFirstNRec(n - 1);
}

# Returns the factorial of a given number.
#
# + n - number whose factorial is computed
# + return - the factorial n!
public function factorialRec(int n) returns int {
    if (n == 0 || n == 1) {
        return 1;
    }
    return n * factorialRec(n - 1);
}

# Computes the nth Fibonacci number using recursion.
#
# + n - position in the Fibonacci sequence
# + return - the nth Fibonacci number
public function fibonacciRec(int n) returns int {
    if (n == 0) {
        return 0;
    }
    if (n == 1) {
        return 1;
    }
    return fibonacciRec(n - 1) + fibonacciRec(n - 2);
}

# Computes the greatest common divisor of two numbers using recursion.
#
# + a - first operand
# + b - second operand
# + return - the greatest common divisor of a and b
public function greatestCommonDivisorRec(int a, int b) returns int {
    if (b == 0) {
        return a;
    }
    return greatestCommonDivisorRec(b, a % b);
}

# Computes the least common multiple of two numbers using recursion.
# 
# + a - first operand
# + b - second operand
# + return - the least common multiple of a and b
public function leastCommonMultipleRec(int a, int b) returns int {
    return (a * b) / greatestCommonDivisorRec(a, b);
}

// Just educative implementation, no testes due to not Tail Call Optimization (TCO) support in ballerina.
# Computes the sum of the first n natural numbers with an accumulator.
#
# + n - index of the last natural number in the series
# + return - the partial result carried by the accumulator
public function sumOfFirstNAcc(int n) returns int {
    return sumOfFirstNAccHelp(n, 0);
}
# Helper function for sumOfFirstNAcc.
# 
# + n - index of the last natural number still to add
# + acc - accumulator carrying the partial result
# + return - the sum 1 + 2 + ... + n
function sumOfFirstNAccHelp(int n, int acc) returns int {
    if (n == 0) {
        return acc;
    }
    return sumOfFirstNAccHelp(n - 1, acc + n);
}
# Computes the factorial with an accumulator.
#
# + n - number whose factorial is computed
# + return - the factorial n!
public function factorialAcc(int n) returns int {
    return factorialAccHelp(n, 1);
}
# Helper function for factorialAcc.
# 
# + n - number whose factorial is still to multiply
# + acc - accumulator carrying the partial product
# + return - the factorial n!
function factorialAccHelp(int n, int acc) returns int {
    if (n == 0) {
        return acc;
    }
    return factorialAccHelp(n - 1, acc * n);
}
# Computes the nth Fibonacci number with an accumulator.
#
# + n - position in the Fibonacci sequence
# + return - the nth Fibonacci number
public function fibonacciAcc(int n) returns int {
    return fibonacciAccHelp(n, 0, 1);
}
# Helper function for fibonacciAcc.
# 
# + n - position in the Fibonacci sequence still to advance
# + acc1 - accumulated Fibonacci value
# + acc2 - previous Fibonacci value
# + return - the nth Fibonacci number
function fibonacciAccHelp(int n, int acc1, int acc2) returns int {
    if (n == 0) {
        return acc1;
    }
    return fibonacciAccHelp(n - 1, acc2, acc1 + acc2);
}

# Computes the sum of the first n natural numbers using iteration.
# 
# + n - index of the last natural number in the series
# + return - the sum 1 + 2 + ... + n
public function sumOfFirstNIte(int n) returns int {
    int sum = 0;
    foreach int i in 1...n {
        sum += i;
    }
    return sum;
}

# Computes the factorial of a given number using iteration.
# 
# + n - number whose factorial is computed
# + return - the factorial n!
public function factorialIte(int n) returns int {
    int result = 1;
    foreach int i in 1...n {
        result *= i;
    }
    return result;
}

# Fibonacci sequence using iteration
#
# + n - position in the Fibonacci sequence
# + return - the nth Fibonacci number
public function fibonacciIte(int n) returns int {
    if (n <= 0) {
        return 0;
    }
    if (n == 1) {
        return 1;
    }
    int acc2 = 0;
    int acc1 = 1;
    int temp;
    foreach int i in 2...n {
        temp = acc1;
        acc1 = acc1 + acc2;
        acc2 = temp;
    }
    return acc1;
}

# Greatest common divisor using iteration.
# 
# + a - first operand
# + b - second operand
# + return - the greatest common divisor of a and b
public function greatestCommonDivisorIte(int a, int b) returns int {
    int x = a;
    int y = b;
    while (y != 0) {
        int temp = y;
        y = x % y;
        x = temp;
    }
    return x;
}

# Least common multiple using iteration.
#
# + a - first operand
# + b - second operand
# + return - the least common multiple of a and b
public function leastCommonMultipleIte(int a, int b) returns int {
    return (a * b) / greatestCommonDivisorIte(a, b);
}