import 'package:graph/graph/graph.dart';
import 'package:test/test.dart';

void main() {
  DFS<int> g = DFS();
 g.addFriendship(20, 1);
  g.addFriendship(20, 18);
  g.addFriendship(1, 20);
  g.addFriendship(16, 4);
  g.addFriendship(18, 11);
  g.addFriendship(11, 1);
  g.addFriendship(12, 14);
  g.addFriendship(18, 12);
  g.addFriendship(20, 11);
  g.addFriendship(20, 12);
  g.addFriendship(20, 16);
  g.addFriendship(11, 4);
  g.findGroup();
  print(g.groups);
  // String name = "Abhi";
  // print("Friends" + ":" + g.getSF(20).toString());
}
