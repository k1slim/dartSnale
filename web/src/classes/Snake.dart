import '../constants/constants.dart';
import '../enums/Directions.dart';
import 'Food.dart';
import 'Point.dart';

getCoordinate(coordinate) {
  if (coordinate < 0) {
    return FIELD_SIZE - 1;
  } else if (coordinate > FIELD_SIZE - 1) {
    return 0;
  }

  return coordinate;
}

class Snake {
  List<Point> _snake = [Point.origin()];

  getSnake() {
    return _snake;
  }

  _getNextHead(Direction direction) {
    switch (direction) {
      case Direction.left:
        {
          return Point(getCoordinate(_snake[0].x - 1), _snake[0].y);
        }
        break;
      case Direction.right:
        {
          return Point(getCoordinate(_snake[0].x + 1), _snake[0].y);
        }
        break;
      case Direction.up:
        {
          return Point(_snake[0].x, getCoordinate(_snake[0].y - 1));
        }
        break;
      case Direction.down:
        {
          return Point(_snake[0].x, getCoordinate(_snake[0].y + 1));
        }
    }
  }

  move(Direction direction) {
    Point nextHead = _getNextHead(direction);

    _snake.insert(0, nextHead);
    _snake.removeLast();
  }

  eat(direction) {
    Point nextHead = _getNextHead(direction);

    _snake.insert(0, nextHead);
  }

  canEat(Food food) {
    Point head = _snake[0];

    return food.x == head.x && food.y == head.y;
  }

  checkIntersection() {
    final head = _snake[0];

    return _snake.skip(1).contains(head);
  }
}
