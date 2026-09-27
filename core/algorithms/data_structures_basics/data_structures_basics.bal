// data_structures_basics.bal

# Representa un nodo de celda enlazada.
public class Node {
    int value;
    Node? next;

    public function init(int value) {
        self.value = value;
        self.next = ();
    }

    public function getValue() returns int {
        return self.value;
    }

    public function getNext() returns Node? {
        return self.next;
    }

    public function setNext(Node? next) {
        self.next = next;
    }
}

const int Failure_Value = -1;

# Representa una lista simplemente enlazada.
public class LinkedList {
    private Node? head;
    private Node? tail;
    private int count;

    public function init() {
        self.head = ();
        self.tail = ();
        self.count = 0;
    }

    public function isEmpty() returns boolean {
        return self.count == 0;
    }

    # Obtiene el número de elementos en la lista.
    # + return - el número de elementos en la lista.
    public function size() returns int {
        return self.count;
    }

    # Obtiene el valor del nodo cabeza de la lista.
    # + return - el valor del nodo cabeza, o FAILURE_VALUE si la lista está vacía.
    public function getHead() returns int {
        return Failure_Value;
    }

    # Obtiene el valor del nodo cola de la lista.
    # + return - el valor del nodo cola, o FAILURE_VALUE si la lista está vacía.
    public function getTail() returns int {
        return Failure_Value;
    }

    public function insertHead(int value) {
        // Implementar la inserción en la cabeza de la lista enlazada.
    }

    public function insertTail(int value) {
        // Implementar la inserción en la cola de la lista enlazada.
    }

    public function delete(int value) returns boolean {
        return false;
    }
}

# Representa una pila LIFO.
public class Stack {
    private Node? top;
    private int count;

    public function init() {
        self.top = ();
        self.count = 0;
    }

    public function isEmpty() returns boolean {
        return self.count == 0;
    }

    public function size() returns int {
        return self.count;
    }

    public function push(int value) {
        // Implementar la inserción en la cima de la pila.
    }

    public function peek() returns int {
        return Failure_Value;
    }

    public function pop() returns int {
        return Failure_Value;
    }
}

# Representa una cola FIFO.
public class Queue {
    private Node? front;
    private Node? rear;
    private int count;

    public function init() {
        self.front = ();
        self.rear = ();
        self.count = 0;
    }

    public function isEmpty() returns boolean {
        return self.count == 0;
    }

    public function size() returns int {
        return self.count;
    }

    public function enqueue(int value) {
        // Implementar la inserción en la cola de la lista enlazada.
    }

    public function peek() returns int {
        return Failure_Value;
    }

    public function dequeue() returns int {
        return Failure_Value;
    }
}