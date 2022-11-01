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
        //  var grop = grou group;
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

  Set<T> getSF(T a) {
    if (groups.isEmpty) findGroup();
    var result = groups.firstWhere((element) => element.contains(a),
        orElse: () => <T>{});
    if (result.isNotEmpty) result.remove(a);
    return result;
  }
}
