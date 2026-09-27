import ballerina/io;
import ballerina/test;

// Fixtures for testing data structures
final int NODE_VAL_10 = 10;
final int NODE_VAL_20 = 20;

final int LL_VAL_10 = 10;
final int LL_VAL_20 = 20;
final int LL_VAL_5 = 5;
final int LL_VAL_ABSENT = 99;

final int STACK_VAL_10 = 10;
final int STACK_VAL_20 = 20;
final int STACK_VAL_30 = 30;
final int STACK_VAL_40 = 40;

final int QUEUE_VAL_10 = 10;
final int QUEUE_VAL_20 = 20;
final int QUEUE_VAL_30 = 30;
final int QUEUE_VAL_40 = 40;

@test:BeforeSuite
function beforeSuiteFunc() {
    io:println("Starting data_structures_basics test suite...");
}

@test:Config {}
function testNode() {
    // Caso 1: Inicializar y observar valor/enlace
    Node a = new (NODE_VAL_10);
    test:assertEquals(a.getValue(), NODE_VAL_10, "Node step 1: should have value 10 after init");
    test:assertEquals(a.getNext(), (), "Node step 1: should have next absent after init");

    // Caso 2: Inicializar otro nodo, enlazar y recorrer
    Node b = new (NODE_VAL_20);
    a.setNext(b);
    Node? nextA = a.getNext();
    test:assertTrue(nextA is Node, "Node step 2: next of a should be a valid Node");
    if nextA is Node {
        test:assertEquals(nextA.getValue(), NODE_VAL_20, "Node step 2: traversal should reach value 20");
    }
    test:assertEquals(b.getNext(), (), "Node step 2: next of b should be absent");
}

@test:Config {}
function testLinkedList() {
    // Paso 1: Estado vacío
    LinkedList list = new ();
    test:assertTrue(list.isEmpty(), "LinkedList step 1: should be empty after init");
    test:assertEquals(list.size(), 0, "LinkedList step 1: should have size 0 after init");
    test:assertEquals(list.getHead(), Failure_Value, "LinkedList step 1: getHead on empty should return Failure_Value");

    // Paso 2: Insertar por ambos extremos
    list.insertTail(LL_VAL_10);
    list.insertTail(LL_VAL_20);
    list.insertHead(LL_VAL_5);
    list.insertTail(LL_VAL_10);
    test:assertEquals(list.size(), 4, "LinkedList step 2: should have size 4 after insertions");
    test:assertEquals(list.getHead(), LL_VAL_5, "LinkedList step 2: should have head 5 after insertions");

    // Paso 3: Eliminar primera aparición
    test:assertTrue(list.delete(LL_VAL_10), "LinkedList step 3: should succeed deleting 10");
    test:assertEquals(list.getHead(), LL_VAL_5, "LinkedList step 3: should have head 5 after deleting first 10");
    test:assertEquals(list.size(), 3, "LinkedList step 3: should have size 3 after deleting first 10");

    // Paso 4: Valor ausente
    test:assertFalse(list.delete(LL_VAL_ABSENT), "LinkedList step 4: should fail deleting absent value 99");
    test:assertEquals(list.getHead(), LL_VAL_5, "LinkedList step 4: should keep head 5 after absent deletion");
    test:assertEquals(list.size(), 3, "LinkedList step 4: should keep size 3 after absent deletion");

    // Paso 5: Vaciar
    test:assertTrue(list.delete(LL_VAL_5), "LinkedList step 5: should succeed deleting 5");
    test:assertEquals(list.getHead(), LL_VAL_20, "LinkedList step 5: should have head 20 after deleting 5");
    test:assertTrue(list.delete(LL_VAL_20), "LinkedList step 5: should succeed deleting 20");
    test:assertEquals(list.getHead(), LL_VAL_10, "LinkedList step 5: should have head 10 after deleting 20");
    test:assertTrue(list.delete(LL_VAL_10), "LinkedList step 5: should succeed deleting 10");
    test:assertTrue(list.isEmpty(), "LinkedList step 5: should be empty after emptying");
    test:assertEquals(list.size(), 0, "LinkedList step 5: should have size 0 after emptying");
    test:assertEquals(list.getHead(), Failure_Value, "LinkedList step 5: should return Failure_Value on empty getHead after emptying");
}

@test:Config {}
function testStack() {
    // Paso 1: Estado vacío y extracción fallida
    Stack s = new ();
    test:assertTrue(s.isEmpty(), "Stack step 1: should be empty after init");
    test:assertEquals(s.size(), 0, "Stack step 1: should have size 0 after init");
    test:assertEquals(s.peek(), Failure_Value, "Stack step 1: peek on empty should return Failure_Value");
    test:assertEquals(s.pop(), Failure_Value, "Stack step 1: pop on empty should return Failure_Value");
    test:assertTrue(s.isEmpty(), "Stack step 1: failed pop should preserve empty state");

    // Paso 2: LIFO y peek no mutante
    s.push(STACK_VAL_10);
    s.push(STACK_VAL_20);
    s.push(STACK_VAL_30);
    test:assertEquals(s.peek(), STACK_VAL_30, "Stack step 2: peek should return 30");
    test:assertEquals(s.size(), 3, "Stack step 2: should have size 3");

    // Paso 3: Extracción y reutilización
    test:assertEquals(s.pop(), STACK_VAL_30, "Stack step 3: first pop should return 30");
    s.push(STACK_VAL_40);
    test:assertEquals(s.pop(), STACK_VAL_40, "Stack step 3: reused top pop should return 40");
    test:assertEquals(s.pop(), STACK_VAL_20, "Stack step 3: next pop should return 20");
    test:assertEquals(s.pop(), STACK_VAL_10, "Stack step 3: final pop should return 10");
    test:assertTrue(s.isEmpty(), "Stack step 3: should be empty after all pops");
    test:assertEquals(s.size(), 0, "Stack step 3: should have size 0 after all pops");

    // Paso 4: Vacío tras extracción
    test:assertEquals(s.pop(), Failure_Value, "Stack step 4: pop on empty should return Failure_Value");
    test:assertTrue(s.isEmpty(), "Stack step 4: should stay empty");
}

@test:Config {}
function testQueue() {
    // Paso 1: Estado vacío y extracción fallida
    Queue q = new ();
    test:assertTrue(q.isEmpty(), "Queue step 1: should be empty after init");
    test:assertEquals(q.size(), 0, "Queue step 1: should have size 0 after init");
    test:assertEquals(q.peek(), Failure_Value, "Queue step 1: peek on empty should return Failure_Value");
    test:assertEquals(q.dequeue(), Failure_Value, "Queue step 1: dequeue on empty should return Failure_Value");
    test:assertTrue(q.isEmpty(), "Queue step 1: failed dequeue should preserve empty state");

    // Paso 2: FIFO y peek no mutante
    q.enqueue(QUEUE_VAL_10);
    q.enqueue(QUEUE_VAL_20);
    q.enqueue(QUEUE_VAL_30);
    test:assertEquals(q.peek(), QUEUE_VAL_10, "Queue step 2: peek should return 10");
    test:assertEquals(q.size(), 3, "Queue step 2: should have size 3");

    // Paso 3: Extracción y reutilización
    test:assertEquals(q.dequeue(), QUEUE_VAL_10, "Queue step 3: first dequeue should return 10");
    q.enqueue(QUEUE_VAL_40);
    test:assertEquals(q.dequeue(), QUEUE_VAL_20, "Queue step 3: next dequeue should return 20");
    test:assertEquals(q.dequeue(), QUEUE_VAL_30, "Queue step 3: next dequeue should return 30");
    test:assertEquals(q.dequeue(), QUEUE_VAL_40, "Queue step 3: final dequeue should return 40");
    test:assertTrue(q.isEmpty(), "Queue step 3: should be empty after all dequeues");
    test:assertEquals(q.size(), 0, "Queue step 3: should have size 0 after all dequeues");

    // Paso 4: Vacío tras extracción
    test:assertEquals(q.dequeue(), Failure_Value, "Queue step 4: dequeue on empty should return Failure_Value");
    test:assertTrue(q.isEmpty(), "Queue step 4: should stay empty");
}

@test:AfterSuite
function afterSuiteFunc() {
    io:println("All tests completed.");
}
