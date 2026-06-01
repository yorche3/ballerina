# Package Overview

This package provides a simple function to print "Hello, World!" to the command line. Additionally, you can provide a name to the function to print a personalized greeting.

# Usage

## Importing the Package

```ballerina
import ballerina/io;
import yorche3/calculator;
```

## Using the hello Function

```ballerina
public function main() {
    string greeting = yorche3:hello("Ballerina");
    io:println(yorche3:hello("Ballerina")); // Output: Hello, Ballerina
}
```

You can call the `hello` function without any arguments to get the default greeting:

```ballerina
public function main() {
    string greeting = yorche3:hello();
    io:println(greeting); // Output: Hello, World!
}
```
