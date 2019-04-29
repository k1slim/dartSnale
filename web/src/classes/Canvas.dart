import 'dart:html';

import '../constants/constants.dart';

class Canvas {
  num _width = PART_SIZE * FIELD_SIZE;
  num _height = PART_SIZE * FIELD_SIZE;

  CanvasElement _canvas;
  Element _counter;
  CanvasRenderingContext2D _context;

  Canvas(String canvasSelector, String counterSelector) {
    _canvas = querySelector(canvasSelector);
    _counter = querySelector(counterSelector);
    _context = _canvas.getContext('2d');

    _canvas.width = _width;
    _canvas.height = _height;
  }

  clearAll() {
    _context.clearRect(0, 0, _width, _height);
  }

  drawPoint(x, y, [width = PART_SIZE, height = PART_SIZE]) {
    _context.fillRect(x, y, width, height);
  }

  setColor(String color) {
    _context.fillStyle = color;
  }

  setCounter(String counter) {
    _counter.text = counter;
  }
}
