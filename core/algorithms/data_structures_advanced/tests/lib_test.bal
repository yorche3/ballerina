import ballerina/test;

type TestStep record {|
    string operation;
    int[] arguments = [];
|};

type TestCase record {|
    TestStep[] caseInput;
    json[] expectedOutput;
|};

final TestStep[] NODE_CREATE_INPUT = [{operation: "getValue"}];
final json[] NODE_CREATE_OUTPUT = [10];
final TestStep[] NODE_ABSENT_LINKS_INPUT = [
    {operation: "getLeft"}, {operation: "getRight"}
];
final json[] NODE_ABSENT_LINKS_OUTPUT = [(), ()];
final TestStep[] NODE_LINK_CHILDREN_INPUT = [
    {operation: "setLeft", arguments: [20]},
    {operation: "setRight", arguments: [30]},
    {operation: "getLeft"}, {operation: "getRight"}
];
final json[] NODE_LINK_CHILDREN_OUTPUT = [(), (), 20, 30];
final TestStep[] NODE_TRAVERSE_LINKS_INPUT = [
    {operation: "setLeft", arguments: [20]},
    {operation: "setRight", arguments: [30]},
    {operation: "traverseLeft"}, {operation: "traverseRight"}
];
final json[] NODE_TRAVERSE_LINKS_OUTPUT = [(), (), [20, (), ()], [30, (), ()]];
final TestStep[] NODE_UNLINK_CHILDREN_INPUT = [
    {operation: "setLeft", arguments: [20]},
    {operation: "setRight", arguments: [30]},
    {operation: "setLeft"},
    {operation: "getValue"}, {operation: "getLeft"}, {operation: "getRight"},
    {operation: "setRight"},
    {operation: "getValue"}, {operation: "getLeft"}, {operation: "getRight"}
];
final json[] NODE_UNLINK_CHILDREN_OUTPUT = [(), (), (), 10, (), 30, (), 10, (), ()];

final TestStep[] TREE_CREATE_EMPTY_INPUT = [
    {operation: "isEmpty"}, {operation: "size"}, {operation: "contains", arguments: [50]}
];
final json[] TREE_CREATE_EMPTY_OUTPUT = [true, 0, false];
final TestStep[] TREE_INSERT_ROOT_INPUT = [
    {operation: "insert", arguments: [50]}, {operation: "size"},
    {operation: "isEmpty"}, {operation: "contains", arguments: [50]}
];
final json[] TREE_INSERT_ROOT_OUTPUT = [(), 1, false, true];
final TestStep[] TREE_LOWER_HIGHER_INPUT = [
    {operation: "insert", arguments: [50]},
    {operation: "insert", arguments: [30]},
    {operation: "insert", arguments: [70]},
    {operation: "size"},
    {operation: "contains", arguments: [50]},
    {operation: "contains", arguments: [30]},
    {operation: "contains", arguments: [70]}
];
final json[] TREE_LOWER_HIGHER_OUTPUT = [(), (), (), 3, true, true, true];
final TestStep[] TREE_MULTILEVEL_INPUT = [
    {operation: "insert", arguments: [50]},
    {operation: "insert", arguments: [30]},
    {operation: "insert", arguments: [70]},
    {operation: "insert", arguments: [20]},
    {operation: "insert", arguments: [40]},
    {operation: "contains", arguments: [50]},
    {operation: "contains", arguments: [30]},
    {operation: "contains", arguments: [70]},
    {operation: "contains", arguments: [20]},
    {operation: "contains", arguments: [40]},
    {operation: "size"}
];
final json[] TREE_MULTILEVEL_OUTPUT = [
    (), (), (), (), (), true, true, true, true, true, 5
];
final TestStep[] TREE_MISSING_VALUE_INPUT = [
    {operation: "insert", arguments: [50]},
    {operation: "contains", arguments: [99]},
    {operation: "size"}, {operation: "contains", arguments: [50]}
];
final json[] TREE_MISSING_VALUE_OUTPUT = [(), false, 1, true];
final TestStep[] TREE_DUPLICATE_INPUT = [
    {operation: "insert", arguments: [50]},
    {operation: "insert", arguments: [30]},
    {operation: "insert", arguments: [70]},
    {operation: "insert", arguments: [30]},
    {operation: "size"},
    {operation: "contains", arguments: [50]},
    {operation: "contains", arguments: [30]},
    {operation: "contains", arguments: [70]}
];
final json[] TREE_DUPLICATE_OUTPUT = [(), (), (), (), 3, true, true, true];
final TestStep[] TREE_ORDERED_INPUT = [
    {operation: "insert", arguments: [20]},
    {operation: "insert", arguments: [30]},
    {operation: "insert", arguments: [40]},
    {operation: "insert", arguments: [50]},
    {operation: "insert", arguments: [70]},
    {operation: "size"},
    {operation: "contains", arguments: [20]},
    {operation: "contains", arguments: [30]},
    {operation: "contains", arguments: [40]},
    {operation: "contains", arguments: [50]},
    {operation: "contains", arguments: [70]},
    {operation: "contains", arguments: [99]}
];
final json[] TREE_ORDERED_OUTPUT = [
    (), (), (), (), (), 5, true, true, true, true, true, false
];

final TestStep[] GRAPH_CREATE_EMPTY_INPUT = [
    {operation: "isEmpty"}, {operation: "vertexCount"}, {operation: "edgeCount"},
    {operation: "hasEdge", arguments: [10, 30]},
    {operation: "getNeighbors", arguments: [10]}
];
final json[] GRAPH_CREATE_EMPTY_OUTPUT = [true, 0, 0, false, ()];
final TestStep[] GRAPH_ISOLATED_VERTEX_INPUT = [
    {operation: "addVertex", arguments: [10]}, {operation: "isEmpty"},
    {operation: "vertexCount"}, {operation: "edgeCount"},
    {operation: "getNeighbors", arguments: [10]}
];
final json[] GRAPH_ISOLATED_VERTEX_OUTPUT = [(), false, 1, 0, []];
final TestStep[] GRAPH_DIRECTED_EDGE_INPUT = [
    {operation: "addVertex", arguments: [10]},
    {operation: "addVertex", arguments: [70]},
    {operation: "addEdge", arguments: [10, 70]},
    {operation: "hasEdge", arguments: [10, 70]},
    {operation: "hasEdge", arguments: [70, 10]},
    {operation: "vertexCount"}, {operation: "edgeCount"}
];
final json[] GRAPH_DIRECTED_EDGE_OUTPUT = [(), (), true, true, false, 2, 1];
final TestStep[] GRAPH_DUPLICATE_VERTEX_INPUT = [
    {operation: "addVertex", arguments: [10]},
    {operation: "addVertex", arguments: [30]},
    {operation: "addEdge", arguments: [10, 30]},
    {operation: "addVertex", arguments: [10]},
    {operation: "vertexCount"}, {operation: "edgeCount"},
    {operation: "getNeighbors", arguments: [10]}
];
final json[] GRAPH_DUPLICATE_VERTEX_OUTPUT = [(), (), true, (), 2, 1, [30]];
final TestStep[] GRAPH_DUPLICATE_EDGE_INPUT = [
    {operation: "addVertex", arguments: [10]},
    {operation: "addVertex", arguments: [30]},
    {operation: "addEdge", arguments: [10, 30]},
    {operation: "addEdge", arguments: [10, 30]},
    {operation: "vertexCount"}, {operation: "edgeCount"},
    {operation: "getNeighbors", arguments: [10]}
];
final json[] GRAPH_DUPLICATE_EDGE_OUTPUT = [(), (), true, true, 2, 1, [30]];
final TestStep[] GRAPH_MISSING_ENDPOINT_INPUT = [
    {operation: "addVertex", arguments: [10]},
    {operation: "addVertex", arguments: [30]},
    {operation: "addEdge", arguments: [10, 30]},
    {operation: "addEdge", arguments: [10, 99]},
    {operation: "addEdge", arguments: [99, 10]},
    {operation: "addEdge", arguments: [98, 99]},
    {operation: "addEdge", arguments: [99, 99]},
    {operation: "vertexCount"}, {operation: "edgeCount"},
    {operation: "getNeighbors", arguments: [10]},
    {operation: "getNeighbors", arguments: [30]},
    {operation: "hasEdge", arguments: [10, 99]},
    {operation: "hasEdge", arguments: [99, 10]},
    {operation: "hasEdge", arguments: [98, 99]},
    {operation: "hasEdge", arguments: [99, 99]},
    {operation: "getNeighbors", arguments: [98]},
    {operation: "getNeighbors", arguments: [99]}
];
final json[] GRAPH_MISSING_ENDPOINT_OUTPUT = [
    (), (), true, false, false, false, false, 2, 1, [30], [], false, false, false,
    false, (), ()
];
final TestStep[] GRAPH_SORTED_NEIGHBORS_INPUT = [
    {operation: "addVertex", arguments: [10]},
    {operation: "addVertex", arguments: [30]},
    {operation: "addVertex", arguments: [50]},
    {operation: "addVertex", arguments: [70]},
    {operation: "addEdge", arguments: [10, 70]},
    {operation: "addEdge", arguments: [10, 30]},
    {operation: "addEdge", arguments: [10, 50]},
    {operation: "addEdge", arguments: [30, 50]},
    {operation: "getNeighbors", arguments: [10]},
    {operation: "getNeighbors", arguments: [30]},
    {operation: "getNeighbors", arguments: [50]},
    {operation: "getNeighbors", arguments: [70]},
    {operation: "vertexCount"}, {operation: "edgeCount"}
];
final json[] GRAPH_SORTED_NEIGHBORS_OUTPUT = [
    (), (), (), (), true, true, true, true, [30, 50, 70], [50], [], [], 4, 4
];
final TestStep[] GRAPH_MISSING_EDGE_INPUT = [
    {operation: "addVertex", arguments: [10]},
    {operation: "addVertex", arguments: [30]},
    {operation: "hasEdge", arguments: [10, 30]},
    {operation: "vertexCount"}, {operation: "edgeCount"}, {operation: "isEmpty"}
];
final json[] GRAPH_MISSING_EDGE_OUTPUT = [(), (), false, 2, 0, false];
final TestStep[] GRAPH_MISSING_VERTEX_INPUT = [
    {operation: "addVertex", arguments: [10]},
    {operation: "getNeighbors", arguments: [99]},
    {operation: "getNeighbors", arguments: [10]},
    {operation: "vertexCount"}, {operation: "edgeCount"}
];
final json[] GRAPH_MISSING_VERTEX_OUTPUT = [(), (), [], 1, 0];
final TestStep[] GRAPH_SELF_LOOP_INPUT = [
    {operation: "addVertex", arguments: [10]},
    {operation: "addEdge", arguments: [10, 10]},
    {operation: "addEdge", arguments: [10, 10]},
    {operation: "hasEdge", arguments: [10, 10]},
    {operation: "getNeighbors", arguments: [10]},
    {operation: "vertexCount"}, {operation: "edgeCount"}
];
final json[] GRAPH_SELF_LOOP_OUTPUT = [(), true, true, true, [10], 1, 1];
final TestStep[] GRAPH_NEIGHBOR_ISOLATION_INPUT = [
    {operation: "addVertex", arguments: [10]},
    {operation: "addVertex", arguments: [30]},
    {operation: "addVertex", arguments: [50]},
    {operation: "addEdge", arguments: [10, 30]},
    {operation: "saveNeighbors", arguments: [10]},
    {operation: "mutateReturnedNeighbors", arguments: [10, 50]},
    {operation: "getNeighbors", arguments: [10]},
    {operation: "addEdge", arguments: [10, 50]},
    {operation: "savedNeighbors"},
    {operation: "getNeighbors", arguments: [10]},
    {operation: "vertexCount"}, {operation: "edgeCount"}
];
final json[] GRAPH_NEIGHBOR_ISOLATION_OUTPUT = [
    (), (), (), true, [30], true, [30], true, [30], [30, 50], 3, 2
];

function treeNodeCases() returns map<[string, TestCase]> {
    return {
        "createNode": ["createNode", {caseInput: NODE_CREATE_INPUT, expectedOutput: NODE_CREATE_OUTPUT}],
        "absentInitialLinks": ["absentInitialLinks", {
            caseInput: NODE_ABSENT_LINKS_INPUT, expectedOutput: NODE_ABSENT_LINKS_OUTPUT
        }],
        "linkChildren": ["linkChildren", {
            caseInput: NODE_LINK_CHILDREN_INPUT, expectedOutput: NODE_LINK_CHILDREN_OUTPUT
        }],
        "traverseLinks": ["traverseLinks", {
            caseInput: NODE_TRAVERSE_LINKS_INPUT, expectedOutput: NODE_TRAVERSE_LINKS_OUTPUT
        }],
        "unlinkChildren": ["unlinkChildren", {
            caseInput: NODE_UNLINK_CHILDREN_INPUT, expectedOutput: NODE_UNLINK_CHILDREN_OUTPUT
        }]
    };
}

function binaryTreeCases() returns map<[string, TestCase]> {
    return {
        "createEmpty": ["createEmpty", {
            caseInput: TREE_CREATE_EMPTY_INPUT, expectedOutput: TREE_CREATE_EMPTY_OUTPUT
        }],
        "insertRoot": ["insertRoot", {
            caseInput: TREE_INSERT_ROOT_INPUT, expectedOutput: TREE_INSERT_ROOT_OUTPUT
        }],
        "insertLowerAndHigher": ["insertLowerAndHigher", {
            caseInput: TREE_LOWER_HIGHER_INPUT, expectedOutput: TREE_LOWER_HIGHER_OUTPUT
        }],
        "multilevelBranches": ["multilevelBranches", {
            caseInput: TREE_MULTILEVEL_INPUT, expectedOutput: TREE_MULTILEVEL_OUTPUT
        }],
        "missingValue": ["missingValue", {
            caseInput: TREE_MISSING_VALUE_INPUT, expectedOutput: TREE_MISSING_VALUE_OUTPUT
        }],
        "idempotentDuplicate": ["idempotentDuplicate", {
            caseInput: TREE_DUPLICATE_INPUT, expectedOutput: TREE_DUPLICATE_OUTPUT
        }],
        "orderedInsertions": ["orderedInsertions", {
            caseInput: TREE_ORDERED_INPUT, expectedOutput: TREE_ORDERED_OUTPUT
        }]
    };
}

function graphCases() returns map<[string, TestCase]> {
    return {
        "createEmpty": ["createEmpty", {
            caseInput: GRAPH_CREATE_EMPTY_INPUT, expectedOutput: GRAPH_CREATE_EMPTY_OUTPUT
        }],
        "isolatedVertex": ["isolatedVertex", {
            caseInput: GRAPH_ISOLATED_VERTEX_INPUT, expectedOutput: GRAPH_ISOLATED_VERTEX_OUTPUT
        }],
        "nonconsecutiveDirectedEdge": ["nonconsecutiveDirectedEdge", {
            caseInput: GRAPH_DIRECTED_EDGE_INPUT, expectedOutput: GRAPH_DIRECTED_EDGE_OUTPUT
        }],
        "duplicateVertexPreservesAdjacency": ["duplicateVertexPreservesAdjacency", {
            caseInput: GRAPH_DUPLICATE_VERTEX_INPUT, expectedOutput: GRAPH_DUPLICATE_VERTEX_OUTPUT
        }],
        "duplicateEdge": ["duplicateEdge", {
            caseInput: GRAPH_DUPLICATE_EDGE_INPUT, expectedOutput: GRAPH_DUPLICATE_EDGE_OUTPUT
        }],
        "missingEndpointWithoutMutation": ["missingEndpointWithoutMutation", {
            caseInput: GRAPH_MISSING_ENDPOINT_INPUT, expectedOutput: GRAPH_MISSING_ENDPOINT_OUTPUT
        }],
        "sortedNeighborsAndCounts": ["sortedNeighborsAndCounts", {
            caseInput: GRAPH_SORTED_NEIGHBORS_INPUT, expectedOutput: GRAPH_SORTED_NEIGHBORS_OUTPUT
        }],
        "missingEdgeQuery": ["missingEdgeQuery", {
            caseInput: GRAPH_MISSING_EDGE_INPUT, expectedOutput: GRAPH_MISSING_EDGE_OUTPUT
        }],
        "missingVertexNeighbors": ["missingVertexNeighbors", {
            caseInput: GRAPH_MISSING_VERTEX_INPUT, expectedOutput: GRAPH_MISSING_VERTEX_OUTPUT
        }],
        "selfLoopAndDuplicate": ["selfLoopAndDuplicate", {
            caseInput: GRAPH_SELF_LOOP_INPUT, expectedOutput: GRAPH_SELF_LOOP_OUTPUT
        }],
        "neighborResultIsolation": ["neighborResultIsolation", {
            caseInput: GRAPH_NEIGHBOR_ISOLATION_INPUT, expectedOutput: GRAPH_NEIGHBOR_ISOLATION_OUTPUT
        }]
    };
}

function nodeValue(TreeNode? node) returns int? {
    return node is TreeNode ? node.getValue() : ();
}

function nodeLinks(TreeNode? node) returns json {
    if node is TreeNode {
        return [node.getValue(), nodeValue(node.getLeft()), nodeValue(node.getRight())];
    }
    return ();
}

function runTreeNode(TestStep[] steps) returns json[] {
    TreeNode node = new (10);
    json[] actual = [];
    foreach TestStep step in steps {
        match step.operation {
            "getValue" => { actual.push(node.getValue()); }
            "getLeft" => { actual.push(nodeValue(node.getLeft())); }
            "getRight" => { actual.push(nodeValue(node.getRight())); }
            "traverseLeft" => { actual.push(nodeLinks(node.getLeft())); }
            "traverseRight" => { actual.push(nodeLinks(node.getRight())); }
            "setLeft" => {
                TreeNode? child = ();
                if step.arguments.length() > 0 {
                    child = new TreeNode(step.arguments[0]);
                }
                node.setLeft(child);
                actual.push(());
            }
            "setRight" => {
                TreeNode? child = ();
                if step.arguments.length() > 0 {
                    child = new TreeNode(step.arguments[0]);
                }
                node.setRight(child);
                actual.push(());
            }
            _ => { test:assertFail("TreeNode should use a known test operation: " + step.operation); }
        }
    }
    return actual;
}

function runBinaryTree(TestStep[] steps) returns json[] {
    BinaryTree tree = new ();
    json[] actual = [];
    foreach TestStep step in steps {
        match step.operation {
            "insert" => {
                tree.insert(step.arguments[0]);
                actual.push(());
            }
            "contains" => { actual.push(tree.contains(step.arguments[0])); }
            "isEmpty" => { actual.push(tree.isEmpty()); }
            "size" => { actual.push(tree.size()); }
            _ => { test:assertFail("BinaryTree should use a known test operation: " + step.operation); }
        }
    }
    return actual;
}

function runGraph(TestStep[] steps) returns json[] {
    Graph graph = new ();
    int[]? saved = ();
    json[] actual = [];
    foreach TestStep step in steps {
        match step.operation {
            "addVertex" => {
                graph.addVertex(step.arguments[0]);
                actual.push(());
            }
            "addEdge" => { actual.push(graph.addEdge(step.arguments[0], step.arguments[1])); }
            "hasEdge" => { actual.push(graph.hasEdge(step.arguments[0], step.arguments[1])); }
            "getNeighbors" => { actual.push(graph.getNeighbors(step.arguments[0]).clone()); }
            "isEmpty" => { actual.push(graph.isEmpty()); }
            "vertexCount" => { actual.push(graph.vertexCount()); }
            "edgeCount" => { actual.push(graph.edgeCount()); }
            "saveNeighbors" => {
                saved = graph.getNeighbors(step.arguments[0]);
                actual.push(saved.clone());
            }
            "mutateReturnedNeighbors" => {
                int[]? copy = graph.getNeighbors(step.arguments[0]);
                if copy is int[] {
                    copy.push(step.arguments[1]);
                    actual.push(true);
                } else {
                    actual.push(false);
                }
            }
            "savedNeighbors" => { actual.push(saved.clone()); }
            _ => { test:assertFail("Graph should use a known test operation: " + step.operation); }
        }
    }
    return actual;
}

function runCase(string subject, string caseName, TestCase fixture,
        function(TestStep[]) returns json[] execute) {
    json[] actual = execute(fixture.caseInput.clone());
    test:assertEquals(actual, fixture.expectedOutput,
        subject + " case " + caseName + " should match expected output " +
        fixture.expectedOutput.toJsonString());
}

@test:Config {dataProvider: treeNodeCases}
function testTreeNode(string caseName, TestCase fixture) {
    runCase("TreeNode", caseName, fixture, runTreeNode);
}

@test:Config {dataProvider: binaryTreeCases}
function testBinaryTree(string caseName, TestCase fixture) {
    runCase("BinaryTree", caseName, fixture, runBinaryTree);
}

@test:Config {dataProvider: graphCases}
function testGraph(string caseName, TestCase fixture) {
    runCase("Graph", caseName, fixture, runGraph);
}