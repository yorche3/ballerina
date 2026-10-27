// Contract stubs only; operation bodies are reserved for the implementation step.
// Solo contrato y esqueletos; los cuerpos quedan para el paso de implementacion.

public class TreeNode {
    private int value = 0;
    private TreeNode? left = ();
    private TreeNode? right = ();

    public function init(int value) {
    }

    public function getValue() returns int {
        return 0;
    }

    public function getLeft() returns TreeNode? {
        return ();
    }

    public function getRight() returns TreeNode? {
        return ();
    }

    public function setLeft(TreeNode? node) {
    }

    public function setRight(TreeNode? node) {
    }
}

public class BinaryTree {
    private TreeNode? root = ();
    private int count = 0;

    public function init() {
    }

    public function insert(int value) {
    }

    public function contains(int value) returns boolean {
        return false;
    }

    public function isEmpty() returns boolean {
        return false;
    }

    public function size() returns int {
        return 0;
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
    }
}

public class Graph {
    private GraphNode? vertices = ();
    private int vertexTotal = 0;
    private int edges = 0;

    public function init() {
    }

    public function addVertex(int label) {
    }

    public function addEdge(int u, int v) returns boolean {
        return false;
    }

    public function hasEdge(int u, int v) returns boolean {
        return false;
    }

    public function getNeighbors(int u) returns int[]? {
        return ();
    }

    public function isEmpty() returns boolean {
        return false;
    }

    public function vertexCount() returns int {
        return 0;
    }

    public function edgeCount() returns int {
        return 0;
    }
}
