class Point {
  int x;
  int y;

  Point(this.x, this.y);

  Point.fromPoint(Point part) {
    x = part.x;
    y = part.y;
  }

  Point.origin() {
    x = 0;
    y = 0;
  }

  bool operator ==(point) => point is Point && point.x == x && point.y == y;
}
