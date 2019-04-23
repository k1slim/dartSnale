import 'dart:math';

import '../constants/constants.dart';

class Food {
  int x;
  int y;

  Random random = Random();

  Food() {
    x = random.nextInt(FIELD_SIZE - 1);
    y = random.nextInt(FIELD_SIZE - 1);
  }
}
