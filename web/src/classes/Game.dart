import 'dart:async';
import 'dart:html';

import '../constants/constants.dart';
import '../enums/Directions.dart';
import 'Canvas.dart';
import 'Food.dart';
import 'Snake.dart';

drawSnake(Canvas canvas, Snake snake) {
  snake.getSnake().forEach(
      (part) => canvas.drawPoint(part.x * PART_SIZE, part.y * PART_SIZE));
}

drawFood(Canvas canvas, Food food) {
  canvas.drawPoint(food.x * PART_SIZE, food.y * PART_SIZE);
}

const stepDuration = Duration(milliseconds: 300);

class Game {
  Snake _snake;
  Food _food;
  Canvas _canvas;
  Timer _interval;

  Direction _direction;

  Game() {
    _snake = Snake();
    _food = Food();
    _canvas = Canvas('#canvas');

    _setDirection(Direction.right);
    _setupHandlers();
  }

  _setDirection(Direction direction) {
    _direction = direction;
  }

  play() {
    _startInterval(_makeStep);
  }

  _makeStep() {
    if (_snake.canEat(_food)) {
      _snake.eat(_direction);
      _food = Food();
    } else {
      _snake.move(_direction);
    }

    if (_snake.checkIntersection()) {
      _stopInterval();
    }

    _canvas.clearAll();
    drawSnake(_canvas, _snake);
    drawFood(_canvas, _food);
  }

  _startInterval(Function cb) {
    _interval = new Timer.periodic(stepDuration, (Timer t) => cb());
  }

  _stopInterval() {
    _interval.cancel();
  }

  _onKeyDown(KeyboardEvent event) {
    switch (event.keyCode) {
      case KeyCode.RIGHT:
        _setDirection(Direction.right);
        break;
      case KeyCode.LEFT:
        _setDirection(Direction.left);
        break;
      case KeyCode.UP:
        _setDirection(Direction.up);
        break;
      case KeyCode.DOWN:
        _setDirection(Direction.down);
        break;
    }
  }

  _setupHandlers() {
    window.onKeyDown.listen(_onKeyDown);
  }
}
