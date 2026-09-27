// data_structures_basics.bal

# Representa un nodo de celda enlazada.
public class Node {
    int value;
    Node? next;

    # Inicializa un nodo con el valor dado.
    # + value - el valor del nodo.
    public function init(int value) {
        self.value = value;
        self.next = ();
    }

    # Obtiene el valor del nodo.
    # + return - el valor del nodo.
    public function getValue() returns int {
        return self.value;
    }

    # Obtiene el nodo siguiente.
    # + return - el nodo siguiente, o `()` si no existe.
    public function getNext() returns Node? {
        return self.next;
    }

    # Establece el nodo siguiente.
    # + next - el nodo que se establecerá como siguiente.
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

    # Inicializa una lista vacía.
    public function init() {
        self.head = ();
        self.tail = ();
        self.count = 0;
    }

    # Verifica si la lista está vacía.
    # + return - `true` si la lista está vacía, `false` en caso contrario.
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
        Node? headNode = self.head;
        if headNode is Node {
            return headNode.getValue();
        }
        return Failure_Value;
    }

    # Inserta un nuevo nodo al inicio de la lista.
    # + value - el valor a insertar en la cabeza de la lista.
    public function insertHead(int value) {
        Node newNode = new(value);
        newNode.setNext(self.head);
        self.head = newNode;
        if self.tail is () {
            self.tail = newNode;
        }
        self.count += 1;
    }

    # Inserta un nuevo nodo al final de la lista.
    # + value - el valor a insertar en la cola de la lista.
    public function insertTail(int value) {
        Node newNode = new(value);
        Node? tailNode = self.tail;
        if tailNode is Node {
            tailNode.setNext(newNode);
        }
        self.tail = newNode;
        if self.head is () {
            self.head = newNode;
        }
        self.count += 1;
    }

    # Elimina el primer nodo que contiene el valor especificado.
    # + value - el valor a eliminar de la lista.
    # + return - `true` si se eliminó un nodo, `false` si no se encontró el valor.
    public function delete(int value) returns boolean {
        Node? previous = ();
        Node? current = self.head;
        while current is Node {
            if current.getValue() == value {
                if previous is Node {
                    previous.setNext(current.getNext());
                } else {
                    self.head = current.getNext();
                }
                if current.getNext() is () {
                    self.tail = previous;
                }
                self.count -= 1;
                return true;
            }
            previous = current;
            current = current.getNext();
        }
        return false;
    }
}

# Representa una pila LIFO.
public class Stack {
    private Node? top;
    private int count;

    # Inicializa una pila vacía.
    public function init() {
        self.top = ();
        self.count = 0;
    }

    # Verifica si la pila está vacía.
    # + return - `true` si la pila está vacía, `false` en caso contrario.
    public function isEmpty() returns boolean {
        return self.count == 0;
    }

    # Obtiene el número de elementos en la pila.
    # + return - el número de elementos en la pila.
    public function size() returns int {
        return self.count;
    }

    # Inserta un nuevo valor en la cima de la pila.
    # + value - el valor a insertar.
    public function push(int value) {
        Node newNode = new(value);
        newNode.setNext(self.top);
        self.top = newNode;
        self.count += 1;
    }

    # Obtiene el valor en la cima de la pila sin eliminarlo.
    # + return - el valor en la cima de la pila, o `Failure_Value` si la pila está vacía.
    public function peek() returns int {
        Node? topNode = self.top;
        if topNode is Node {
            return topNode.getValue();
        }
        return Failure_Value;
    }

    # Elimina y devuelve el valor en la cima de la pila.
    # + return - el valor eliminado de la cima de la pila, o `Failure_Value` si la pila está vacía.
    public function pop() returns int {
        Node? topNode = self.top;
        if topNode is Node {
            self.top = topNode.getNext();
            self.count -= 1;
            return topNode.getValue();
        }
        return Failure_Value;
    }
}

# Representa una cola FIFO.
public class Queue {
    private Node? front;
    private Node? rear;
    private int count;

    # Inicializa una cola vacía.
    public function init() {
        self.front = ();
        self.rear = ();
        self.count = 0;
    }

    # Verifica si la cola está vacía.
    # + return - `true` si la cola está vacía, `false` en caso contrario.
    public function isEmpty() returns boolean {
        return self.count == 0;
    }

    # Obtiene el número de elementos en la cola.
    # + return - el número de elementos en la cola.
    public function size() returns int {
        return self.count;
    }

    # Inserta un nuevo valor al final de la cola.
    # + value - el valor a insertar.
    public function enqueue(int value) {
        Node newNode = new(value);
        Node? rearNode = self.rear;
        if rearNode is Node {
            rearNode.setNext(newNode);
        } else {
            self.front = newNode;
        }
        self.rear = newNode;
        self.count += 1;
    }

    # Obtiene el valor al frente de la cola sin eliminarlo.
    # + return - el valor al frente de la cola, o `Failure_Value` si la cola está vacía.
    public function peek() returns int {
        Node? frontNode = self.front;
        if frontNode is Node {
            return frontNode.getValue();
        }
        return Failure_Value;
    }

    # Elimina y devuelve el valor al frente de la cola.
    # + return - el valor eliminado del frente de la cola, o `Failure_Value` si la cola está vacía.
    public function dequeue() returns int {
        Node? frontNode = self.front;
        if frontNode is Node {
            self.front = frontNode.getNext();
            self.count -= 1;
            if self.front is () {
                self.rear = ();
            }
            return frontNode.getValue();
        }
        return Failure_Value;
    }
}