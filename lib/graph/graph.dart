import 'dart:collection';

class DFS<T> {
  final HashMap<T, List<T>> _adj = HashMap();
  final List<Set<T>> groups = [];

  void addFriendship(T src, T dest) {
    _adj.putIfAbsent(src, () => <T>[]);
    _adj[src]!.add(dest);
    _adj.putIfAbsent(dest, () => <T>[]);
    _adj[dest]!.add(dest);
  }

  void findGroup() {
    Map<T, bool> vertex = HashMap();
    for (T t in _adj.keys) {
      vertex[t] = false;
    }
    for (T t in _adj.keys) {
      if (vertex[t] == false) {
        Set<T> group = HashSet();
        _dfs(t, vertex, group);
        groups.add(group);
      }
    }
  }

  void _dfs(T v, Map<T, bool> vertex, Set<T> group) {
    vertex[v] = true;
    group.add(v);
    for (T x in _adj[v] ?? []) {
      if ((vertex[x] ?? true) == false) _dfs(x, vertex, group);
    }
  }
}

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
  g.addFriendship(4, 16);
  g.addFriendship(11, 4);
  g.addFriendship(4, 14);

  g.findGroup();
  print(g.groups);
}
 



































  // print("Friends :" + g.getSF(4).toString());


 // Set<T> getSF(T a) {
  //   if (groups.isEmpty) findGroup();
  //   var result = groups.firstWhere((element) => element.contains(a),
  //       orElse: () => <T>{});
  //   if (result.isNotEmpty) result.remove(a);
  //   return result;
  // }