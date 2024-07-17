import 'dart:collection';

class Point {
  final int x;
  final int y;

  Point (this.x, this.y);

  @override
  bool operator == (Object other) =>
    identical(this, other) ||
    other is Point && 
    runtimeType == other.runtimeType &&
    x == other.x &&
    y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() => '($y.$x)';
}

List<Point> shortestPathAlgoritm (List<List<String>> field, Point start, Point end, int rows, int cols) {
  // Для початку було створено масив напрямків для правильного пошуку шляху
  final List<List<int>> directions = [
    [-1, 0], [1, 0], [0, -1], [0, 1], // Напрямки для пошуку вгору, вниз, вліво, вправо
    [1, 1], [-1, 1], [1, -1], [-1, -1] // Напрямки для пошуку по діагоналі
  ];

  //Створення черги
  Queue<Point> queue = Queue();
  queue.add(start);

  //Зберігаються відвідані точки
  List<List<bool>> visited = List.generate(rows, (_) => List.filled(cols, false));
  visited[start.x][start.y] = true;

  Map<Point, Point?> parent = {};

  while(queue.isNotEmpty){
    Point current = queue.removeFirst();

    if(current.x == end.x && current.y == end.y) {
      List<Point> path = [];
      Point? pathCurrent = current;
      while(pathCurrent != null){
        path.add(pathCurrent);
        pathCurrent = parent[pathCurrent];
      }
      return path.reversed.toList();
    }
    for (var direction in directions){
      int newX = current.x + direction[0];
      int newY = current.y + direction[1];

      if(newX >= 0 && newX < rows && newY >= 0 && newY < cols && field[newX][newY] == '.' && !visited[newX][newY]) {
        queue.add(Point(newX, newY));
        visited[newX][newY] = true;
        parent[Point(newX, newY)] = current;
      }
    }
  }

  return [];
}

String formatPath(List<Point> path){
  return path.map((point) => '(${point.x},${point.y})').join('->');
}