import 'dart:math';

import 'package:safe_cast/safe_cast.dart';

abstract class Fruit {}

class Apple extends Fruit {}

class Banana extends Fruit {}

class Car {}

dynamic _randomObject() => switch (Random().nextInt(3)) {
      0 => Apple(),
      1 => Banana(),
      _ => Car(),
    };

void main() {
  dynamic object = _randomObject();
  final fruit = Cast.asNullable<Fruit>(object);
  if (fruit != null) {
    print('Eat fruit $fruit');
  } else {
    final car = Cast.as<Car>(object);
    print('Driving a $car');
  }
}
