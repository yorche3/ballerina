// Contract stubs only; operation bodies are reserved for the implementation step.
// Solo contrato y esqueletos; los cuerpos quedan para el paso de implementacion.

public class TreeNode {
    private int value = 0;
    private TreeNode? left = ();
    private TreeNode? right = ();

    public function init(int value) {
        self.value = value;
    }

    public function getValue() returns int {
        return self.value;
    }

    public function getLeft() returns TreeNode? {
        return self.left;
    }

    public function getRight() returns TreeNode? {
        return self.right;
    }

    public function setLeft(TreeNode? node) {
        self.left = node;
    }

    public function setRight(TreeNode? node) {
        self.right = node;
    }
}

public class BinaryTree {
    private TreeNode? root = ();
    private int count = 0;

    public function init() {
    }

    public function insert(int value) {
        TreeNode newNode = new(value);
        if self.root == () {
            self.root = newNode;
            self.count += 1;
        } else {
            TreeNode? current = self.root;
            while current != () {
                if value == current.getValue() {
                    return;
                } else if value < current.getValue() {
                    if current.getLeft() == () {
                        current.setLeft(newNode);
                        self.count += 1;
                        return;
                    }
                    current = current.getLeft();
                } else {
                    if current.getRight() == () {
                        current.setRight(newNode);
                        self.count += 1;
                        return;
                    }
                    current = current.getRight();
                }
            }
        }
    }

    public function contains(int value) returns boolean {
        TreeNode? current = self.root;
        while current != () {
            if value == current.getValue() {
                return true;
            } else if value < current.getValue() {
                current = current.getLeft();
            } else {
                current = current.getRight();
            }
        }
        return false;
    }

    public function isEmpty() returns boolean {
        return self.count == 0;
    }

    public function size() returns int {
        return self.count;
    }
}

type NeighborNode record {|
    int label = 0;
    NeighborNode? next = ();
|};

class GraphNode {
    private int value = 0;
    private NeighborNode? neighbours = ();
    private GraphNode? nextVertex = ();

    function init(int label) {
        self.value = label;
    }

    function getValue() returns int {
        return self.value;
    }

    function getNextVertex() returns GraphNode? {
        return self.nextVertex;
    }

    function setNextVertex(GraphNode? next) {
        self.nextVertex = next;
    }
    function getNeighbours() returns NeighborNode? {
        return self.neighbours;
    }

    function setNeighbours(NeighborNode? neighbours) {
        self.neighbours = neighbours;
    }
}

public class Graph {
    private GraphNode? vertices = ();
    private int vertexTotal = 0;
    private int edges = 0;

    public function init() {
    }

    function findVertex(int label) returns GraphNode? {
        GraphNode? current = self.vertices;
        while current != () {
            if current.getValue() == label {
                return current;
            }
            current = current.getNextVertex();
        }
        return ();
    }

    public function addVertex(int label) {
        // El registro es idempotente: si la etiqueta ya existe no se duplica el
        // nodo ni se altera su adyacencia, y el contador no cambia.
        if self.findVertex(label) != () {
            return;
        }
        GraphNode newVertex = new(label);
        newVertex.setNextVertex(self.vertices);
        self.vertices = newVertex;
        self.vertexTotal += 1;
    }

    public function addEdge(int u, int v) returns boolean {
        GraphNode? reference = self.findVertex(u);
        GraphNode? target = self.findVertex(v);
        // Ambos extremos deben existir; se consulta sin crear nada.
        if reference == () || target == () {
            return false;
        }
        // La lista de vecinos se mantiene ordenada de forma ascendente, así que
        // se avanza hasta la primera etiqueta mayor o igual que v.
        NeighborNode? previous = ();
        NeighborNode? current = reference.getNeighbours();
        while current != () && current.label < v {
            previous = current;
            current = current.next;
        }
        // Arista repetida: es idempotente, cuenta como éxito y no se duplica.
        if current != () && current.label == v {
            return true;
        }
        NeighborNode newNeighbor = {label: v, next: current};
        if previous == () {
            reference.setNeighbours(newNeighbor);
        } else {
            previous.next = newNeighbor;
        }
        self.edges += 1;
        return true;
    }

    public function hasEdge(int u, int v) returns boolean {
        GraphNode? reference = self.findVertex(u);
        GraphNode? target = self.findVertex(v);
        if reference == () || target == () {
            return false;
        }
        NeighborNode? current = reference.getNeighbours();
        while current != () && current.label < v {
            current = current.next;
        }
        if current != () && current.label == v {
            return true;
        }
        return false;
    }

    public function getNeighbors(int u) returns int[]? {
        GraphNode? reference = self.findVertex(u);
        if reference == () {
            return ();
        }
        NeighborNode? current = reference.getNeighbours();
        int[] neighbors = [];
        while current != () {
            neighbors.push(current.label);
            current = current.next;
        }
        return neighbors;
    }

    public function isEmpty() returns boolean {
        return self.vertices == ();
    }

    public function vertexCount() returns int {
        return self.vertexTotal;
    }

    public function edgeCount() returns int {
        return self.edges;
    }
}
