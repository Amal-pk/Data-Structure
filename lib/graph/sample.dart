import 'package:graphs/graphs.dart';

class Graph {
  final Map<Vertex, List<Vertex>> nodes;

  Graph(this.nodes);
}

class Vertex {
  final int id;
  final int data;

  Vertex(this.id, this.data);

  @override
  bool operator ==(Object other) => other is Vertex && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => '<$id -> $data>';
}

void main() {
  var nodeA = Vertex(2, 1);
  var nodeB = Vertex(5, 2);
  var nodeC = Vertex(1, 3);
  var nodeD = Vertex(3, 4);
  var graph = Graph({
    nodeA: [nodeB, nodeC],
    nodeB: [nodeC, nodeD],
    nodeC: [nodeB, nodeD]
  });
  // var graph = Graph({});
  var components = stronglyConnectedComponents<Vertex>(
      graph.nodes.keys, (node) => graph.nodes[node] ?? []);

  print(components);
}
