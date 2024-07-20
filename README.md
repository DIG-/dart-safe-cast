DIG Dart Safe Cast
==================
[![Build Status](https://img.shields.io/github/actions/workflow/status/DIG-/dart-safe-cast/ci.yml)](https://github.com/DIG-/dart-safe-cast/actions/workflows/ci.yml)
[![Pub](https://img.shields.io/pub/v/safe_cast.svg)](https://pub.dev/packages/safe_cast)
[![Pub Score](https://img.shields.io/pub/points/safe_cast?color=2E8B57&label=pub%20points)](https://pub.dev/packages/safe_cast/score)
[![License](https://img.shields.io/static/v1?label=license&message=LGPL-3.0&color=blue)](https://opensource.org/license/lgpl-3-0)

- Simple syntax
- Reduces boillerplate

Usage
=====
```dart
import 'package:safe_cast/safe_cast.dart';
 ⋮
 Fruit? fruit = Cast.asNullable<Fruit>(maybeFruit);
 // or, if you need a fruit
 Fruit fruit = SafeCast.as<Fruit>(maybeFruit, ifNull: () => availableFruit());
```

How effective it is
-------------------
It is better for chained operations..
```dart
CuttedFruit? cutted = maybeFruit is Fruit ? maybeFruit.cut(fruitCutter) : null;
// intead of
CuttedFruit? cutted = Cast.asNullable<Fruit>(maybeFruit)?.cut(fruitCutter);
```

License
=======
[GNU Lesser General Public License version 3 (LGPL-3.0)](https://opensource.org/license/lgpl-3-0)